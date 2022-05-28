<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/team3/css/board/boardview.css">
<!-- 폰트어썸[ 아이콘 ]  -->
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css">
</head>
<body>
<%
int bno = Integer.parseInt( request.getParameter("bno"));
Board board  = BoardDao.getBoardDao().getboaBoard(bno);
String mid = (String)session.getAttribute("login"); 
int mno = BoardDao.getBoardDao().getmno(mid);

%>

<h1>게시물조회</h1>
<input type="hidden" value="<%=bno%>" id="bno">

			 
				<div class="view_header">
				
				<div class="board_title">
					<h1><%=board.getBtitle() %></h1>
				</div>
				
				
				
				
				<div class="user"> 
					<div>
						<span><i class="fas fa-user"></i></span> 
					</div>
					<div>
						<span><%=board.getBnickname() %></span> 
						
					</div>
					<div><span>작성일  <%=board.getBdate() %></h3> </span>
				
				</div>
				</div>
				
				
				
				</div>
			
			
				 
					<div class="boardview_content">	
						<%=board.getBcontent() %>
					</div>
				
			
			
			<% if( board.getBimg() == null ){ // 첨부파일이 없을경우 %> 
				 첨부파일 :  - 
			<%	}else{  %>
				 <div class="img_area">이미지 : <img width="100%" alt="" src="/team3/board/upload/<%=board.getBimg()%>"> </div> <!-- 첨부파일 다운로드 -->
			<% } %>
			
			<div id="like_area">
			<%
				if(mid != null && BoardDao.getBoardDao().getblike(bno, mno)) {%>
				<button onclick="saveplike('<%=mid%>');"><i class="fas fa-thumbs-up"></i><%=board.getBlike() %></button>
			<% } else {%>
			
			<button onclick="saveplike('<%=mid%>');"><i class="far fa-thumbs-up"></i>  <%=board.getBlike() %></button>
			<%} %>
			
			</div>
			
		

<script type="text/javascript" src="/team3/js/board/boardview.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

</body>
</html>