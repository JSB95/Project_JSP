
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
	var anonymous = $('input:checkbox[id="anonymous"]').is(':checked');
	alert(anonymous);
	$.ajax({
		url: "/team3/board/replywrite" ,
		data: { "bno":bno , "rcontent" : rcontent ,"anonymous" :anonymous} ,
		success : function( result ){
			if( result == 1 ){
				 alert("댓글작성 되었습니다."); // 성공 메시지 알림 
				 $("#rcontent").val(""); // 작성 input 공백으로 초기화 
				 $("#wrap").load( location.href+" #wrap"); // 특정 태그 새로고침
				 
				
			}
			else{ alert("댓글작성이 실패했습니다."); }
		}
	});
	
	
	
}


// 댓글 수정창 줄력


function updateview(rno,rcontent,bno){ // 댓글수정창 표시 메소드 
	
	// JS 작성 공간 에서는 HTML 작성 불가능 --> HTML 문자처리 
		$("#"+rno).html(
			'<div class="rwirte_area">'+
				'<textarea  rows="4" cols="50" name="upcontent" id="upcontent"  > '+rcontent+'</textarea>'+
			'<button type="button" id="rwrite" onclick="replyupdate('+rno+','+bno+')">등록</button>'+	
			'</div>'+	
			'<span> <input id="anonymous" type="checkbox" value="익명" name="anonymous"> 익명</span>'
		);	
}

function replydelete( rno ){
	$.ajax({
		url : "/team3/board/replydelete" , 
		data : { "rno" : rno } , 
		success : function( result ){
			if( result == 1 ){
				alert("댓글 삭제 되었습니다.");
				$("#wrap").load( location.href+" #wrap"); // 특정 태그 새로고침
			}
			else{ alert("삭제 실패(관리자에게 문의)"); } 
		}
	});
}

function replyupdate(rno ,bno){ // 수정쓰기메소드
	let upcontent= $("#upcontent").val();
	var anonymous = $('input:checkbox[id="anonymous"]').is(':checked');
	//alert(rno)
	//alert(bno)
	alert(upcontent);
	$.ajax({
		url : "/team3/board/replyupdate" , 
		data : { "rno" : rno ,"upcontent":upcontent,"bno":bno ,"anonymous" :anonymous } ,
		success : function( result ){
			if( result ==1 ){
				alert("댓글 수정 되었습니다.");
				 $("#rcontent").val(""); // 작성 input 공백으로 초기화 
				 $("#wrap").load( location.href+" #wrap"); // 특정 태그 새로고침
			}
			else{ alert("수정 실패했습니다."); }
		}
	});
}