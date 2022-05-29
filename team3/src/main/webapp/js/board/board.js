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

$("#bimg").change( function( e ) { 
	/* 클라이언트가 업로드시 업로드파일의 경로 알기 */
	let reader = new FileReader();	/* 파일 읽어오는 클래스 */
	reader.readAsDataURL( e.target.files[0] ); /* readAsDataURL( 파일 ); 해당 파일 경로 찾기 */
	reader.onload = function( e ){	/* 찾은 파일의 경로 실행 -> 데이터 읽어오기 */
		$("#preview").attr( "src" , e.target.result );
	}
});

