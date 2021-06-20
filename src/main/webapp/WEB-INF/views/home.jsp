<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>home.jsp</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href='<c:url value="/resources/styles/common.css"/>'>
</head>
<body>
	<!-- 네비게이션 시작 -->
	<jsp:include page="/WEB-INF/views/templates/Top.jsp"/>
	<!-- 네비게이션 끝 -->
	
	<!-- 실제 내용 시작 -->
	<div class="container">
		<div class="page-header">
			<h1>내몸내옷&nbsp;<a href="https://www.notion.so/nmno/1fec2e81f65b4dacb00c50407e5fc9c2"><small>notion으로 이동</small></a></h1>		
		</div>
		<h2><c:if test="${not empty message}">${message}</c:if></h2>
		<fieldset>
			<legend><p>현재 시간 : ${serverTime}</p></legend>
			<h2>이미지 소스1 : 유튜브</h2>
			<a href="https://www.youtube.com/"><img src="<c:url value="/resources/images/img_youtube.png"/>" alt="img_youtube"/></a>
			<h2>이미지 소스2 : 깃허브</h2>
			<a href="https://github.com/"><img src="<c:url value="/resources/images/img_github.png"/>" alt="img_github"/></a>
			<h2>이미지 소스3 : 디스코드</h2>
			<a href="https://discord.com/"><img src="<c:url value="/resources/images/img_discord.png"/>" alt="img_discord"/></a>
			<h2>이미지 소스4 : 구글</h2>
			<a href="https://www.google.com/"><img src="<c:url value="/resources/images/img_google.png"/>" alt="img_google"/></a>
			<h2>이미지 소스5 : 네이버</h2>
			<a href="https://www.naver.com/"><img src="<c:url value="/resources/images/img_naver.png"/>" width="128px" height="128px" alt="img_naver"/></a>
			<h2>이미지 소스6 : 다음</h2>
			<a href="https://www.daum.net/"><img src="<c:url value="/resources/images/img_daum.png"/>" width="128px" height="128px" alt="img_daum"/></a>
			<h2>이미지 소스7 : 네이트</h2>
			<a href="https://www.nate.com/"><img src="<c:url value="/resources/images/nate.png"/>" alt="nate"/></a>
			<h2>이미지 소스8 : 네이트</h2>
			<a href="https://www.nate.com/"><img src="<c:url value="/resources/images/nate.png"/>" alt="nate"/></a>
			<h2>이미지 소스99 : 네이트</h2>
			<a href="https://www.nate.com/"><img src="<c:url value="/resources/images/nate.png"/>" alt="nate"/></a>
		</fieldset>
	</div>
	<!-- 실제 내용 끝 -->
	
	<!--  푸터 시작 -->
	<jsp:include page="/WEB-INF/views/templates/Footer.jsp"/>
	<!-- 푸터 끝 -->
</body>
</html>
