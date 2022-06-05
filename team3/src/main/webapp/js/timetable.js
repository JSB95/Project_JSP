// 셀렉트 박스, 강의목록 넣기
$(function(){
	
	$.ajax({
		url : "../timetable/getcollege",
		success : function(re){
			$("#collegebox_wrap").html(re);
			collegechange();
		}
	})
	
	let html = '<a href="javascript:void(0)">' +
                    '<div class="lecture-info">' + 
                        '<h6 class="lecture-title"></h6>' +
                        '<h6 class="lecture-code"></h6>' +
                    '</div>' +
                    '<div class="lecture-noti" data-toggle="tooltip" data-placement="top" title="" data-original-title="과제 설명 텍스트 과제 설명 텍스트 과제 설명 텍스트">' +
                        '<i class="material-icons ic-lecture-noti">assignment</i>' +
                        '<span class="lecture-noti-title"></span>' +
                    '</div>' +
                '</a>' ;
    $('.lecture_time_list').html(html);
    $('.lecture_time_list').css('','');
    $('.lecture_time_list').find('.material-icons').css('display', 'none');
	

})

// 단과대 변경시 학과목록 변경
function collegechange(){
	let college = $("#collegebox").val();
	$.ajax({
		url : "../timetable/getdepartment",
		data : {"college" : college},
		success : function(re){
			$("#departmentbox_wrap").html(re);
			departmentchange();
		}
	})
}

// 학과 변경시 강의navbar변경
let department;
function departmentchange(){
	department = $("#departmentbox").val();
	lectureprint(department);
}

// 강의목록 출력
function lectureprint(department1){
	
	department1 = $("#departmentbox").val();
	
	$.ajax({
		url : "../timetable/getlecturelist",
		data : {"department1" : department1},
		success : function(re){
			$("#lecturelist_wrap").html(re);
		}
	})

}

// info modal show
let lno = 0;
$(document).on('click','#card-lecture', function(e){
	
	setTimeout(function(){
		$('#modal-lecture-info').modal('show');	
	},500);
	
	lno = $(this).find('#lectureno').val();
});

// 강의 클릭시 모달
$('#modal-lecture-info').on('show.bs.modal',function(){

	$.ajax({
		url : "../timetable/getlectureinfo",
		data : {"lno" : lno},
		success : function(json){
			jsondata = json;
			var ltime = jsondata['ltime'];
			var lname = jsondata["lname"];
			var lno = jsondata['lno'];
			var lprofessor = jsondata['lprofessor'];
			var ltime_db = jsondata['ltime_db'];
			var modal = $(this);
			
			$(".lecture_title").html(lname);
			$(".lecture_time").html(ltime);
			$(".lecture_code").html(lno);
			$(".lecture_professor").html(lprofessor);
			$(".lecture_time_db").html(ltime_db);
			modal.find('#modal-lecture-info .lecture-title').html('test');
			modal.find('.lecture_time').html(ltime);
			modal.find('.lecture_code').html(lno);
			modal.find('.lecture_professor').html(lprofessor);
			modal.find('.lecture_time_db').html(ltime_db);
		
		}
	}); 
	
});

