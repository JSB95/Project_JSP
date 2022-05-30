
function saveblike(mid){
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


function replywrite(bno) {
	let rcontent = $("#rcontent").val();
	$.ajax({
		url: "/team3/board/replywrite" ,
		data: { "bno":bno , "rcontent" : rcontent  } ,
		success : function( result ){
			if( result == 1 ){
				 alert("댓글작성 되었습니다."); // 성공 메시지 알림 
				 $("#rcontent").val(""); // 작성 input 공백으로 초기화 
				 $("#replytable").load( location.href+" #replytable"); // 특정 태그 새로고침
				 /* 해당 replytable 의 불러오기 = replytable */
			}
			else{ alert("댓글작성이 실패했습니다."); }
		}
	});
	
	
}