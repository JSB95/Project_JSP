<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 부트스트랩 css -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
	<!-- member css -->
	<link href="/team3/css/member/member.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<form>
			<div>
				<h3>자세한 책 정보를 적어주세요</h3>
				<input type="text" placeholder="책 이름">
				<input type="text" placeholder="저자">
				<input type="text" placeholder="출판사">
				<input type="text" placeholder="출판일 (ex. 20160101)">
				<input type="text" placeholder="정가 (ex. 17000)">
			</div>
			<div>
				<h3>어떤 수업에서 사용한 책인가요?</h3>
				<input type="text" placeholder="수업이름을 입력해주세요">
			</div>
			<div>
				<h3>보존 상태는 어떤가요?</h3>
				<input type="checkbox" value="1" name="condition">상
				<input type="checkbox" value="2" name="condition">중
				<input type="checkbox" value="3" name="condition">하
			</div>
			<div>
				<h3>실제 사진을 올려주세요</h3>
				<input type="file">
			</div>
			<div>
				<h3>희망하시는 판매 가격을 적어주세요</h3>
				<input type="text" placeholder="(단위 : 원)">
			</div>
			<div>
				<h3>희망하시는 판매 가격을 적어주세요</h3>
				<input type="text" placeholder="(단위 : 원)">
			</div>
			<div>
				<h3>추가 설명을 자유롭게 적어주세요</h3>
				<input type="text" placeholder="(1000자 이내)">
			</div>
			<input type="submit" value="등록">
			<input type="reset" value="취소">
		</form>
		
	</div>
	<!-- jquery cdn -->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- 부트스트랩 js -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
</body>
</html>