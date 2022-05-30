<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
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
	<%
		String mid = (String)session.getAttribute("login");
		Member member =  MemberDao.getMemberDao().getmemberinfo(mid);
	%>
	<div class="container">
		<div>
			<span>현재 비밀번호</span>
			<input  type="password" id="oldpassword" name="oldpassword" placeholder="비밀번호를 입력해주세요.">
		</div>
		<div>
			<span>새로운 비밀번호</span>
			<input  type="password" id="mpassword" name="mpassword" placeholder="비밀번호를 입력해주세요.">
		</div>
		<div>
			<span>비밀번호 확인</span>
			<input  type="password" id="mpasswordcheck" placeholder="비밀번호를 입력해주세요.">
			<div id="passwordcheck" class="check">영어, 숫자로 5~15자리 입력가능합니다</div>
		</div>
		<button onclick="updatepw()" type="submit">수정</button>
		<button onclick="/team3/member/memberinfo.jsp">취소</button>
		<input type="hidden" value="<%=member.getMpassword()%>" id="password">
	</div>
	<!-- jquery cdn -->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="../js/member/signup.js" type="text/javascript"></script>
	<!-- 부트스트랩 js -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
</body>
</html>