<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/team3/css/board/boardlist.css">
</head>
<body>
<%
	ArrayList<Board> boardlist
	= BoardDao.getBoardDao().getboardlist();


%>


<!-- 인기글 전체글 선택 -->
	<div class="board_category">
		<button>전체글</button>
		<button>인기글</button>
	</div>
<!-- ---------------------- 테이블 구역 -------------------------- -->
	
	<div class="content_wrap">
		
		
		<div class="search_area">
		
				<div  class="search_area"> <!-- 키 선택 -->
					<select class="form_select" id="key">
						<option value="btitle">제목</option>
						<option value="bcontent">내용</option>
						<option value="bnickname">작성자</option>
					</select>
					<input type="text" class="serach_input" id="keyword"> <!-- 키워드입력창 -->
					<input type="button" class="search_button" value="검색" onclick="getsearchlist()">
				</div>
			</div>
			
			
		<div id="listbox"  >
		
		</div>
	
	</div>
	
	
	




<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/team3/js/board/boardlist.js"></script>


</body>
</html>