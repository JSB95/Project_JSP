<%@page import="org.json.JSONArray"%>
<%@page import="dto.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
	<script src="https://kit.fontawesome.com/d77abffe02.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="/team3/css/main/main.css">

</head>
<body>

	<div>
		<div class="row mainheader"><!-- 메인헤더 -->
			 <div class="col-md-6 offset-3 d-flex justify-content-center">
			 	<a href="#"><i class="fas fa-school"></i></a>
			 </div>
				<div class="col-md-3 d-flex justify-content-end">
					<a href="/team3/message/getmessage.jsp">
						<i class="far fa-comment-dots"></i>
					</a>
					<a href="/team3/member/memberinfo.jsp"><i class="fas fa-user"></i></a>
				</div>
		</div>
		<div class="iconbox"><!-- 페이지이동 아이콘 -->
			<ul class="nav justify-content-center">
			  <li class="nav-item iconitem">
			    <a class="nav-link active iconlink" aria-current="page" href="#">
			    	<i class="fas fa-calendar-check"></i>
			    	<h5 class="h5">시간표</h5>
					<span class="font">나의 일정을 한눈에!</span>
			    </a>
			  </li>
			  <li class="nav-item iconitem">
			    <a class="nav-link iconlink" href="/team3/board/boardlist.jsp">
			    	<i class="far fa-comment-alt"></i>
			    	<h5 class="h5">게시판</h5>
					<span class="font">다양한 소통<br>활동을 즐기자!</span>
			    </a>
			  </li>
			  <li class="nav-item iconitem">
			    <a class="nav-link iconlink" href="/team3/review/reviewlist.jsp?keyword=">
			   	 	<i class="fas fa-user-graduate"></i>
			   	 	<h5 class="h5">강의평</h5>
					<span class="font">강의정보를<br>알고싶다면?</span>
			    </a>
			  </li>

			  <li class="nav-item iconitem">
			    <a class="nav-link" href="/team3/bookstore/booklist.jsp"><i class="fas fa-book-open"></i></a>
			    	<i class="fas fa-book-open"></i>
			    	<h5 class="h5">책방</h5>
					<span class="font">저렴한 가격으로<br>책을 구매하자!</span>
			    </a>
			  </li>
			  <li class="nav-item iconitem">
			    <a class="nav-link iconlink" href="calculator/calculator.jsp">
			    	<i class="fas fa-book-open"></i>
			    	<h5 class="h5">학점계산기</h5>
					<span class="font">편리한<br>성적 계산기</span>
			    </a>

			  </li>
			</ul>
			
		</div>
		<div class="container tablelist"><!-- 게시판출력 -->
			<div class="row">
				<div class="col-md-6 tablebox">
					<h3>자유게시판<i class="fa-solid fa-feather boardimg"></i></h3>
					<table class="table tablefont">
						<tr>
							<th>제목</th><th>댓글수</th><th>작성일</th>
						</tr>
					<%ArrayList<Board> getboardlist = BoardDao.getBoardDao().getboardlist();
						JSONArray json=BoardDao.getBoardDao().getboardbestlist();
						for(int i=0;i<5;i++){
					%>
						<tr>
							<td><%=getboardlist.get(i).getBtitle()%></td><td><%=getboardlist.get(i).getRcount()%></td><td><%=getboardlist.get(i).getBdate()%></td>
						</tr>
					<%} %>
					</table>
				</div>
				<div class="col-md-6 tablebox">
					<h3>HOT 게시판<i class="fa-solid fa-feather boardimg"></i></h3>
					<table class="table tablefont">
						<tr>
							<th>제목</th><th>댓글수</th><th>추천수</th>
						</tr>
						<%for(int i=0; i<5; i++){ %>
						<tr>
							<td><%=json.getJSONObject(i).get("btitle") %></td>
							<td><%=json.getJSONObject(i).get("rcount") %></td>
							<td><%=json.getJSONObject(i).get("blike") %></td>
						</tr>
						<%} %>
					</table>
				</div>
			</div>
		</div>
		<div class="container booklist"><!-- 페이지이동 아이콘 -->
			<h3>판매중인 책</h3>
			<ul class="nav justify-content-left bookimg">
			  <li class="nav-item books">
			    <a class="nav-link active" aria-current="page" href="#">
			    	<img class="book" alt="" src="/team3/img/책.jpg">
			    </a>
			  </li>
			  <li class="nav-item books">
			    <a class="nav-link" aria-current="page" href="#">
			    	<img class="book" alt="" src="/team3/img/책.jpg">
			    </a>
			  </li>
			  <li class="nav-item books">
			    <a class="nav-link" aria-current="page" href="#">
			    	<img class="book" alt="" src="/team3/img/책.jpg">
			    </a>
			  </li>
			  <li class="nav-item books">
			    <a class="nav-link" aria-current="page" href="#">
			    	<img class="book" alt="" src="/team3/img/책.jpg">
			    </a>
			  </li>
			</ul>
			
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>