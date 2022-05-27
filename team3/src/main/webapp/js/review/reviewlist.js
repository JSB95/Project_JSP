
$(function(){
	getreviewlist();

})

function gettotallist(){
	
	$.ajax({
		url : '/team3/review/gettotallist' ,
		data: {},
		success : function(  ){
			
		}
	});
}
