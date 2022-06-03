<%@page import="dto.Reply"%>
<%@page import="dao.ReplyDao"%>
<%@page import="java.util.ArrayList"%>
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
<link rel="stylesheet" type="text/css" href="/team3/css/board/reply.css">
<script src="https://kit.fontawesome.com/d77abffe02.js"></script>
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
					<div><span>작성일  <%=board.getBdate() %> </span>
				
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
				<button onclick="saveblike('<%=mid%>');"><i class="fas fa-thumbs-up"></i><%=board.getBlike() %></button>
			<% } else {%>
			
			<button onclick="saveblike('<%=mid%>');"><i class="far fa-thumbs-up"></i>  <%=board.getBlike() %></button>
			<%} %>
			
			</div>
			
			
			
			<!-- 댓글작성구역 ------------------------------------------------------------------------------------->
			
			<div class="rwrite_wrap"> <!-- row : 가로배치 -->
			<div class="rwirte_area">
				<textarea  rows="4" cols="50" name="rcontent" id="rcontent"  ></textarea>
				
				<button type="button" id="rwrite" onclick="replywrite(<%=bno%>)">등록</button>
				
			</div>
			<span> <input id="anonymous" type="checkbox" value="익명" name="anonymous"> 익명</span>
			<div>
		
			</div>
		</div>
		
			
			
			<!-- 댓글출력구역------------------------------------------------------------------------------------ -->
			<%
				ArrayList<Reply> replylist = ReplyDao.getReplyDao().replylist(bno);
				
			%>
			<div id="wrap">
			
			<% for(Reply reply : replylist) { %>
			
			<div id="reply_wrap"> <!-- 댓글출력구역 -->
			
				<div class="rbox">
				<div class="rheader"><span><i class="fas fa-user"></i></span>  <%=reply.getRnickname() %>   <time><%=reply.getRdate() %></time></div> 
				<div class="rmain"><p class="con"><%=reply.getRcontent()%><p></div>
				<div class="rfooter">
				
					<div id="relike_area">
			<%
				if(mid != null && ReplyDao. getReplyDao().getreplylike(reply.getRno(), mno)) {%>
				 <span onclick="rereplyview(<%=reply.getRno()%>,<%=reply.getBno()%>)"><i class="far fa-comment-alt"></i></span>
				<button onclick="saverelike('<%=mid%>',<%=reply.getRno()%>);"><i class="fas fa-thumbs-up"></i><%=reply.getRelike() %></button>
				
			<% } else {%>
			 <span onclick="rereplyview(<%=reply.getRno()%>,<%=reply.getBno()%>)"><i class="far fa-comment-alt"></i></span>
			<button onclick="saverelike('<%=mid%>',<%=reply.getRno()%>);"><i class="far fa-thumbs-up"></i>  <%=reply.getRelike() %></button>
			<%} %>
			
			</div>
				<div class="btn_area">
				<div class="test"><button onclick="updateview(<%=reply.getRno()%>,'<%=reply.getRcontent()%>',<%=reply.getBno()%>)">수정</button></div>
				<div class="test"><button onclick="replydelete(<%=reply.getRno()%>,<%=reply.getBno()%>)">삭제</button></div>
				</div>
				</div>
				
			</div>
			</div> 
			<!-- 수정입력창 -->
					<div class="rwrite_wrap" id=<%=reply.getRno()%>> <!-- row : 가로배치 -->
			
					</div>
					
			<!-- 대댓입력창 -->
			<div class="rwrite_wrap" id=<%=reply.getRno()%>> <!-- row : 가로배치 -->
	
			</div>
			
			<!-- 대댓글 출력 -->
			<%ArrayList<Reply> rereplylist = ReplyDao.getReplyDao().rereplylist( bno , reply.getRno() );
				for( Reply rereply : rereplylist ){%>
				<div id="reply_wrap"> <!-- 댓글출력구역 -->
			
				<div class="rbox re">
				<div class="rheader"><span><i class="fas fa-user"></i></span>  <%=rereply.getRnickname() %>   <time><%=reply.getRdate() %></time></div> 
				<div class="rmain"><p class="con"><%=rereply.getRcontent()%><p></div>
				<div class="rfooter">
						<div id="relike_area">
			<%
				if(mid != null && ReplyDao. getReplyDao().getreplylike(rereply.getRno(), mno)) {%>
				 <span onclick="rereplyview(<%=rereply.getRno()%>,<%=rereply.getBno()%>)"></span>
				<button onclick="saverelike('<%=mid%>',<%=rereply.getRno()%>);"><i class="fas fa-thumbs-up"></i><%=rereply.getRelike() %></button>
				
			<% } else {%>
			 <span onclick="rereplyview(<%=rereply.getRno()%>,<%=rereply.getBno()%>)"></span>
			<button onclick="saverelike('<%=mid%>',<%=rereply.getRno()%>);"><i class="far fa-thumbs-up"></i>  <%=rereply.getRelike() %></button>
			<%} %>
			
			</div>
				<div class="btn_area">
				<div class="test"><button onclick="reupdateview(<%=rereply.getRno()%>,'<%=rereply.getRcontent()%>',<%=rereply.getBno()%>)">수정</button></div>
				<div class="test"><button onclick="replydelete(<%=rereply.getRno()%> ,<%=rereply.getBno()%>)">삭제</button></div>
				</div>
				</div>
				
			</div>
			</div> 
			
			<!-- 대댓입력창 -->
			<div class="rwrite_wrap" id=<%=rereply.getRno()%>> <!-- row : 가로배치 -->
	
			</div>
			
				
				
			<%  }  } %>
			
					
			
			
			</div>
			
			
			
			
			
			<div class="upbutton_area"> <!-- 게시물 수정삭제 버튼 구역 -->
				<a href="boardupdate.jsp?bno=<%=board.getBno()%>"><button>수정</button></a>
				<a href="boarddelete?bno=<%=board.getBno()%>"> <button>삭제</button> </a>
			</div>
			
			
		

<script type="text/javascript" src="/team3/js/board/boardview.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

</body>
</html>