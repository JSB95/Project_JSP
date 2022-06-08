<%@page import="dao.BookstoreDao"%>
<%@page import="dto.Textbook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 부트스트랩 css -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
	<!-- bookstore css -->
	<link href="/team3/css/bookstore/bookstore.css" rel="stylesheet">
</head>
<body>
	<%@include file="../header.jsp" %>
	<%
	int tno = Integer.parseInt(request.getParameter("tno"));
	Textbook textbook = BookstoreDao.getBookstoreDao().getBook(tno);
	%>
	<div class="container">
		<h3 class="text-center my-4">판매하기</h3>
		<form class="col-md-8 offset-2"  action="/team3/bookstore/bookupdate?tno=<%=textbook.getTno() %>" method="post" enctype="multipart/form-data">
			<div>
				<h3>자세한 책 정보를 적어주세요</h3>
				<input class="form-control" type="text" name="ttitle" value="<%=textbook.getTtitle() %>">
				<input class="form-control" type="text" name="tauthor" value="<%=textbook.getTauthor()%>">
				<input class="form-control" type="text" name="tcompany" value="<%=textbook.getTcompany() %>">
				<input class="form-control" type="text" name="tyear" value="<%=textbook.getTyear()%>">
			</div>
			<div>
				<h3>어떤 수업에서 사용한 책인가요?</h3>
				<input class="form-control" type="text" name="tclass" value="<%=textbook.getTclass() %>">
			</div>
			<div>
				<h3>보존 상태는 어떤가요?</h3>
				<%if(textbook.getTcondition() == 1){%>
					<input type="radio" value="1" name="tcondition" checked="checked">상
					<input type="radio" value="2" name="tcondition">중
					<input type="radio" value="3" name="tcondition">하
				<%}else if(textbook.getTcondition() == 2){%>
					<input type="radio" value="1" name="tcondition">상
					<input type="radio" value="2" name="tcondition" checked="checked">중
					<input type="radio" value="3" name="tcondition">하
				<%}else {%>
				<input type="radio" value="1" name="tcondition">상
				<input type="radio" value="2" name="tcondition">중
				<input type="radio" value="3" name="tcondition" checked="checked">하
				<%} %>
			</div>
			<div>
				<h3 style="display: inline;">실제 사진을 올려주세요</h3>
				<input id="timg" class="timg" type="file" name="timg" accept="image/*">
				<button id="updatebtn" class="imgupdatebtn" type="button" onclick="bimgupdate()">파일변경</button>
				<div id="imgbox">
					
				</div>
				<div id="previewbox">
					<img width="150px" id="preview" alt="" src="/team3/bookstore/bookimg/<%=textbook.getTimg()%>">
				</div> 
			</div>
			<div>
				<h3>희망하시는 판매 가격을 적어주세요</h3>
				<input class="form-control" type="text" name="tprice" placeholder="(단위 : 원)" value="<%=textbook.getTprice()%>">
			</div>
			<div>
				<h3>추가 설명을 자유롭게 적어주세요</h3>
				<input class="form-control" type="text" name="tcontent" placeholder="(1000자 이내)" value="<%=textbook.getTcontent()%>">
			</div>
			<div class="row my-3">
				<div class="col-md-2 offset-4">
					<button class="form-control btn btn-dark"  id="btnadd" >수정</button>
				</div>
				<div class="col-md-2">
					<a href="/team3/bookstore/booklist.jsp"><button class="form-control btn btn-outline-secondary">취소</button></a>
				</div>
			</div>
		</form>
		
	</div>
	<!-- jquery cdn -->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- 부트스트랩 js -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
	<script src="/team3/js/bookstore/bookstore.js" type="text/javascript"></script>
</body>
</html>