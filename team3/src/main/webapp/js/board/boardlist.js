
let boardlist;
$( function(){
	getboardlist();

}); 


let viewcount = 10; // 현재 화면에 보이는 주문 개수 

// 스크롤 이벤트 
$(window).scroll( function(){ 
	// 만약에 스크롤이 바닥에 닿았을때 계산 
		// $(window).scroll : 브라우저(인터넷창) 스크롤
		// $(window).scrollTop() : 스크롤막대의 상단 위치
		// $(document).height() : 현재 보고 있는 문서내 높이 
		// $(window).height() : 현재 보고 있는 화면 높이 
	if( $(window).scrollTop() >= $(document).height() - $(window).height()  ){
		// 현재 스크롤의 상단 위치  >=  현재 보고 있는 문서내 높이   -  현재 보고 있는 화면 높이 
		viewcount++; // 스크롤 바닥에 닿을때 마다 출력하는 주문개수를 증가
		view(); // 새로고침
	}
});



function getboardlist(){
	$.ajax({ // 비동기로 주문 제품 리스트 가져오기 
		url : "/team3/board/boardlist" , 
		success : function( result ){
			boardlist = result;   console.log( boardlist );
			//alert(boardlist.length)
			view();
		}
	});
}

function view() {
	
	let html ="";
	
	for(let i = 0; i<boardlist.length; i++) {
		if( i == viewcount ) break; // 만약에 i가 화면에 표시할 주문수와 동일하면 출력 금지 
		html += 
		'<div class="list"> '+
		'<h2>'+boardlist[i]["btitle"]+'</h2>'+
		'<span>'+boardlist[i]["bnickname"]+'</span><span>'+boardlist[i]["bdate"]+'</span>'+
		'</div>'
		
	}
	$("#listbox").html(html);
}

function search(){
		$.ajax({ // 비동기로 주문 제품 리스트 가져오기 
		url : "/team3/board/boardsearch" , 
		success : function( result ){
			boardlist = result;   console.log( boardlist );
			//alert(boardlist.length)
			//searchview();
		}
	});
	
}

function searchview(){
	
}

