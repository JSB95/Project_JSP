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
let temp = null;
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
let codelist_dump = [];
$("#btn_regist").on('click', function(){
	
	$('#modal-lecture-info').modal('hide');
	
	var name = $(this).parent().parent().find('.lecture_title').html();
	
	var time1 = $(this).parent().parent().find('.lecture_time_db').html();
	
	var code = $(this).parent().parent().find('.lecture_code').html();
	
	let timelist = [];
	
	let codelist = [];
	
	var colorlist = [];
	
	var time1 = time1.split("_");
	
	var regex = /[^0-9]/g;
	
	$('.lecture_time_list').each(function(){
	  var text = $(this).attr('value');
	  timelist.push(text);
	  var text2 = $(this).find('.lecture-title').html();
	  timelist2.push(text2);
	  var temp = $(this).find('.lecture-code').html().replace(regex,"");
	  codelist.push(temp);
	  
	});
	
	for (let x = 0; x < codelist.length; x++){
		if (codelist[x] == code){
			alert("이미 등록한 강의입니다.");
			return;
		}
	}
	
	
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
					let num = random_num;
					
					let mon_list = [];
					let tue_list = [];
					let wed_list = [];
					let thu_list = [];
					let fri_list = [];
					$('.mon .lecture_time_list').each(function(){
						var mon = $(this).find('.lecture-code').html().replace(regex,"");
						mon_list.push(mon);
					})
					$('.tue .lecture_time_list').each(function(){
						var tue = $(this).find('.lecture-code').html().replace(regex,"");
						tue_list.push(tue);
					})
					$('.wed .lecture_time_list').each(function(){
						var wed = $(this).find('.lecture-code').html().replace(regex,"");
						wed_list.push(wed);
					})
					$('.thu .lecture_time_list').each(function(){
						var thu = $(this).find('.lecture-code').html().replace(regex,"");
						thu_list.push(thu);
					})
					$('.fri .lecture_time_list').each(function(){
						var fri = $(this).find('.lecture-code').html().replace(regex,"");
						fri_list.push(fri);
					})
					
					$('.lecture_time_list').eq(i).find('a').contents().unwrap().wrapAll('<a href="javascript:void(0)" id="info_btn">');
					$('.lecture_time_list').eq(i).find('.lecture-title').css('color', colorlist['font'][num]);
					$('.lecture_time_list').eq(i).find('.material-icons').css({'display': 'block','color' : colorlist['font'][num]});
					$('.lecture_time_list').eq(i).find('.lecture-code').css('color', colorlist['font'][num]);
					$('.lecture_time_list').eq(i).css({
						background : "linear-gradient(to left, " + colorlist['background'][num] + " 97%, " + colorlist['font'][num] + " 3%)"
					});
					$('.lecture_time_list').eq(i).hover(function(){
						$(this).css('background-color',colorlist['hover'][num]);
					}, function(){
						$(this).css('background-color',colorlist['background'][num]);
					})
					
					$('.lecture_time_list').eq(i).find('.lecture-title').html(name);
					
					
					
					$('.lecture_time_list').eq(i).find('.lecture-code').html('과목코드 : ' + code);
					
					switch (time1[j].split("/")[0]){
						case "월" : 
							for (let r = 0; r < mon_list.length; r++){
								if (code == mon_list[r]){
									console.log(r + "번째 걸림");
									$('.lecture_time_list').eq(i).find('.lecture-title').html("");
									$('.lecture_time_list').eq(i).find('.lecture-code').css('color', colorlist['background'][num]);
									$('.lecture_time_list').eq(i).find('.material-icons').css('display', 'none');
									continue loop;
								}
							}
							
							break;
							
						case "화" :
						
							for (let r = 0; r < tue_list.length; r++){
								if (code == tue_list[r]){
									console.log(r + "번째 걸림");
									$('.lecture_time_list').eq(i).find('.lecture-title').html("");
									$('.lecture_time_list').eq(i).find('.lecture-code').css('color', colorlist['background'][num]);
									$('.lecture_time_list').eq(i).find('.material-icons').css('display', 'none');
									continue loop;
								}
							}
							
							break;
							
						case "수" :
						
							for (let r = 0; r < wed_list.length; r++){
								if (code == wed_list[r]){
									console.log(r + "번째 걸림");
									$('.lecture_time_list').eq(i).find('.lecture-title').html("");
									$('.lecture_time_list').eq(i).find('.lecture-code').css('color', colorlist['background'][num]);
									$('.lecture_time_list').eq(i).find('.material-icons').css('display', 'none');
									
									
									
								}
							}
							
							break;
							
						case "목" : 
						
							for (let r = 0; r < thu_list.length; r++){
								if (code == thu_list[r]){
									console.log(r + "번째 걸림");
									$('.lecture_time_list').eq(i).find('.lecture-title').html("");
									$('.lecture_time_list').eq(i).find('.lecture-code').css('color', colorlist['background'][num]);
									$('.lecture_time_list').eq(i).find('.material-icons').css('display', 'none');
									continue loop;
								}
							}
							
							break;
							
						case "금" :
						
							for (let r = 0; r < fri_list.length; r++){
								if (code == fri_list[r]){
									console.log(r + "번째 걸림");
									$('.lecture_time_list').eq(i).find('.lecture-title').html("");
									$('.lecture_time_list').eq(i).find('.lecture-code').css('color', colorlist['background'][num]);
									$('.lecture_time_list').eq(i).find('.material-icons').css('display', 'none');
									continue loop;
								}
							}
							
							break;
						
					}
					
					break;
					
				} else if(timelist[i] == time1[j] && timelist2[i] != ''){

					alert("겹친 수업 존재 : " + timelist2[i]);
					deletedupli(code);
					timelist2.length = 0;
					break loop;

				}

			}
			
		}
			
		timelist2.length = 0;
		
	},2000);
	
});

