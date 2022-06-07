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
