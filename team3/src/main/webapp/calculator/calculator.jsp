<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >

</head>
<body>

	<div class="container">
		<div class="row"><!-- 계산출력 -->
			<div class="col-md-4">
				<div id="전체평점">전체평점<br>0.00</div>
			</div>
			<div class="col-md-4">
				<div id="전공평점">전공평점<br>0.00</div>			
			</div>
			<div class="col-md-4">
				<div id="취득학점">취득학점<br>0.00</div>
			</div>
		</div>
		
		<div><!-- 입력 -->
			<form action="../calculator" method="get">
				<table>
					<tr>
						<td>과목명</td><td>학점</td><td>성적</td><td>전공</td>
					</tr>
					<%for(int i =0 ; i<10; i++){ %>
					<tr>
						<td><input type="text"></td>
						<td><input type="text" id="학점<%=i%>"></td>
						<td>
							<select id="성적<%=i%>">
								<option value="none">선택</option>
								<option value="4.5">A+</option>
								<option value="4.0">A0</option>
								<option value="3.5">B+</option>
								<option value="3.0">B0</option>
								<option value="2.5">C+</option>
								<option value="2.0">C0</option>
								<option value="1.5">D+</option>
								<option value="1.0">D0</option>
								<option value="0">F</option>
								<option value="P">P</option>
								<option value="NP">NP</option>
							</select>
						</td>
						<td><input type="checkbox" id="전공<%=i%>" name="전공"></td>
					</tr>
					<%} %>
				</table>
			</form>
			<div><input type="button" onclick="등록()" value="등록"></div>
		</div>
	</div>



<script type="text/javascript" src="/team3/js/calculator/calculator.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>