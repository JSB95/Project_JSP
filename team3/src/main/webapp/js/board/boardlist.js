
let boardlist;
let comentcount;
$( function(){
	getboardlist();
	

}); 


let viewcount = 10; // 현재 화면에 보이는 주문 개수 

// 스크롤 이벤트 
let sss =$(window).scroll( function(){ 
	
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
	$.ajax({ 
		url : "/team3/board/boardlist" , 
		success : function( result ){
			boardlist = result;   console.log( boardlist );
			//alert(boardlist.length)
			view();
			
		}
	});
}




function getsearchlist(){
	
	let key = $("#key").val()
	let keyword = $("#keyword").val()
		$.ajax({ 
		url : "/team3/board/boardlist" ,
		data : {"key" : key, "keyword" : keyword}, 
		success : function( result ){
			boardlist = result;   console.log( boardlist );
			//alert(boardlist.length)
			//searchview();
			
			view();
		}
	});
	
}


function boardbest() {
	alert("gd")
	$.ajax({
		url : "/team3/board/bestlist",
		
		success : function (result) {
			boardlist = result;
			view();
		}
	});
}

function view() {
	let html ="";
	
	for(let i = 0; i<boardlist.length; i++) {
		if( i >= viewcount ) break; // 만약에 i가 화면에 표시할 주문수와 동일하면 출력 금지 
		html += 
		'<div id="list" onclick="location.href=\'boardview.jsp?bno='+boardlist[i]["bno"]+'\'">'+
		'<h2>'+boardlist[i]["btitle"]+'</h2>'+
		'<span>'+boardlist[i]["bnickname"]+'</span><span>' +boardlist[i]["bdate"]+  '</span>'+
		'<span><img src="/team3/board/upload/blike.svg" id ="cicon"> '+boardlist[i]["blike"]+' </span>'+
		'<span><img src="/team3/board/upload/bcomment.svg" id ="cicon"> '+boardlist[i]["rcount"]+' </span>'+
		'</div>'
		
	}
	$("#listbox").html(html);
}

/*
function view2() {
	let html ="";
	
	for(let i = 0; i<searchlist.length; i++) {
		if( i == viewcount ) break; // 만약에 i가 화면에 표시할 주문수와 동일하면 출력 금지 
		html += 
		'<div class="list"> '+
		'<h2>'+searchlist[i]["btitle"]+'</h2>'+
		'<span>'+searchlist[i]["bnickname"]+'</span><span>'+searchlist[i]["bdate"]+'</span>'+
		'</div>'
		
	}
	$("#listbox").html(html);
}
*/



