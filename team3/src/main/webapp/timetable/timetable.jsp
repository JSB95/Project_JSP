<%@page import="java.util.TreeSet"%>
<%@page import="java.util.Set"%>
<%@page import="dao.LectureDao"%>
<%@page import="dto.Lecture"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
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