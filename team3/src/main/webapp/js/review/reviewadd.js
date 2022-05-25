
let jsonarray;

function lecturelist(lno){
	
	$.ajax({
		url : '/team3/review/getlecture' ,
		data: {"lno": lno},
		success : function( json ){
			jsonarray = json;	/* 응답받은 데이터를 전역변수에 넣어주기 */
			tableview()
			
		}
	});
	
}

function tableview(){
			let tr = '';
			for( let i = 0 ; i<jsonarray.length; i++ ){
				
				
				tr += 
				'<div id="lecture">'+
					'<span>'+jsonarray[i]["lname"]+'</span>'+
					'<span>'+jsonarray[i]["lname"]+'</span><br>'+
					'<span>'+jsonarray[i]["lname"]+'</span>'+
					'<span>'+jsonarray[i]["lname"]+'</span>'+
				'</div>'
			}
			
			$("#lecture").html( tr );
}