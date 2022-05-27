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
				
					<table class="timetable">
						
						  <tr style="width: 100%; text-align: center;">
						    <th></th>
						    <th width="20px;">월</th>
						    <th>화</th>
						    <th>수</th>
						    <th>목</th>
						    <th>금</th>
						  </tr>
						  <tr>
						    <th>9</th>
						    <td></td>
						    <td style="background-color: #ecc369"></td>
						    <td style="background-color: #f08676"></td>
						    <td style="background-color: #70a5e9"></td>
						    <td style="background-color: #75ca87"></td>
						  </tr>
						  <tr>
						    <th>10</th>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						  </tr>
						  <tr>
						    <th>11</th>
						    <td style="background-color: #f08676"></td>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td style="background-color: #d397ed"></td>
						  </tr>
						  <tr>
						    <th>12</th>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						  </tr>
						  <tr>
						    <th>1</th>
						    <td></td>
						    <td style="background-color: #a6c96f"></td>
						    <td></td>
						    <td></td>
						    <td></td>
						  </tr>
						  <tr>
						    <th>2</th>
						    <td></td>
						    <td style="background-color: #7ad1c0"></td>
						    <td></td>
						    <td></td>
						    <td></td>
						  </tr>
						  <tr>
						    <th>3</th>
						    <td></td>
						    <td></td>
						    <td style="background-color: #fbaa69"></td>
						    <td></td>
						    <td></td>
						  </tr>
						  <tr>
						    <th>4</th>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td style="background-color: #9d86e0"></td>
						    <td></td>
						  </tr>
						  <tr>
						    <th>5</th>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td style="background-color: #f08676"></td>
						    <td></td>
						  </tr>
						  <tr>
						    <th>6</th>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						    <td></td>
						  </tr>
						  <tr>
						    <th>7</th>
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