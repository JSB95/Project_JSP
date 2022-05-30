<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<%
int bno = Integer.parseInt( request.getParameter("bno") );
Board board = BoardDao.getBoardDao().getboaBoard(bno);

%>

	<div class="board_wrap">
	<h1>게시판 수정</h1>
	<form  id ="form_board" action="/team3/board/boardupdate?bno=<%=board.getBno()%>" method="post" enctype="multipart/form-data" >
		<div>
			<input id="btitle" name="btitle" type="text" value="<%=board.getBtitle()%>"> <br>
			<textarea id="bcontent" name="bcontent" style="resize: none;"><%=board.getBcontent() %></textarea> <br>
			<input id ="bimg" name="bimg" type="file" value="<%=board.getBimg()%>"> <br>
			
			<%if(board.getBimg() !=null)  { %>
				<img id="preview" width="100%" src="/team3/board/upload/<%=board.getBimg()%>"><br>
				<button type="button" onclick="filedelete(<%=board.getBno()%>)"> 사진삭제</button><br>
			<%}
			%>
		
			
			<input id="anonymous" type="radio" value="아이디" name="anonymous" checked="checked">아이디<br>
			<input id="anonymous" type="radio" value="익명" name="anonymous">익명<br>
			<button id="bwrite" type="button" onclick="writecheck()">등록</button>
		</div>
		
	</form>
	
	
	</div>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../js/board/board.js"></script>

</body>
</html>