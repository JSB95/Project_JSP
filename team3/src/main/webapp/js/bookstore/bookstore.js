$("#timg").change(function(e){
	
	let reader = new FileReader();
	reader.readAsDataURL(e.target.files[0]);
	reader.onload = function(e){
		$("#preview").attr("src",e.target.result);
	}
});
