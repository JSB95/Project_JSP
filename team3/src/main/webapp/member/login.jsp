<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 부트스트랩 css -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
</head>

<body>
	<div class="container">
		<h3 class="text-center my-4">로그인</h3>
		<div class="container col-md-6 offset-3">
			<form action="/team3/member/login" method="post">
				<div> 
					<input class="form-control my-2" type="text" id="mid" name="mid" placeholder="아이디">
				</div>
				<div>
					<input class="form-control my-2" type="password" id="mpassword" name="mpassword" placeholder="비밀번호">
				</div>
				<input class="form-control btn btn-dark my-4" type="submit" value="로그인하기">
			</form>
			<div class="text-center my-2">
				<a href="#">아이디찾기</a>
				<a href="#">비밀번호찾기</a>
				<a href="/team3/member/signup.jsp">회원가입</a>
			</div>
		</div>
	</div>
	
	
	<!-- jquery cdn -->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="../js/signup.js" type="text/javascript"></script>
	<!-- 부트스트랩 js -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
</body>
</html>