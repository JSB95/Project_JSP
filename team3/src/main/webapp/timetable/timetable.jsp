<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="/team3/css/timetable/timetable.css" rel="stylesheet">
</head>
<body>

	<div class="container">
		
		<div class="row">
		
			<div class="col-md-6 selectbox">
			
				<select id="collegebox" onchange="collegechange()">
				
				</select>
				
				<select id="departmentbox" onchange="departmentchange()">
				
				</select>
				
				<div id="tablechoice">
					
				</div>
				
				<br><br><br>
				
				<div>
				
					<table class="timetable" id="timetable">
						
						  <tr style="width: 100%; text-align: center;">
						    <td class="head"></td>
						    <td class="head">월</td>
						    <td class="head">화</td>
						    <td class="head">수</td>
						    <td class="head">목</td>
						    <td class="head">금</td>
						  </tr>
						
						  <tr>
						    <td class="head">9</td>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						  </tr>
						  <tr>
						    <td class="head">10</td>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						  </tr>
						  <tr>
						    <td class="head">11</td>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						  </tr>
						  <tr>
						    <td class="head">12</td>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						  </tr>
						  <tr>
						    <td class="head">1</td>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						  </tr>
						  <tr>
						    <td class="head">2</td>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						  </tr>
						  <tr>
						    <td class="head">3</td>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						  </tr>
						  <tr>
						    <td class="head">4</td>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						  </tr>
						  <tr>
						    <td class="head">5</td>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						  </tr>
						  <tr>
						    <td class="head">6</td>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						  </tr>
						  <tr>
						    <td class="head">7</td>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						  </tr>
						  
						</table>
				
				</div>
	
			</div>
			
			<div class="col-md-6 tablelist">
			
				<table id="lecturelist" class="table">
		
				</table>
				
			</div>		
		
		</div>
	
	</div>

	
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<script src="/team3/js/timetable.js" type="text/javascript"></script>

</body>
</html>