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
</head>
<body>

	<%
		ArrayList<Lecture> lecturelist = LectureDao.getLectureDao().getlecturelist();
		Set<String> college = new TreeSet<String>();
		Set<String> department = new TreeSet<String>();
		
		for (Lecture lecture : lecturelist){
			college.add(lecture.getLcollege());
			department.add(lecture.getLdepartment());
		}
	%>
	
	<select>
	
		<% for (String c : college) { %>
			
			<option><%=c %></option>
			
		<% } %>
	
	</select>
	
	<select>
	
		<% for (String d : department) { %>
			
			<option><%=d %></option>
			
		<% } %>
	
	</select>

</body>
</html>