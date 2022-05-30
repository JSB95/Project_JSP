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
	<div class="container">
		
		<%
			String mid = (String)session.getAttribute("login");
			Member member =  MemberDao.getMemberDao().getmemberinfo(mid);
		%>
		<div>
			<h3 class="text-center">회원정보</h3>
			이름 : <%=member.getMname() %><br>
			학번 : <%=member.getMcode() %><br>
			아이디 : <%=member.getMid() %><br>
			연락처 : <%=member.getMphone() %><br>
			이메일 : <%=member.getMemail() %><br>
		</div>
		<div>
			<h3><a href="/team3/member/infoupdate.jsp">정보 수정</a></h3>
		</div>
		<div>
			<h3>내가 쓴 글</h3>
		</div>
		<div>
			<h3><a href="logout">로그아웃</a></h3>
		</div>
		<div>
			<h3><a href="/team3/member/pwupdate.jsp">비밀번호 변경</a></h3>
		</div>
		<div>
			<h3><a href="/team3/member/mdelete.jsp">회원탈퇴</a></h3>
		</div>
		
		
	</div>
	
	<!-- jquery cdn -->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- 부트스트랩 js -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
</body>
</html>