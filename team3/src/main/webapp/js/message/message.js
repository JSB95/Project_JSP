let jsonarray;

function read(mnum){
		
		
	
	
			$.ajax({
			url : '/team3/message/getmessage' ,
			data: {"mnum": mnum},
			success : function( json ){
				jsonarray = json;	
				tableview();
				
				$.ajax({
				url : '/team3/message/read' ,
				data: {"mnum": mnum},
				success : function( result ){
					}
				});
				
				
	}});
	
}

function tableview(){
			let tr = '';
			let bt = '';
			for( let i = 0 ; i<jsonarray.length; i++ ){
					
				tr += 
				' <div class="modal-body" id="mcontent">'+
					'<span>'+jsonarray[i]["mid"]+'</span>'+
					'<span>'+jsonarray[i]["mtime"]+'</span><br>'+
			       '<p>'+jsonarray[i]["mcontent"]+'</p>'+
			   '  </div>';
			  
			}
			for( let i = 0 ; i<jsonarray.length; i++ ){
				
			   bt+=
			  '<button type="button" id="send" class="btn btn-primary" onclick="send(\''+jsonarray[i]["mid"]+'\','+jsonarray[i]["msendno"]+')">답장</button>'
			   
			}
		
			$("#mcontent").html( tr );
			$("#send").html(bt );
}

function send(mid,sendno){
	$("#mcontent").html( 
	'<div class="container">'+
			'<p>'+mid+'님</p>'+
			'<input type="hidden" id="getno" value="'+sendno+'">'+
			'<textarea rows="20" cols="40" id="content"></textarea>'+
		'</div>'
);
	$("#send").html( 
	 '<button type="button" id="send" class="btn btn-primary" onclick="reply()">답장</button>'
);

}


function reply(){
	let mcontent = $("#content").val();
	let getno = $("#getno").val();
	
	$.ajax({
			url : '/team3/message/send' ,
			data: {"getno": getno , "mcontent": mcontent },
			success : function( result ){
				alert("메시지를 성공적으로 보냈습니다.");
				location.reload();
			}
		});
}

function close(){
	alert("??");
	location.reload();
}