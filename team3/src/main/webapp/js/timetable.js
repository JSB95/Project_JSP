let jsondata;
let jsonlist = [];

$(function(){
	
	$.ajax({
		url : "../timetable/getcollege",
		success : function(re){
			$("#collegebox_wrap").html(re);
			collegechange();
		}
	})
	
	let html = '<a href="#" id="btn_info">' +
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

let department = $("#departmentbox").val();

function departmentchange(){
	console.log($("#departmentbox").val());
	lectureprint(department);
}

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


let duplicationchk = true;
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
					let num = random_num;
					$('.lecture_time_list').eq(i).find('.lecture-title').html(name);
					$('.lecture_time_list').eq(i).find('.lecture-title').css('color', colorlist['font'][num]);
					$('.lecture_time_list').eq(i).find('.material-icons').css({'display': 'block','color' : colorlist['font'][num]});
					
					$('.lecture_time_list').eq(i).find('.lecture-code').html('과목코드 : ' + code);
					$('.lecture_time_list').eq(i).find('.lecture-code').css('color', colorlist['font'][num]);
					$('.lecture_time_list').eq(i).css('background-color', colorlist['background'][num]);
					$('.lecture_time_list').eq(i).hover(function(){
						$(this).css('background-color',colorlist['hover'][num]);
					}, function(){
						$(this).css('background-color',colorlist['background'][num]);
					})
					break;
					
				} else if(timelist[i] == time1[j] && timelist2[i] != ''){
					console.log("중복검사걸림");
					alert("겹친 수업 존재 : " + timelist2[i]);
					duplicationchk = false;
					deletedupli(name);
					timelist2.length = 0;
					break loop;
					
					
				}
			}
			
		}
		
		timelist2.length = 0;
	},1000);
	
});

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
			console.log("지우기");
			
		}
	}
	
}
let name;
$('#card-lecture').click(function () {
	
	alert($(this).html());
  
});


$('.lecture-time > a').click(function () {
  $('#modal-lecture-task').modal('show');
});

$("#btn_regist").on('click', function(){
	$('#modal-lecture-task').modal('show');
});



/*$(function () {
  $('[data-toggle="tooltip"]').tooltip();
});

$(function () {
  $('[data-toggle="popover"]').popover({
    container: 'body',
    html: true,
    placement: 'right',
    sanitize: false,
    content: function () {
    return $("#PopoverContent").html();
    }
  });
}); 

function li_onclick(){
	const $btn = $('#card-lecture');
	
	$btn.on('click',function(e){
		console.log(e.target);
	});
}*/

let lecturelist = [ ];
let lno = 0;
$(document).on('click','#card-lecture', function(e){
	console.log(e.target);
	console.log($(this).find('#getlname').html());
	setTimeout(function(){
		$('#modal-lecture-info').modal('show');	
	},500);
	
	
	
	lno = $(this).find('#lectureno').val();
});



$('#modal-lecture-info').on('show.bs.modal',function(){
	department = $("#departmentbox").val();
	console.log(department);
	$.ajax({
		url : "../timetable/getlectureinfo",
		data : {"lno" : lno, "department" : department},
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
			console.log("db시간 : " + ltime_db);
		}
	}); 
	
});
