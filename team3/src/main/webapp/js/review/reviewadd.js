
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
				'<div class="tableviewbox">'+
				'<div class="row">'+
				'	<div class="col-md-4" id="lecture">'+
				'		<span>과목명</span>'+
				'		<span>교수명</span><br>'+
				'		<span>학점</span>'+
				'		<span>이수구분</span>'+
				'		<span>공과대학</span><br><br>'+
				'	</div>'+
				'	<div class="col-md-8">'+
				'		과제: <br>'+
				'		<button>없음</button><button>보통</button><button>많음</button><br>'+
				'		시험횟수: <br>'+
				'		<button>없음</button><button>한번</button><button>두번</button><button>세번이상</button><br>'+
				'		조모임: <br>'+
				'	<button>없음</button><button>보통</button><button>많음</button><br>'+
				'		<br>'+
				'	</div>'+
				'</div>'+
				'<div class="row">'+
				'	<div class="col-md-4" >'+
				'		총평<br>'+
				'		<img alt="" src="img/별.png">'+
				'		<img alt="" src="img/별.png">'+
				'		<img alt="" src="img/별.png">'+
				'		<img alt="" src="img/별.png">'+
				'		<img alt="" src="img/별.png"><br>'+
				'		<br>'+
				'	</div>'+
				'	<div class="col-md-8">'+
				'		<textarea rows="10" cols="80"></textarea><br>'+
				'	</div>'+
			'	</div>'
			'</div>'
			}
			
			$("#tableviewbox").html( tr );
}