// 과목등록 클릭시 시간표에 추가
let timelist2 = [];
$("#btn_regist").on('click', function(){
	
	$('#modal-lecture-info').modal('hide');
	
	var name = $(this).parent().parent().find('.lecture_title').html();
	
	var time1 = $(this).parent().parent().find('.lecture_time_db').html();
	
	var code = $(this).parent().parent().find('.lecture_code').html();
	
	let timelist = [];
	
	var colorlist = [];
	
	var time1 = time1.split("_");
	
	$('.lecture_time_list').each(function(){
	  var text = $(this).attr('value');
	  timelist.push(text);
	  var text2 = $(this).find('.lecture-title').html();
	  timelist2.push(text2);
	});
	
	
	$.ajax({
		url : "../timetable/getcolorlist",
		success : function(colorlist_json){
			colorlist = colorlist_json;
		}
	})
	var random_num = Math.floor(Math.random() * 10);
	setTimeout(function(){
		loop:
		for (let i = 0; i < timelist.length; i++){
			
			for (let j = 0; j < time1.length; j++){
				
				if (timelist[i] == time1[j] && timelist2[i] == ''){
					$('.lecture_time_list').eq(i).find('a').contents().unwrap().wrapAll('<a href="javascript:void(0)" id="info_btn">');
					let num = random_num;
					$('.lecture_time_list').eq(i).find('.lecture-title').html(name);
					$('.lecture_time_list').eq(i).find('.lecture-title').css('color', colorlist['font'][num]);
					$('.lecture_time_list').eq(i).find('.material-icons').css({'display': 'block','color' : colorlist['font'][num]});
					
					$('.lecture_time_list').eq(i).find('.lecture-code').html('과목코드 : ' + code);
					$('.lecture_time_list').eq(i).find('.lecture-code').css('color', colorlist['font'][num]);
					$('.lecture_time_list').eq(i).css({
						background : "linear-gradient(to left, " + colorlist['background'][num] + " 97%, " + colorlist['font'][num] + " 3%)"
					});
					
					$('.lecture_time_list').eq(i).hover(function(){
						$(this).css('background-color',colorlist['hover'][num]);
					}, function(){
						$(this).css('background-color',colorlist['background'][num]);
					})
					
					break;
					
				} else if(timelist[i] == time1[j] && timelist2[i] != ''){

					alert("겹친 수업 존재 : " + timelist2[i]);
					deletedupli(name);
					timelist2.length = 0;
					break loop;
					
					
				}
			}
			
		}
		
		timelist2.length = 0;
	},1000);
	
});

// 중복과목 삭제 / 시간표에서 제거
function deletedupli(name){
	
	timelist2.length = 0;
	
	$('.lecture_time_list').each(function(){
	  var text2 = $(this).find('.lecture-title').html();
	  timelist2.push(text2);
	});
	
	for (let i = 0; i < timelist2.length; i++){
		if (timelist2[i] == name){
			$('.lecture_time_list').eq(i).find('.lecture-title').html('');
			$('.lecture_time_list').eq(i).find('.material-icons').css('display', 'none');
			$('.lecture_time_list').eq(i).find('.lecture-code').html('');
			$('.lecture_time_list').eq(i).unbind('mouseenter mouseleave');
			$('.lecture_time_list').eq(i).css('background-color','');
			$('.lecture_time_list').eq(i).css('background','');
		}
	}
	
}

let lno2 = 0;
// task modal show
$(document).on('click','#info_btn',function(){
	console.log($(this).parent().html());
	setTimeout(function(){
		$('#modal-lecture-task').modal('show');
	},500);
	var regex = /[^0-9]/g;
	lno2 = $(this).find('.lecture-code').html().replace(regex, "");

	console.log("정규식 결과 : " + lno2);
	
})

// 시간표 강의 클릭시 모달
$('#modal-lecture-task').on('show.bs.modal',function(){
	
	$.ajax({
		url : "../timetable/getlectureinfo",
		data : {"lno" : lno2},
		success : function(json){
			jsondata = json;
			var ltime = jsondata['ltime'];
			var lname = jsondata["lname"];
			var lno = jsondata['lno'];
			var lprofessor = jsondata['lprofessor'];
			var ltime_db = jsondata['ltime_db'];
			var modal = $(this);
			
			$(".lecture_title").html(lname);
			$(".lecture_time").html(ltime);
			$(".lecture_code").html(lno);
			$(".lecture_professor").html(lprofessor);
			$(".lecture_time_db").html(ltime_db);
			modal.find('#modal-lecture-info .lecture-title').html('test');
			modal.find('.lecture_time').html(ltime);
			modal.find('.lecture_code').html(lno);
			modal.find('.lecture_professor').html(lprofessor);
			modal.find('.lecture_time_db').html(ltime_db);
		
		}
	}); 
	
})




$(function () {
	
	var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
	var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
		return new bootstrap.Tooltip(tooltipTriggerEl)
	})
	
});

/*$(function () {
	


});*/ 

$(function(){
	//var myDefaultAllowList = bootstrap.Tooltip.Default.allowList;
	//myDefaultAllowList.input = ['class'];
	//myDefaultAllowList.textarea = ['class'];
	//console.log(myDefaultAllowList);
	
	var popover = new bootstrap.Popover(document.querySelector('[data-bs-toggle="popover"]'),{
	    container: 'body',
	    html: true,
	    placement: 'auto',
	    sanitize: false,
	    content: function () {
	    	return $("#PopoverContent").html();
	    }
  });
})
