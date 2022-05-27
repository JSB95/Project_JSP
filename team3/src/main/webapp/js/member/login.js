function findpw(){
	let mid = $("#mid").val();
	let memail = $("#memail").val();
	$.ajax({
		url:"/team3/member/findpw",
		type: 'POST',   
		data : {"mid" : mid, "memail" : memail},
		success : function(result){
			if(result != "null"){
				alert("회원님의 비밀번호 입니다."+"\n"+result);
			}else{
				alert("일치하는 회원이 없습니다.");
			}
		}
	});
}

function findid(){
	alert("일치하는 아이디를 찾는중");
	let mname = $("#mname").val();
	let memail = $("#memail").val();
	$.ajax({
		url:"/team3/member/findid",
		type: 'POST',   
		data : {"mname" : mname, "memail" : memail},
		success : function(result){
			if(result != "null"){
				alert("회원님의 아이디 입니다."+"\n"+result);
			}else{
				alert("일치하는 회원이 없습니다.");
			}
		}
	});
}