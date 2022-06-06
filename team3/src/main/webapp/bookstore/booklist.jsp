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
		<h3 class="text-center my-4">책방</h3>
		<div class="row my-3">
			<div class="col-sm-10">
				<input id="keyword" class="form-control" type="text" placeholder="구매할 책을 검색하세요">
			</div>
			<div class="col-sm-2">
				<button class="form-control" type="button" onclick="search()">검색</button>
			</div>
		</div>
		<div class="scrollbox">
			<div class="row">
				<span class="col-sm-6">최근 올라온 책</span>
				<a class="col-sm-6 d-flex justify-content-end" href="/team3/bookstore/bookadd.jsp"><button>판매하기</button></a>
			</div>
			<div id="booklistbox">
			</div>
		</div>
	</div>
	<script src="/team3/js/bookstore/booklist.js" type="text/javascript"></script>
</body>
</html>