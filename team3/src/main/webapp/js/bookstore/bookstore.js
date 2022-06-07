//사진 미리보기
$("#timg").change(function(e){
	$("#addimgbox").hide();
	let reader = new FileReader();
	reader.readAsDataURL(e.target.files[0]);
	reader.onload = function(e){
		$("#preview").attr("src",e.target.result);
		
	}
});
//사진 추가
function addimg(){
	$("#timg").click();
}
//사진 삭제
function bimgdelete(tno){
	
		alert("삭제중");
	$.ajax({
		url : "bimgdelete" ,
		data : { "tno" : tno },
		success : function( result ){
			if(result == "1"){
				alert("첨부파일삭제완료");
				location.reload();
			}else {
				alert("첨부파일삭제오류");
			}
		}
	});
}