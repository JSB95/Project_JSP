<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<div class="board_wrap">
	<h1>게시판 작성</h1>
	<form  id ="form_board" action="/team3/board/boardwrite" method="post" enctype="multipart/form-data" >
		<div>
			<input id="btitle" name="btitle" type="text" placeholder="제목"> <br>
			<textarea id="bcontent" name="bcontent" style="resize: none;"></textarea> <br>
			<input id ="bimg" name="bimg" type="file"> <br>
			<img id="preview" width="100%">
			
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