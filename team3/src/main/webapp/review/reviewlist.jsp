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


	<%
		
		request.setCharacterEncoding("UTF-8");
		String keyword = request.getParameter("keyword");
		
		if(keyword !=null){
			session.setAttribute("keyword", keyword);
		}else{
			keyword = (String)session.getAttribute("keyword");
		}
		
		%>

	<%
	int totalrow = ReviewDao.getreviewDao().gettotallist(keyword);
	int currentpage = 1;
		String pagenum = request.getParameter("pagenum");
		if( pagenum == null ){ // 만약에 페이지번호 요청이 없으면
			currentpage = 1; // 1페이지
		}else{
			currentpage = Integer.parseInt( pagenum ); 
		}
		
	int listsize = 12;	
	
	int startrow = (currentpage-1)*listsize; 
	
	int lastpage = 0;
	if( totalrow % listsize == 0 ){ 
		// 전체게시물 와 화면표시게시물수 나누기 했을때 나머지가 0이면
		lastpage = totalrow / listsize; 
	}else{
		lastpage = totalrow / listsize +1; 
		// 나머지가 있으면 나머지 게시물을 표시할 페이지 +1
	}
	
	int btnsize = 5;

	int startbtn = ( (currentpage-1) / btnsize ) * btnsize + 1 ;
				
	int endhtn = startbtn + btnsize-1;
	if( endhtn > lastpage ) endhtn = lastpage;

	
%>


	<div class="container">
		<div class="row">
			<div>
				<form action="reviewlist.jsp">
					<input type="text" name="keyword" placeholder="강의명을 입력해주세요"><input type="submit" value="검색"><br>
					<a href="reviewwrite.jsp?keyword="><button>강의평쓰기</button></a>
				</form>
			</div>
			<div>
				<h3>최근강의평</h3>
				<table class="table table-hover text-center">
				<% ArrayList <Review> list = ReviewDao.getreviewDao().list(startrow,listsize, keyword);
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
			</div>
			<div>
				<!-------------------------- 페이징 입력 구역  -------------------------- -->		
		<div class="col-md-4 offset-4 d-flex justify-content-center">	<!--  d-flex justify-content-center : 박스권 내에서 가운데 배치 -->
			 <ul class="pagination">
			
			 <!-- 이전 버튼 -->
			 <%if( currentpage == 1  ){ // 현재페이지가 1이면 0페이지로 요청 못하게 제한두기  %>
			 	<li class="page-item">  <a class="page-link pagenum" href="reviewlist.jsp">이전</a></li>
			 <%}else{ %>
			 	<li class="page-item">  <a class="page-link pagenum" href="reviewlist.jsp?pagenum=<%=currentpage-1%> ">이전</a></li>
			 <%} %>
			 
			 <!-- 페이징 버튼 -->
			 	<% for( int i = startbtn  ; i<=endhtn ; i++ ){ %>
			 		<li class="page-item"> 
				 		<a class="page-link pagenum" href="reviewlist.jsp?pagenum=<%=i%>"> 
				 			<%=i %> 
				 		</a> 
			 		</li>
				<%} %>
			
			<!-- 다음 버튼 --> 
			 <%if( currentpage == lastpage  ){ // 현재페이지가 마지막페이지 이면 마지막페이지 이상으로 요청 못하게 제한두기  %>
			 	<li class="page-item"> <a class="page-link pagenum" href="reviewlist.jsp?pagenum=<%=currentpage%> ">다음</a></li>
			 <%}else{ %>
			 	<li class="page-item"> <a class="page-link pagenum" href="reviewlist.jsp?pagenum=<%=currentpage+1%> ">다음</a></li>
			 <%} %>
			 </ul>
		</div>
			</div>
		</div>
	</div>
	
	
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
