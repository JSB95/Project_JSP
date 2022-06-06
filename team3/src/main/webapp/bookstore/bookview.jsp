<%@page import="dao.MemberDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BookstoreDao"%>
<%@page import="dto.Textbook"%>
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
	<%@include file = "../header.jsp" %>
	<%
		int tno = Integer.parseInt(request.getParameter("tno"));
		Textbook textbook = BookstoreDao.getBookstoreDao().getBook(tno);
	%>
	<div class="container">
		<h3 class="text-center my-4">책방</h3>
		<div class="contentbox"><!-- 상세정보 -->
			<h5 class="ttitle"><%=textbook.getTtitle() %></h5>
			<table>
				<tr class="content_table_tr"><td class="table_col1">저자</td><td><%=textbook.getTauthor() %></td><tr>
				<tr class="content_table_tr"><td class="table_col1">출판사</td><td><%=textbook.getTcompany()%></td><tr>
				<tr class="content_table_tr"><td class="table_col1">출판년도</td><td><%=textbook.getTyear() %></td><tr>
				<tr class="content_table_tr"><td class="table_col1">사용한 수업</td><td><%=textbook.getTclass()%></td><tr>
				<tr class="content_table_tr"><td class="table_col1">희망가격</td><td class="tprice"><%=textbook.getTprice()%></td><tr>
			</table>
		</div>
		<div class="contentbox"><!-- 책 상태, 이미지 -->
			<div>
				<%
					String bookcondition = "";
					if(textbook.getTcondition()==1){
						bookcondition = "상";
					}else if(textbook.getTcondition()==2){
						bookcondition = "중";
					}else{
						bookcondition = "하";
					}
				%>
				<span>책 상태</span><span class="bookconditon"><%=bookcondition%></span>
			</div>
			<img width="150px" alt="" src="/team3/bookstore/bookimg/<%=textbook.getTimg()%>">
		</div>
		<div class="contentbox"><!-- 상세 설명, 쪽지버튼 -->
			<div class="row">
				<span>상세설명</span><span class="tcontent"><%=textbook.getTcontent()%></span>
			</div>
			<%
			if(textbook.getMno()== MemberDao.getMemberDao().getmno(loginid)){ %>
				<div>
					<a href="/team3/bookstore/bookupdate.jsp?tno=<%=textbook.getTno() %>">
						<button class="btnbook" onclick="bookupdate()">수정하기</button>
					</a>
				</div>
			<%}else{ %>
				<div>
					<button class="btnbook">쪽지 보내기</button>
				</div>
			<%} %>
		</div>
	</div>
	<script src="/team3/js/bookstore/bookstore.js" type="text/javascript"></script>
</body>
</html>