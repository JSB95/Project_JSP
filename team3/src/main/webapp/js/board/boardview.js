function saveplike(mid){
	// 
	let bno = $("#bno").val();
	
	
	$.ajax({
		url : "/team3/board/saveblike",
		data : {'mid' : mid, 'bno' : bno},
		success : function(re) {
				if (re == 1){
					alert("좋아요 등록 완료")
				}
				else if (re == 2){
					alert("좋아요 취소")
					}
				else if (re == 3){
					alert("오류발생 관리자에게문의")
					}
				// 특정 태그 새로고침 
				
				$("#like_area").load(location.href +" #like_area")
		}
	})
}