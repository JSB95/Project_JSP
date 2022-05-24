

$(function(){
	//이름 체크
	$("mname").keyup(function(){
		let mname = $("#mname").val();
		let namerg = /^[가-힣]{2,10}$/;
		
		if(namerg.test(mname)){
			$("#namecheck").html("사용가능한 이름입니다.");
		}else{
			$("#namecheck").html("한글 2~10글자로 입력해주세요");
		}
	});//이름 체크 end
	
	//학번 체크
	$("")
	
	
});