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

%>

<h1>게시물조회</h1>


			 
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
				
				
				<div>추천수  <%=board.getBlike() %> </div>
			
			
				 
					<div class="boardview_content">	
						<%=board.getBcontent() %>
					</div>
				
			
			
			<% if( board.getBimg() == null ){ // 첨부파일이 없을경우 %> 
				 첨부파일 :  - 
			<%	}else{  %>
				 <div class="img_area">이미지 : <img width="100%" alt="" src="/team3/board/upload/<%=board.getBimg()%>"> </div> <!-- 첨부파일 다운로드 -->
			<% } %>
			
		



</body>
</html>