//사진 미리보기
$("#timg").change(function(e){
	alert("프리뷰");
	$("#addimgbox").hide();
	let reader = new FileReader();
	reader.readAsDataURL(e.target.files[0]);
	reader.onload = function(e){
		$("#preview").attr("src",e.target.result);
		
	}
});
//사진 추가
function addimg(){
	alert("추가");
	$("#timg").click();
}
//사진 변경
function bimgupdate(){
	addimg();
	console.log($("#timg").val());
}
