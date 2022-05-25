<%@page import="dao.ReviewDao"%>
<%@page import="dao.LectureDao"%>
<%@page import="dto.Lecture"%>
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
	
	<%
		ArrayList<Lecture> lecturelist = ReviewDao.getreviewDao().getlecturelist();
		String 이수구분 = "전공";
	%>
	
	
	<div class="container">
		<div class="row">
			<div>
				<div>
					<input type="text" id="keyword" placeholder="강의명을 입력해주세요"><button type="button">검색</button>
				</div>
			</div><!-- 강의검색 -->
			<div style="overflow:scroll; height: 200px; margin: 0 auto;">
				<table class="table table-hover text-center">
				<% for (int i=0; i<6;i++){
					int ldivision = lecturelist.get(i).getLdivision();
					if(ldivision==0){
						이수구분="전공";
					}else{이수구분="교양";}
					%>
					<tr onclick="lecturelist(<%=lecturelist.get(i).getLno() %>)">
						<td><%=lecturelist.get(i).getLname() %></td>
						<td><%=lecturelist.get(i).getLprofessor() %></td>
						<td><%=lecturelist.get(i).getLcredit() %>학점</td>
						<td><%=이수구분 %></td>
					</tr>
					<%}%>
				</table>
			</div><!-- 강의리스트 -->
			<div id="tableviewbox">
				
			</div><!-- 강의평 -->
			<button type="submit">완료</button>
		</div>
	</div>
	
	
	
	
	
	
	<script src="/team3/js/review/reviewadd.js" type="text/javascript"></script>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>