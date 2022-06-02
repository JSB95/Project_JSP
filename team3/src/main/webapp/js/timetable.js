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

$("#timetable td").bind('click', function(){
	var x = $(this).closest('tr').index();
	var y = $(this).closest('td').index();
	console.log("tr : " + x + " / td : " + y);
	
})

let duplicationchk = true;
let timelist2 = [];

$("#btn_regist").on('click', function(){
	
	$('#modal-lecture-info').modal('hide');
	
	var name = $(this).parent().parent().find('.lecture_title').html();
	
	var time1 = ($(this).parent().parent().find('.lecture_time_db').html());
	
	
	
	let timelist = [];
	
	var time1 = time1.split("_");
	
	$('.lecture_time_list').each(function(){
	  var text = $(this).attr('value');
	  timelist.push(text);
	  var text2 = $(this).html();
	  timelist2.push(text2);
	});
	
	
	var colorCode = "#" + Math.round(Math.random() * 0xffffff).toString(16);
	
	console.log(timelist2);
	for (let i = 0; i < timelist.length; i++){
		
		for (let j = 0; j < time1.length; j++){
			
			if (timelist[i] == time1[j] && timelist2[i] == ''){
				
				$('.lecture_time_list').eq(i).html(name);
				$('.lecture_time_list').eq(i).css('display','block').css('background', colorCode);
				console.log(timelist2);
				
			} else if(timelist[i] == time1[j] && timelist2[i] != ''){
				
				alert("겹친 수업 존재");
				duplicationchk = false
				deletedupli(name);
				timelist2.length = 0;
				return;
				
			}
		}
		
	}
	
	timelist2.length = 0;
	
});
function deletedupli(name){
	
	timelist2.length = 0;
	
	$('.lecture_time_list').each(function(){
	  var text2 = $(this).html();
	  timelist2.push(text2);
	});
	
	for (let i = 0; i < timelist2.length; i++){
		if (timelist2[i] == name){
			$('.lecture_time_list').eq(i).empty();
			$('.lecture_time_list').eq(i).removeAttr("style");
		}
	}
	
	
	
}
let name;
$('#card-lecture').click(function () {
	
	alert($(this).html());
  
});

$(function(){
	$('#card-lecture').click(function(){
		alert("클릭");
	})
})

$('.lecture-time > a').click(function () {
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
			$(".lecutre_code").html(lno);
			$(".lecture_professor").html(lprofessor);
			$(".lecture_time_db").html(ltime_db);
			modal.find('#modal-lecture-info .lecture-title').html('test');
			modal.find('.lecture_time').html(ltime);
			modal.find('.lecutre_code').html(lno);
			modal.find('.lecture_professor').html(lprofessor);
			modal.find('.lecture_time_db').html(ltime_db);
			console.log("db시간 : " + ltime_db);
		}
	}); 
	
});
