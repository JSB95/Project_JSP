function 등록(){
	var 취득학점 = 0;
	var 전체총점 = 0;
	var 전체갯수 = 0;
	var 전공총점 = 0;
	var 전공갯수 = 0;
	var 전체평점 = 0;
	var 전공평점 = 0;
	
	
	
		for(let i=0;i<10;i++){
			
			let 학점 =	document.getElementById("학점"+i).value;
			let 학점체크 = /^[0-9]$/;	
			
			if( !(학점체크.test(학점) &&$("#학점"+i).val()!="") &&$("#성적"+i).val()!="none"){alert("올바른 학점을 입력해주세요[1-10]"); return; }else{
				if($("#학점"+i).val()!=""&&$("#성적"+i).val()!="none"&&$("#성적"+i).val()!="NP"&&$("#성적"+i).val()!="0"){
					취득학점+= parseInt($("#학점"+i).val());
					}
				if($("#학점"+i).val()!=""&&$("#성적"+i).val()!="none"&&$("#성적"+i).val()!="P"&&$("#성적"+i).val()!="NP"){
					전체총점+= (parseInt($("#학점"+i).val())*parseFloat($("#성적"+i).val()));
					전체갯수++;
					}
				if($('input:checkbox[id="전공'+i+'"]').is(':checked')==true&&$("#학점"+i).val()!=""&&$("#성적"+i).val()!="none"&&$("#성적"+i).val()!="P"&&$("#성적"+i).val()!="NP"){
					전공총점+= (parseInt($("#학점"+i).val())*parseFloat($("#성적"+i).val()));
					전공갯수++;
					}
				}
			
	   		
		}
		전체평점 = 전체총점/전체갯수;
		전공평점 = 전공총점/전공갯수;
		전체평점소수점 =Math.round(전체평점 * 100)/100;
		전공평점소수점 =Math.round(전공평점 * 100)/100;
		$("#전체평점").html(
			'<div id="전체평점">전체평점<br>'+전체평점소수점+'</div>'
		);
		if(!isNaN(전공평점소수점)){
			$("#전공평점").html(
				'<div id="전공평점">전공평점<br>'+전공평점소수점+'</div>'
			);
		}else{
			$("#전공평점").html(
				'<div id="전공평점">전공평점<br>0.0</div>'
			);
		}
		$("#취득학점").html(
			'<div id="취득학점">취득학점<br>'+취득학점+'</div>'
		);
	
}