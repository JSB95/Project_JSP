<%@page import="dto.Lecture"%>
<%@page import="dao.ReviewDao"%>
<%@page import="dto.Review"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
	<link href="css/review.css" rel="stylesheet">

</head>
<body>

	<input type="text" id="keyword" placeholder="강의명을 입력해주세요"><button type="button">검색</button><br>
	<a href="reviewwrite.jsp?keyword="><button>강의평쓰기</button></a>
	
	
	<h3>최근강의평</h3>
	<table class="table table-hover text-center">
	<% ArrayList <Review> list = ReviewDao.getreviewDao().list();
		for(int i=0; i<list.size(); i++){
		Lecture lecture = ReviewDao.getreviewDao().lecture(list.get(i).getLno());
	%>
		<tr>
			<td>
				<%=lecture.getLname() %><%=lecture.getLprofessor()%><br>
				<%if(list.get(i).getReviewrate()==1){ %>
					<img class="star" alt="" src="img/노란별.png">
					<img class="star"  alt="" src="img/별.png">
					<img class="star"  alt="" src="img/별.png">
					<img class="star"  alt="" src="img/별.png">
					<img class="star"  alt="" src="img/별.png">
				<%} %>
				<%if(list.get(i).getReviewrate()==2){ %>
					<img class="star" alt="" src="img/노란별.png">
					<img class="star"  alt="" src="img/노란별.png">
					<img class="star"  alt="" src="img/별.png">
					<img class="star"  alt="" src="img/별.png">
					<img class="star"  alt="" src="img/별.png">
				<%} %>
				<%if(list.get(i).getReviewrate()==3){ %>
					<img class="star" alt="" src="img/노란별.png">
					<img class="star"  alt="" src="img/노란별.png">
					<img class="star"  alt="" src="img/노란별.png">
					<img class="star"  alt="" src="img/별.png">
					<img class="star"  alt="" src="img/별.png">
				<%} %>
				<%if(list.get(i).getReviewrate()==4){ %>
					<img class="star" alt="" src="img/노란별.png">
					<img class="star"  alt="" src="img/노란별.png">
					<img class="star"  alt="" src="img/노란별.png">
					<img class="star"  alt="" src="img/노란별.png">
					<img class="star"  alt="" src="img/별.png">
				<%} %>
				<%if(list.get(i).getReviewrate()==5){ %>
					<img class="star" alt="" src="img/노란별.png">
					<img class="star"  alt="" src="img/노란별.png">
					<img class="star"  alt="" src="img/노란별.png">
					<img class="star"  alt="" src="img/노란별.png">
					<img class="star"  alt="" src="img/노란별.png">
				<%} %>
				<br>
				<%=list.get(i).getReviewcontent() %>
			</td>
		</tr>
	<%} %>
	</table>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
