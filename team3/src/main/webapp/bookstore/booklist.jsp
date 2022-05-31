<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
</head>
<body>
	<%@include file="../header.jsp" %>
	<div class="container">
		<div>
			<input type="text" placeholder="구매할 책을 검색하세요">
			<button type="button" onclick="">검색</button>
			<a href="/team3/bookstore/bookadd.jsp"><button>판매하기</button></a>
		</div>
		<div class="row">
			<div class="col-md-3">
				<img width="100%" alt="" src="">
			</div>
			<div class="col-md-9">
				<div>통계학의 이해</div>
				<div>이용구, 김삼용 지음</div>
				<div>율곡출판사</div>
				<div>12,000원</div>
			</div>
		</div>
		
	</div>
</body>
</html>