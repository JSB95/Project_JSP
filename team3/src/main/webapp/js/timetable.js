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
console.log( $('#timetable tr:eq(1)>td:eq(1)').html());

$("#btn_regist").on('click', function(){
	$('#modal-lecture-info').modal('hide');
	var name = $(this).parent().parent().find('.lecture_title').html();
	var professor = $(this).parent().parent().find('.lecture_professor').html();
	
	var time1 = ($(this).parent().parent().find('.lecture_time_db').html());	
	var str = "";
	var arr = new Array();
	var tr = $(this);
	var td = tr.children();
	td.each(function(i){
		arr.push(td.eq(i).text());
	});
	console.log("배열에 담긴 값 : "+arr);
	
	
	let lecturedata = {
		name : name,
		time : time1
	}
	let error = 0;
	let asdf = time1.split("_");
	console.log(asdf);
	
	for (let i = 0; i < asdf.length; i++){
		
		switch(asdf[i].split("/")[0]){
			case '월' : 
				console.log("선택된 요일 " + (i + 1) +" 번째 : 월"); 
				console.log("시간 : " + asdf[i].split("/")[1]);
				
				for (let j = i + 1; j < 12; j++){
				
					if ($('#timetable tr:eq(' + j + ')>td:eq(1)').html() == '' && asdf[i].split("/")[1] == j){
						
						$('#timetable tr:eq(' + j + ')>td:eq(1)').html(lecturedata.name);
						console.log("i	값 : " + i + " j값 : " + j);
						break;
	
					} else if ($('#timetable tr:eq(' + j + ')>td:eq(1)').html() != '' && asdf[i].split("/")[1] == j){
						
						console.log("i	값 : " + i + " j값 : " + j);
						error = -1;
						alert("오류");
						break;

					}
				
				}
				
				break;
			case '화' : 
				console.log("선택된 요일 " + (i + 1) +" 번째 : 화"); 
				console.log("시간 : " + asdf[i].split("/")[1]);
				
				for (let j = i + 1; j < 12; j++){
				
					if ($('#timetable tr:eq(' + j + ')>td:eq(2)').html() == '' && asdf[i].split("/")[1] == j){
						
						$('#timetable tr:eq(' + j + ')>td:eq(2)').html(lecturedata.name);
						console.log("i	값 : " + i + " j값 : " + j);
						break;
	
					} else if ($('#timetable tr:eq(' + j + ')>td:eq(2)').html() != ''  && asdf[i].split("/")[1] == j){
						
						console.log("i	값 : " + i + " j값 : " + j);
						error = -1;
						alert("오류");
						break;

					}
				
				}
				
				break;
			case '수' : 
				console.log("선택된 요일 " + (i + 1) +" 번째 : 수"); 
				console.log("시간 : " + asdf[i].split("/")[1]);
				
				for (let j = i + 1; j < 12; j++){
				
					if ($('#timetable tr:eq(' + j + ')>td:eq(3)').html() == '' && asdf[i].split("/")[1] == j){
						
						$('#timetable tr:eq(' + j + ')>td:eq(3)').html(lecturedata.name);
						console.log("값 넣기 / i	값 : " + i + " j값 : " + j);
						break;
	
					} else if ($('#timetable tr:eq(' + j + ')>td:eq(3)').html() != '' && asdf[i].split("/")[1] == j){
						
						console.log("i	값 : " + i + " j값 : " + j);
						alert("오류");
						error = -1;
						break;

					}
				
				}
				break;
			case '목' : 
				console.log("선택된 요일 " + (i + 1) +" 번째 : 목"); 
				console.log("시간 : " + asdf[i].split("/")[1]);
				
				for (let j = i + 1; j < 12; j++){
				
					if ($('#timetable tr:eq(' + j + ')>td:eq(4)').html() == '' && asdf[i].split("/")[1] == j){
						
						$('#timetable tr:eq(' + j + ')>td:eq(4)').html(lecturedata.name);
						console.log("i	값 : " + i + " j값 : " + j);
						break;
	
					} else if ($('#timetable tr:eq(' + j + ')>td:eq(4)').html() != ''  && asdf[i].split("/")[1] == j){
						
						console.log("i	값 : " + i + " j값 : " + j);
						alert("오류");
						error = -1;
						break;

					}
				
				}
				
				break;
			case '금' : 
				console.log("선택된 요일 " + (i + 1) +" 번째 : 금"); 
				console.log("시간 : " + asdf[i].split("/")[1]);
				
				for (let j = i + 1; j < 12; j++){
				
					if ($('#timetable tr:eq(' + j + ')>td:eq(5)').html() == '' && asdf[i].split("/")[1] == j){
						
						$('#timetable tr:eq(' + j + ')>td:eq(5)').html(lecturedata.name);
						console.log("i	값 : " + i + " j값 : " + j);
						break;
	
					} else if ($('#timetable tr:eq(' + j + ')>td:eq(5)').html() != '' && asdf[i].split("/")[1] == j){
						
						console.log("i	값 : " + i + " j값 : " + j);
						alert("오류");
						error = -1;
						break;

					}
				
				}
				
				break;
				
				
		}
		
		/*
		for (let j = i + 1; j < 12; j++){
			
			if (asdf[i].split("/")[0] == "월"){
		
				console.log("선택된 요일 " + (i + 1) +" 번째 : 월"); 
				console.log("시간 : " + asdf[i].split("/")[1]);

				if ($('#timetable tr:eq(' + j + ')>td:eq(1)').html() == '' && asdf[i].split("/")[1] == j){
					
					$('#timetable tr:eq(' + j + ')>td:eq(1)').html(lecturedata.name);

				} else if ($('#timetable tr:eq(' + j + ')>td:eq(1)').html() != '' && $('#timetable tr:eq(' + j + ')>td:eq(1)').html() != (lecturedata.name)){
					
					console.log("선택한 시간이 존재 : " + $('#timetable tr:eq(' + j + ')>td:eq(1)').html());
					
				} else {
					console.log("여기서 막힘");
				}
				
			} else if (asdf[i].split("/")[0] == "화"){
				
				console.log("선택된 요일 " + (i + 1) +" 번째 : 화"); 
				console.log("시간 : " + asdf[i].split("/")[1]);
				
				if ($('#timetable tr:eq(' + j + ')>td:eq(2)').html() == '' && asdf[i].split("/")[1] == j){
					
						$('#timetable tr:eq(' + j + ')>td:eq(2)').html(lecturedata.name);
						
				} else if ($('#timetable tr:eq(' + j + ')>td:eq(2)').html() != '' && $('#timetable tr:eq(' + j + ')>td:eq(2)').html() != (lecturedata.name)){
					
						alert("선택한 시간이 존재 : " + $('#timetable tr:eq(' + j + ')>td:eq(2)').html());
						break;

				}

			} else if (asdf[i].split("/")[0] == "수"){
				
				console.log("선택된 요일 " + (i + 1) +" 번째 : 수"); 
				console.log("시간 : " + asdf[i].split("/")[1]);
				console.log(j + "번째 루프[j]");
				if ($('#timetable tr:eq(' + j + ')>td:eq(3)').html() == '' && asdf[i].split("/")[1] == j){
					
					$('#timetable tr:eq(' + j + ')>td:eq(3)').html(lecturedata.name);

				} else if ($('#timetable tr:eq(' + j + ')>td:eq(3)').html() != '' && $('#timetable tr:eq(' + j + ')>td:eq(3)').html() != (lecturedata.name)){
					
					alert("선택한 시간이 존재 : " + $('#timetable tr:eq(' + j + ')>td:eq(3)').html() + "강으명 : " + lecturedata.name);
					break;
					
				}
				
			} else if (asdf[i].split("/")[0] == "목"){
				
				console.log("선택된 요일 " + (i + 1) +" 번째 : 목"); 
				console.log("시간 : " + asdf[i].split("/")[1]);

				if ($('#timetable tr:eq(' + j + ')>td:eq(4)').html() == '' && asdf[i].split("/")[1] == j){
					
					$('#timetable tr:eq(' + j + ')>td:eq(4)').html(lecturedata.name);
					
				} else if ($('#timetable tr:eq(' + j + ')>td:eq(4)').html() != '' && $('#timetable tr:eq(' + j + ')>td:eq(3)').html() != (lecturedata.name)){
					
					alert("선택한 시간이 존재 : " + $('#timetable tr:eq(' + j + ')>td:eq(4)').html());
					break;

				}
					

				
			} else if (asdf[i].split("/")[0] == "금"){
				
				console.log("선택된 요일 " + (i + 1) +" 번째 : 금"); 
				console.log("시간 : " + asdf[i].split("/")[1]);
					
				if ($('#timetable tr:eq(' + j + ')>td:eq(5)').html() == '' && asdf[i].split("/")[1] == j){
					
					$('#timetable tr:eq(' + j + ')>td:eq(5)').html(lecturedata.name);
					
				} else if ($('#timetable tr:eq(' + j + ')>td:eq(5)').html() != '' && $('#timetable tr:eq(' + j + ')>td:eq(3)').html() != (lecturedata.name)){
					
					
					alert("선택한 시간이 존재 : " + $('#timetable tr:eq(' + j + ')>td:eq(5)').html());
					break;
				}
				
			} else {
				console.log("때려쳐");
			}
		}
		*/
		
		if (error == -1){
			alert("error 발생");
			for (let x = 1; x < 6; x++){
				for (let y = 1; y < 12; y++){
					console.log("error난 과목명 : " + lecturedata.name);
					if (lecturedata.name == $('#timetable tr:eq(' + y + ')>td:eq('+ x +')').html()){
						$('#timetable tr:eq(' + y + ')>td:eq('+ x +')').empty();
					}
				}
			}
		}
	}
	
	
	let jsondata = JSON.stringify(lecturedata);

	console.table(lecturedata);
	$.ajax({
		url : "../timetable/lecturechoice",
		data : {"jsondata" : jsondata},
		success : function(re){
			console.log("강의 선택 통신");
		}
	});
	
	if (error == -1){
		
	}
	
});
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
