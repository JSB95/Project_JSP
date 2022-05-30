<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 부트스트랩 css -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
	<!-- member css -->
	<link href="/team3/css/member/member.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div>
			<input type="text" placeholder="구매할 책을 검색하세요">
			
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
		
		<div class="row">
			<div class="col-md-4">홈</div>
			<div class="col-md-4"><a href="/team3/bookstore/bookadd.jsp">판매하기</a></div>
			<div class="col-md-4">마이페이지</div>
		</div>
	</div>
	<!-- jquery cdn -->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- 부트스트랩 js -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
</body>
</html>