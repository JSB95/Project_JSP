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
					<input type="text" id="keyword" placeholder="강의명을 입력해주세요"><button type="button" value="검색"></button>
				</div>
			</div><!-- 강의검색 -->
			<div style="overflow:scroll; height: 200px; margin: 0 auto;">
				<table class="table">
				<% for (int i=0; i<6;i++){
					int ldivision = lecturelist.get(i).getLdivision();
					if(ldivision==0){
						이수구분="전공";
					}else{이수구분="교양";}
					%>
					<tr>
						<td><%=lecturelist.get(i).getLname() %></td>
						<td><%=lecturelist.get(i).getLprofessor() %></td>
						<td><%=lecturelist.get(i).getLcredit() %>학점</td>
						<td><%=이수구분 %></td>
					</tr>
					<%}%>
				</table>
			</div><!-- 강의리스트 -->
			<div>
				<div>
					과제: <br>
					<button>없음</button><button>보통</button><button>많음</button><br>
					시험횟수: <br>
					<button>없음</button><button>한번</button><button>두번</button><button>세번이상</button><br>
					조모임: <br>
					<button>없음</button><button>보통</button><button>많음</button><br>
					
					총평<br>
					<img alt="" src="img/별.png">
					<img alt="" src="img/별.png">
					<img alt="" src="img/별.png">
					<img alt="" src="img/별.png">
					<img alt="" src="img/별.png"><br>
					<br>
					<textarea rows="10" cols="20"></textarea><br>
					<button type="submit">완료</button>
				</div>
			</div><!-- 강의평 -->
		</div>
	</div>
	
	
	
	
	
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>