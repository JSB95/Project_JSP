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
		request.setCharacterEncoding("UTF-8");
		String getno = request.getParameter("getno");
		session.setAttribute("getno", getno);
	%>
	
	<form action="../send" method="post">
		<div class="container">
			<input type="hidden" name="getno" value="<%=getno%>">
			<textarea rows="20" cols="50" name="ccontent"></textarea>
			<input type="submit" value="전송">
		</div>
	</form>
	
</body>
</html>