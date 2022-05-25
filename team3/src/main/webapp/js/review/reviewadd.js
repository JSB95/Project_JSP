
let jsonarray;

function lecturelist(lno){
	
	$.ajax({
		url : '/team3/review/getlecture' ,
		data: {"lno": lno},
		success : function( json ){
			jsonarray = json;	/* 응답받은 데이터를 전역변수에 넣어주기 */
			tableview();
			
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
				'		<span>'+jsonarray[i]["lname"]+'</span>'+
				'		<span>'+jsonarray[i]["lprofessor"]+'</span><br>'+
				'		<span>'+jsonarray[i]["lcredit"]+'</span>'+
				'		<span>'+jsonarray[i]["ldivision"]+'</span>'+
				'		<span>'+jsonarray[i]["lcollege"]+'</span><br><br>'+
				'	</div>'+
				'	<div class="col-md-8">'+
				'		과제: <br>'+
				'<input type="hidden" id="homework">'+
				'	<span id="homelist">'+
						'<button type="button" onclick="home1()">없음</button>'+
						'<button type="button" onclick="home2()">보통</button>'+
						'<button type="button" onclick="home3()">많음</button><br>'+
					'</span>'+
				'		시험횟수: <br>'+
				'<input type="hidden" id="test">'+
				'	<span id="testlist">'+
						'<button type="button" onclick="test1()">없음</button>'+
						'<button type="button" onclick="test2()">한번</button>'+
						'<button type="button" onclick="test3()">두번</button>'+
						'<button type="button" onclick="test4()">세번이상</button><br>'+
					'</span>'+
				'		조모임: <br>'+
				'<input type="hidden" id="team">'+
				'	<span id="teamlist">'+
					'	<button type="button" onclick="team1()">없음</button>'+
					'	<button type="button" onclick="team2()">보통</button>'+
					'	<button type="button" onclick="team3()">많음</button><br>'+
					'</span>'+
				'	<br>'+
				'	</div>'+
				'</div>'+
				'<div class="row">'+
				'	<div class="col-md-4" >'+
				'		총평<br>'+
				'<input type="hidden" id="star">'+
				'	<span id="starlist">'+
				'		<img alt="" src="img/별.png">'+
				'		<img alt="" src="img/별.png">'+
				'		<img alt="" src="img/별.png">'+
				'		<img alt="" src="img/별.png">'+
				'		<img alt="" src="img/별.png"><br>'+
					'</span>'+
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

////////////////////////////////////과제버튼//////////////////////////////////////////////////////////////////
function home1(){
	$("#homework").val(1);
	$("#homelist").html( 
		'<span id="homelist">'
		+'<button class="home1" type="button" onclick="home1()">없음</button>'+
		'<button type="button" onclick="home2()">보통</button>'+
		'<button type="button" onclick="home3()">많음</button><br>'+
		'</span>'
	 );
}


function home2(){
	$("#homework").val(2);
	$("#homelist").html( 
		'<span id="homelist">'
		+'<button type="button" onclick="home1()">없음</button>'+
		'<button class="home1" type="button" onclick="home2()">보통</button>'+
		'<button type="button" onclick="home3()">많음</button><br>'+
		'</span>'
	 );
}



function home3(){
	$("#homework").val(3);
	$("#homelist").html( 
		'<span id="homelist">'
		+'<button type="button" onclick="home1()">없음</button>'+
		'<button  type="button" onclick="home2()">보통</button>'+
		'<button class="home1" type="button" onclick="home3()">많음</button><br>'+
		'</span>'
	 );
}



///////////////////////////////////////////////////과제횟수////////////////////////////////////////////////////
function test1(){
	$("#test").val(1);
	$("#testlist").html( 
		'	<span id="testlist">'+
					'<button class="home1" type="button" onclick="test1()">없음</button>'+
					'<button type="button" onclick="test2()">한번</button>'+
					'<button type="button" onclick="test3()">두번</button>'+
					'<button type="button" onclick="test4()">세번이상</button><br>'+
			'</span>'
	 );
}

function test2(){
	$("#test").val(2);
	$("#testlist").html( 
		'	<span id="testlist">'+
					'<button type="button" onclick="test1()">없음</button>'+
					'<button class="home1" type="button" onclick="test2()">한번</button>'+
					'<button type="button" onclick="test3()">두번</button>'+
					'<button type="button" onclick="test4()">세번이상</button><br>'+
			'</span>'
	 );
}

function test3(){
	$("#test").val(3);
	$("#testlist").html( 
		'	<span id="testlist">'+
					'<button type="button" onclick="test1()">없음</button>'+
					'<button type="button" onclick="test2()">한번</button>'+
					'<button class="home1" type="button" onclick="test3()">두번</button>'+
					'<button type="button" onclick="test4()">세번이상</button><br>'+
			'</span>'
	 );
}

function test4(){
	$("#test").val(4);
	$("#testlist").html( 
		'	<span id="testlist">'+
					'<button type="button" onclick="test1()">없음</button>'+
					'<button type="button" onclick="test2()">한번</button>'+
					'<button type="button" onclick="test3()">두번</button>'+
					'<button class="home1" type="button" onclick="test4()">세번이상</button><br>'+
			'</span>'
	 );
}


/////////////////////////조모임////////////////////////////////
function team1(){
	$("#team").val(1);
	$("#teamlist").html( 
	'	<span id="teamlist">'+
				'	<button class="home1" type="button" onclick="team1()">없음</button>'+
				'	<button type="button" onclick="team2()">보통</button>'+
				'	<button type="button" onclick="team3()">많음</button><br>'+
		'</span>'
	 );
}
function team2(){
	$("#team").val(2);
	$("#teamlist").html( 
	'	<span id="teamlist">'+
				'	<button type="button" onclick="team1()">없음</button>'+
				'	<button  class="home1" type="button" onclick="team2()">보통</button>'+
				'	<button type="button" onclick="team3()">많음</button><br>'+
		'</span>'
	 );
}
function team3(){
	$("#team").val(3);
	$("#teamlist").html( 
	'	<span id="teamlist">'+
				'	<button type="button" onclick="team1()">없음</button>'+
				'	<button type="button" onclick="team2()">보통</button>'+
				'	<button  class="home1" type="button" onclick="team3()">많음</button><br>'+
		'</span>'
	 );
}

