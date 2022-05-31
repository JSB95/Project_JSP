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
	
	<div class="container">
		<div class="row mainheader"><!-- 메인헤더 -->
			 <div class="col-md-6 offset-3 d-flex justify-content-center">
			 	<a href="#"><i class="fas fa-school"></i></a>
			 </div>
				<div class="col-md-3 d-flex justify-content-end">
					<a href="#"><i class="far fa-comment-dots"></i></a>
					<a href="/team3/member/memberinfo.jsp"><i class="fas fa-user"></i></a>
				</div>
		</div>
		<div class="iconbox"><!-- 페이지이동 아이콘 -->
			<ul class="nav justify-content-center">
			  <li class="nav-item">
			    <a class="nav-link active" aria-current="page" href="#"><i class="fas fa-calendar-check"></i></a>
			    <br>시간표
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="/team3/board/boardlist.jsp"><i class="far fa-comment-alt"></i></a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="/team3/review/reviewlist.jsp?keyword="><i class="fas fa-user-graduate"></i></a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="#"><i class="fas fa-book-open"></i></a>
			  </li>
			</ul>
			
		</div>
		<div class="tablelist"><!-- 게시판출력 -->
			<div class="row">
				<div class="col-md-6">
						<h3>자유게시판</h3>
					<table class="table">
						<tr>
							<td>제목</td><td>추천수</td><td>댓글수</td>
						</tr>
						<tr>
							<td>제목</td><td>추천수</td><td>댓글수</td>
						</tr>
					</table>
				</div>
				<div class="col-md-6">
					<h3>HOT 게시판</h3>
					<table class="table">
						<tr>
							<td>제목</td><td>추천수</td><td>댓글수</td>
						</tr>
						<tr>
							<td>제목</td><td>추천수</td><td>댓글수</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>