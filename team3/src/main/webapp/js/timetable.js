let jsondata;
let jsonlist = [];


$(function(){
	
	$.ajax({
		url : "../timetable/getcollege",
		success : function(re){
			console.log(re);
			$("#collegebox").html(re);
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
			$("#departmentbox").html(re);
			departmentchange();
		}
	})
}

function departmentchange(){
	let department = $("#departmentbox").val();
	console.log($("#departmentbox").val());
	lectureprint(department);
}


function lectureprint(department){
		$.ajax({
			url : "../timetable/getlecturelist",
			data : {"department" : department},
			success : function(re){
				$("#lecturelist").html(re);
			}
		})
}

$("#lecturelist").on('click', 'tr', function(){
	var str = "";
	var arr = new Array();
	var tr = $(this);
	var td = tr.children();
	td.each(function(i){
		arr.push(td.eq(i).text());
	});
	console.log("배열에 담긴 값 : "+arr);
	var name = td.eq(0).text();
	var professor = td.eq(1).text();
	var time = td.eq(2).text();
	var credit = td.eq(3).text();
	var time1 = td.eq(4).text();
	
	str +=	" * 클릭된 Row의 td값 = 강의명 : <font color='red'>" + name + "</font>" +
					", 교수명 : <font color='red'>" + professor + "</font>" +
					", 시간 : <font color='red'>" + time + "</font>" +
					", 학점 : <font color='red'>" + credit + "</font>";
	$("#tablechoice").html(str);
	
	
	let lecturedata = {
		name : name,
		time : time
	}

	console.table(lecturedata);
	$.ajax({
		url : "../timetable/lecturechoice",
		data : {"name" : name, "time" : time1},
		success : function(re){
			console.log("강의 선택 통신");
		}
	})
	
});