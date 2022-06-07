<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/team3/css/board/boardwrite.css">

</head>
<body>
<%@include file="../header.jsp"%>
<%
int bno = Integer.parseInt( request.getParameter("bno") );
Board board = BoardDao.getBoardDao().getboaBoard(bno);

%>
<div class="content_wrap">
	<div class="board_wrap">
	<h1 id="header">게시판 수정</h1>
	<form  id ="form_board" action="/team3/board/boardupdate?bno=<%=board.getBno()%>" method="post" enctype="multipart/form-data" >
		<div class="input_wrap">
			<input id="btitle" name="btitle" type="text" value="<%=board.getBtitle()%>"> 
			<textarea id="bcontent" name="bcontent" style="resize: none;"><%=board.getBcontent() %></textarea> 
			<input id ="bimg" name="bimg" type="file" value="<%=board.getBimg()%>"> 
			
			<%if(board.getBimg() !=null)  { %>
			<div style="width:100%">
				<img id="preview" width="100%" src="/team3/board/upload/<%=board.getBimg()%>">
				<button type="button" onclick="filedelete(<%=board.getBno()%>)"> 사진삭제</button>
				</div>
			<%}
			%>
		
			
			<div><input id="anonymous" type="radio" value="아이디" name="anonymous" checked="checked">아이디</div>
			<div><input id="anonymous" type="radio" value="익명" name="anonymous">익명</div>
			
			<div class="btn_area">
			<button id="bwrite" type="button" onclick="writecheck()">등록</button>
			<a href="/team3/board/boardview.jsp?bno=<%=bno%>"><button id="bwrite" type="button">취소</button></a>
			</div>
		</div>
		
	</form>
	
	
	</div>
</div>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../js/board/board.js"></script>

</body>
</html>