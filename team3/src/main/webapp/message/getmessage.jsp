<%@page import="dao.MemberDao"%>
<%@page import="dao.ReviewDao"%>
<%@page import="dao.MessageDao"%>
<%@page import="dto.Message"%>
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
	<link href="/team3/css/message/message.css" rel="stylesheet">

</head>
<body>


	<% 
	String mid = (String)session.getAttribute("login");
	int mno = ReviewDao.getreviewDao().getmno(mid);
	ArrayList<Message> getmessage = MessageDao.getMessageDao().getmessage(mno); 
	%>


	<%@include file="messagebar.jsp"%>
	
	<div class="container">
		<table class="table">
				<tr>
					<th>작성자</th><th class="내용">내용</th><th>작성일</th>
				</tr>
			<%for(Message message : getmessage){ 
				int sendno = message.getMsendno();
				String sendid= MessageDao.getMessageDao().getmid(sendno);
				if(message.getMactive()==1){
			%>
				<tr class="td" onclick="read(<%=message.getMnum() %>)" data-bs-toggle="modal" data-bs-target="#read">
					<td><%=sendid %></td><td><span class="mcontent"><%=message.getMcontent()%></span></td><td><%=message.getMtime() %></td>
				</tr>
			<%}else{ %>
				<tr class="read" onclick="read(<%=message.getMnum() %>)" data-bs-toggle="modal" data-bs-target="#read">
					<td><%=sendid %></td><td><span class="mcontent"><%=message.getMcontent() %></span></td><td><%=message.getMtime() %></td>
				</tr>
			<%}} %>
		</table>
	</div>

<div class="modal" tabindex="-1" id="read">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">받은쪽지</h5>
        <a href="getmessage.jsp"><button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button></a>
      </div>
      <div class="modal-body" id="mcontent">
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" onclick="reply()" data-bs-dismiss="modal">닫기</button>
        <div id="send">
      	</div>
      </div>
    </div>
  </div>
</div>


	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="/team3/js/message/message.js" type="text/javascript"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>