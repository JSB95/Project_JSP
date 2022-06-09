

let booklist ;

$(function(){
	$.ajax({
		url : "/team3/bookstore/getbooklist",
		success : function(jsonarray) {
			
			booklist = jsonarray;  
			view();
		}
	});
})


let viewcount = 4; 
$(window).scroll(function(){
	if($(window).scrollTop() + 50 >= $(document).height() - $(window).height()){
		viewcount++; 
		view();
	}
});


function view(){
	let html ="";
	
	for(let i = 0; i<booklist.length; i++) {
		if( i >= viewcount ) break; 
		
		let bookcondition ="";
			if(booklist[i]["tcondition"] == "1"){
				bookcondition = '상';
			}else if(booklist[i]["tcondition"] == "2"){
				bookcondition = "중";
			}else {
				bookcondition = "하";
			}
		console.log(booklist[i]["tcondition"]);
		console.log(bookcondition);
		html +=  '<div class="row bookbox my-3" onclick="location.href=\'/team3/bookstore/bookview.jsp?tno='+booklist[i]["tno"]+'\';">'+
			'	<div class="col-sm-3 text-center">'+
			'		<img width="120px" alt="" src="/team3/bookstore/bookimg/'+booklist[i]["timg"]+'">'+
			'	</div>'+
			'	<div class="col-sm-8 ms-1 bdetailbox">'+
			'		<div class="list_ttitle">'+booklist[i]["ttitle"]+'</div>'+
						'<table>'+
						'   <tr>'+
						'       <td class="book-info">저자</td>'+
						'       <td class="list_tauthor">'+booklist[i]["tauthor"]+'</td>'+
						'   </tr>'+
						'    <tr>'+
						'       <td class="book-info">출판사</td>'+
						'       <td class="list_tcompany">'+booklist[i]["tcompany"]+'</td>'+
						'   </tr>'+
						'    <tr>'+
						'       <td class="book-info">상태</td>'+
						'       <td class="list_tcondition">'+bookcondition+'</td>'+
						'   </tr>'+
						'    <tr>'+
						'       <td class="book-info">가격</td>'+
						'       <td class="list_tprice">'+booklist[i]["tprice"]+'</td>'+
						'   </tr>'+
						'</table>'+
			'	</div>'+
			'</div>';
		
	}
	$("#booklistbox").html(html);
}


function search(){
	let keyword = $("#keyword").val();
	$.ajax({ 
		url : "/team3/bookstore/getbooklist" ,
		data : {"keyword" : keyword}, 
		success : function( result ){
			booklist = result;
			view();
		}
	});
	
}
