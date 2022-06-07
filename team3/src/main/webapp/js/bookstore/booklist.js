

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


let viewcount = 3; 
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
			'	<div class="col-sm-3">'+
			'		<img width="150px" alt="" src="/team3/bookstore/bookimg/'+booklist[i]["timg"]+'">'+
			'	</div>'+
			'	<div class="col-sm-8 ms-1 bdetailbox">'+
			'		<div class="list_ttitle">'+booklist[i]["ttitle"]+'</div>'+
			'		<div class="list_tauthor">'+booklist[i]["tauthor"]+'</div>'+
			'		<div class="list_tcompany">'+booklist[i]["tcompany"]+'</div>'+
			'		<div class="list_tcondition">'+bookcondition+'</div>'+
			'		<div class="list_tprice">'+booklist[i]["tprice"]+'</div>'+
			'	</div>'+
			'</div>';
		
	}
	$("#booklistbox").html(html);
}


function search(){
	let keyword = $("#keyword").val();
	$.ajax({ 
		url : "/team3/bookstore/booklist" ,
		data : {"keyword" : keyword}, 
		success : function( result ){
			booklist = result;
			view();
		}
	});
	
}
