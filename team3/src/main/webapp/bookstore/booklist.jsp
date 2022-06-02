<%@page import="dto.Textbook"%>
<%@page import="dao.BookstoreDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- bookstore css -->
	<link href="/team3/css/bookstore/bookstore.css" rel="stylesheet">
</head>
<body>
	<%@include file="../header.jsp" %>
	<div class="container">
		<div>
			<input type="text" placeholder="구매할 책을 검색하세요">
			<button type="button" onclick="">검색</button>
			<a href="/team3/bookstore/bookadd.jsp"><button>판매하기</button></a>
		</div>
		<div>
			<%ArrayList<Textbook> booklist = BookstoreDao.getBookstoreDao().getbooklist();
			for(Textbook textbook : booklist){
			%>
			<div class="row bookbox my-3">
				<div class="col-md-3">
					<img width="150px" alt="" src="/team3/bookstore/bookimg/<%=textbook.getTimg()%>">
				</div>
				<div class="col-md-9">
					<div><%=textbook.getTtitle()%></div>
					<div><%=textbook.getTcondition()%></div>
					<div><%=textbook.getTprice()%></div>
				</div>
			</div>
			<%} %>
		</div>
		
	</div>
</body>
</html>