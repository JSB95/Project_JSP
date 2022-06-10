<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 부트스트랩 css -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
	<!-- bookstore css -->
	<link href="/team3/css/bookstore/bookstore.css" rel="stylesheet">
</head>
<body>
	<%@include file="../header.jsp" %>
	<div class="container ">
		<h3 class="text-center my-4">판매하기</h3>
		<form class="col-md-8 offset-2 bookform" id="bookform" action="/team3/bookstore/bookadd" method="post" enctype="multipart/form-data">
			<div class="addbox">
				<h3>자세한 책 정보를 적어주세요</h3>
				<input class="form-control" id="ttitle" type="text" name="ttitle" placeholder="책 제목을 적어주세요">
				<input class="form-control" id="tauthor" type="text" name="tauthor" placeholder="지은이를 적어주세요">
				<input class="form-control" id="tcompany" type="text" name="tcompany" placeholder="출판사를 적어주세요">
				<input class="form-control" id="tyear" type="text" name="tyear" placeholder="출판년도를 적어주세요">
			</div>
			<div>
				<h3>어떤 수업에서 사용한 책인가요?</h3>
				<input class="form-control" id="tclass" type="text" name="tclass" placeholder="수업이름을 적어주세요">
			</div>
			<div>
				<h3>보존 상태는 어떤가요?</h3>
				<input type="radio" value="1" name="tcondition">상
				<input type="radio" value="2" name="tcondition">중
				<input type="radio" value="3" name="tcondition">하
			</div>
			<div>
				<h3 style="display: inline-block;">실제 사진을 올려주세요</h3>
				<div id="imgbox">
					<input id="timg" class="timg" type="file" name="timg" accept="image/*">
					<div id="addimgbox" class="addimgbox" onclick="addimg()">
						<img alt="" src="camera.png">
					</div>
				</div>
				<div id="previewbox">
					<img id="preview" class="col-md-4" width="100%">
					<div class="imgchangebtn">
						<button id="updatebtn" class="imgupdatebtn" type="button" onclick="bimgupdate()">파일변경</button>
					</div>
				</div> 

			</div>
			<div>
				<h3>희망하시는 판매 가격을 적어주세요</h3>
				<input class="form-control" id="tprice" type="text" name="tprice" placeholder="(단위 : 원)">
			</div>
			<div>
				<h3>추가 설명을 자유롭게 적어주세요</h3>
				<input class="form-control" id="tcontent" type="text" name="tcontent" placeholder="(1000자 이내)">
			</div>
			<!-- 
			<input type="submit" value="등록">
			 -->
			 <div class="row my-3">
				<div class="col-md-2 offset-4">
					<button id="btnadd" type="button" class="form-control btn btn-dark" onclick="bookadd()">확인</button>
				</div>
				<div class="col-md-2">
					<a href="/team3/bookstore/booklist.jsp"><button type="button" class="form-control btn btn-outline-secondary" >취소</button></a>
				</div>
			</div>
		</form>
		<br><br><br><br><br>
	<%@include file="../footer.jsp" %>
	</div>
	<!-- jquery cdn -->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- 부트스트랩 js -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
	<script src="/team3/js/bookstore/bookstore.js" type="text/javascript"></script>
</body>
</html>