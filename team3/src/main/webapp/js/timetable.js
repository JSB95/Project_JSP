let jsondata;
let jsonlist = [];

function isEmpty(val){
	if (val == "" || val == null || val == undefined || (val != null && typeof val == "object" && !Object.keys(val).length) || val == " "){
		return true;
	} else if ($('"#'+val+'"').html == " " || $('"#'+val+'"').html == ""){
		return true;
	} else {
		return false;
	}
}


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

$("#timetable td").bind('click', function(){
	var x = $(this).closest('tr').index();
	var y = $(this).closest('td').index();
	console.log("tr : " + x + " / td : " + y);
	
})
console.log( $('#timetable tr:eq(1)>td:eq(1)').html());

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
		time : time1
	}
	
	let asdf = time1.split("_");
	console.log(asdf);
	
	for (let i = 0; i < asdf.length; i++){
		console.log(i+" 번째 루프");
		if (asdf[i].split("/")[0] == "월"){
		
				console.log("선택된 요일 " + (i + 1) +" 번째 : 월"); 
				console.log("시간 : " + asdf[i].split("/")[1]);
				
				for(let j = 1; j < 12; j++){
					
					if ($('#timetable tr:eq(' + j + ')>td:eq(1)').html() == '' && asdf[i].split("/")[1] == j){
						$('#timetable tr:eq(' + j + ')>td:eq(1)').html(lecturedata.name);
						
					} else if ($('#timetable tr:eq(' + j + ')>td:eq(1)').html() != ''){
						console.log("선택한 시간이 존재 : " + $('#timetable tr:eq(' + j + ')>td:eq(1)').html());

					} 
					
				}
		} else if (asdf[i].split("/")[0] == "화"){

				console.log("선택된 요일 " + (i + 1) +" 번째 : 화"); 
				console.log("시간 : " + asdf[i].split("/")[1]);
				for(let j = 1; j < 12; j++){
					
					if ($('#timetable tr:eq(' + j + ')>td:eq(2)').html() == '' && asdf[i].split("/")[1] == j){
						$('#timetable tr:eq(' + j + ')>td:eq(2)').html(lecturedata.name);
						
					} else if ($('#timetable tr:eq(' + j + ')>td:eq(2)').html() != ''){
						console.log("선택한 시간이 존재 : " + $('#timetable tr:eq(' + j + ')>td:eq(2)').html());

					}
					
				}

		} else if (asdf[i].split("/")[0] == "수"){
				console.log("선택된 요일 " + (i + 1) +" 번째 : 수"); 
				console.log("시간 : " + asdf[i].split("/")[1]);
				for(let j = 1; j < 12; j++){
					
					if ($('#timetable tr:eq(' + j + ')>td:eq(3)').html() == '' && asdf[i].split("/")[1] == j){
						$('#timetable tr:eq(' + j + ')>td:eq(3)').html(lecturedata.name);
						break;
					} else if ($('#timetable tr:eq(' + j + ')>td:eq(3)').html() != ''){
						console.log("선택한 시간이 존재 : " + $('#timetable tr:eq(' + j + ')>td:eq(3)').html());
						
					}
					
				}

		} else if (asdf[i].split("/")[0] == "목"){
				console.log("선택된 요일 " + (i + 1) +" 번째 : 목"); 
				console.log("시간 : " + asdf[i].split("/")[1]);
				for(let j = 1; j < 12; j++){
					
					if ($('#timetable tr:eq(' + j + ')>td:eq(4)').html() == '' && asdf[i].split("/")[1] == j){
						$('#timetable tr:eq(' + j + ')>td:eq(4)').html(lecturedata.name);
						
					} else if ($('#timetable tr:eq(' + j + ')>td:eq(4)').html() != ''){
						console.log("선택한 시간이 존재 : " + $('#timetable tr:eq(' + j + ')>td:eq(4)').html());

					}
					
				}

		} else if (asdf[i].split("/")[0] == "금"){
				console.log("선택된 요일 " + (i + 1) +" 번째 : 금"); 
				console.log("시간 : " + asdf[i].split("/")[1]);
				for(let j = 1; j < 12; j++){
					
					if ($('#timetable tr:eq(' + j + ')>td:eq(5)').html() == '' && asdf[i].split("/")[1] == j){
						$('#timetable tr:eq(' + j + ')>td:eq(5)').html(lecturedata.name);
						
					} else if ($('#timetable tr:eq(' + j + ')>td:eq(5)').html() != ''){
						console.log("선택한 시간이 존재 : " + $('#timetable tr:eq(' + j + ')>td:eq(5)').html());
						

					}
					
				}


		} else {
			console.log("때려쳐");
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
	})
	
});