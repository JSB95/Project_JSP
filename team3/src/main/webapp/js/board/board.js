function writecheck() {
	
	let title = $("#btitle").val()
	let content = $("#bcontent").val()
	
	if(title=="" ||content==""){
		alert("제목과 내용을 입력해주세요");
		return false;
	} else {
		$("#form_board").submit();
	}
}

