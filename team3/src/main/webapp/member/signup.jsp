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
		<h3>회원가입</h3>
		<div>
			<form id="signupform" action="../signup" method="post">
				이름 : <input type="text" id="mname" name="mname">
				<span id="mnamecheck"></span>
				학번 : <input type="text" id="mcode" name="mcode">
				<span id="mcodecheck"></span>
				전화번호 : <input type="text" id="mphone" name="mphone">
				<span id="mphonecheck"></span>
				이메일 : <div id="emailform" class="row">
							<div class="col-md-5">
								<input class="form-control" type="text" id="memail" name="memail">
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
						<span id="memailcheck"></span>
				아이디 : <input type="text" id="mid" name="mname">
				<span id="midcheck"></span>
				비밀번호 : <input type="password" id="mpassword" name="mname">
				<span id="mpasswordcheck"></span>
				비밀번호 확인: <input type="password" id="mpassword_re" name="mpassword_re">
				<span id="mpasswordcheck_re"></span>
				<button type="button" onclick="signup()">가입하기</button>
			</form>
		</div>
	</div>
	<!-- jquery cdn -->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="../js/signup.js" type="text/javascript"></script>
</body>
</html>