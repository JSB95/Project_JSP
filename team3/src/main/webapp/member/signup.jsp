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
		<h3 class="text-center mt-4">회원가입</h3>
		<div class="container col-md-6 offset-3">
			<form class="signupform" id="signupform" action="../signup" method="post">
				
				<div>
					<p>이름</p>
					<input class="form-control mb-2" type="text" id="mname" name="mname" placeholder="이름을 입력해주세요.">
					<span id="namecheck"></span>
				</div>
				<div>
					<p>학번</p>
					<input class="form-control mb-2" type="text" id="mcode" name="mcode" placeholder="학번을 입력해주세요">
					<span id="codecheck"></span>
				</div>
				<div>
					<p>전화번호</p>
					<input class="form-control mb-2" type="text" id="mphone" name="mphone" placeholder="전화번호 11자리를 입력해주세요.(- 제외)">
					<span id="phonecheck"></span>
				</div>
				<div >
					<p>이메일</p>
					<div id="emailform" class="row  mb-2">
						<div class="col-md-5">
							<input class="form-control" type="text" id="memailtext" name="memailtext" placeholder="이메일을 입력해주세요.">
						</div>
						<div class="col-md-1">
							<span>@</span>
						</div>
						<div class="col">
							<input class="form-control" type="text" id="memailaddress" name="memailaddress">
						</div>
						<div class="col">
							<select class=" form-control" id="emailselect" name="emailselect">
								<option value="" style="height: 30px"> 직접 입력 </option>
								<option value="naver.com" style="height: 30px">naver.com</option>
								<option value="gmail.com" style="height: 30px">gmail.com</option>
							</select>
						</div>
					</div>
					<span id="emailcheck"></span>
					<div>
					<p>아이디</p>
					<input class="form-control mb-2" type="text" id="mid" name="mid" placeholder="아이디를 입력해주세요.">
					<span id="idcheck"></span>
				</div>
				<div>
					<p>비밀번호</p>
					<input class="form-control mb-2" type="password" id="mpassword" name="mpassword" placeholder="비밀번호를 입력해주세요.">
				</div>
				<div>
					<p>비밀번호 확인</p>
					<input class="form-control mb-2" type="password" id="mpasswordcheck" placeholder="비밀번호를 입력해주세요.">
					<span id="passwordcheck"></span>
				</div>
				</div>
				<div class="row my-4">
					<button class="col-md-5 btn btn-outline-secondary " onclick="" type="button">로그인하기</button>
					<button class="col-md-5 btn btn-dark " onclick="signup()" type="button">가입하기</button>
				</div>
			</form>
		</div>
		
	</div>
	<!-- jquery cdn -->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="../js/member/signup.js" type="text/javascript"></script>
	<!-- 부트스트랩 js -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
</body>
</html>