// 중복과목 삭제 / 시간표에서 제거
function deletedupli(code){
	
	timelist2.length = 0;
	var regex = /[^0-9]/g;
	$('.lecture_time_list').each(function(){
	  var text2 = $(this).find('.lecture-code').html().replace(regex,"");
	  timelist2.push(text2);
	});
	
	for (let i = 0; i < timelist2.length; i++){
		if (timelist2[i] == code){
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
	
	setTimeout(function(){
		$('#modal-lecture-task').modal('show');
	},500);
	var regex = /[^0-9]/g;
	lno2 = $(this).find('.lecture-code').html().replace(regex, "");

	
	
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



// tooltip initializeing
$(function () {
	
	var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
	var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
		return new bootstrap.Tooltip(tooltipTriggerEl)
	})
	
});

// popover initializeing
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

// 과목삭제버튼
$("#delete_lecture").on('click',function(){
	var regex = /[^0-9]/g;
	let delete_lno = $(this).parent().parent().parent().find('.lecture_code').html();
	$('.lecture_time_list').each(function(){
	  var text2 = $(this).find('.lecture-code').html().replace(regex,"");
	  timelist2.push(text2);
	});
	$('#modal-lecture-task').modal('hide');
	for (let i = 0; i < timelist2.length; i++){
		if (timelist2[i] == delete_lno){
			$('.lecture_time_list').eq(i).find('.lecture-title').html('');
			$('.lecture_time_list').eq(i).find('.material-icons').css('display', 'none');
			$('.lecture_time_list').eq(i).find('.lecture-code').html('');
			$('.lecture_time_list').eq(i).unbind('mouseenter mouseleave');
			$('.lecture_time_list').eq(i).css('background-color','');
			$('.lecture_time_list').eq(i).css('background','');
		}
	}
	
})

function isEmpty(str){
	if(typeof str == "undefined" || str == null || str == ""){
		return true;
	} else {
		return false;
	}
}

function filter(){
	
	var value, name, item, i;
	
	value = document.getElementById("value").value;
	item = document.getElementsByClassName("card-lecture");
	
	for (i = 0; i < item.length; i++){
		name = item[i].getElementsByClassName("lecture-title");
		if(name[0].innerHTML.indexOf(value) > -1 ){
			item[i].style.display = "flex";
			
			item[i].style.flexDirection = "column";
			
 		} else {
			item[i].style.display = "none";
}
	}
}