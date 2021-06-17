<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>Top.jsp</title>
    
    <!-- 부트스트랩 -->
    <!--<link href="<c:url value="/YuGyeong/css/bootstrap.min.css"/>" rel="stylesheet">-->
    <link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/reset.css"/>" rel="stylesheet">
    <!-- 아이콘 (폰트 어썸) -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.12/css/all.css" integrity="sha384-G0fIWCsCzJIMAVNQPfjH08cyYaUtMwjJwqiRKxxE/rx96Uroj1BtIQ6MLJuheaO9" crossorigin="anonymous">



  </head>
  <body>
		<header id="header">
			<div class="container">
				<div class="row">
					<div class="header">
						<h1><a href="#">내몸 내옷</a></h1>
						<nav class="gnb" >
							<ul>
								<li><a href="#" class="btn_"><i class="fas fa-bars"></i> 카테고리</a></li>
								
								<li><a href="#">스토어 </a></li>
								<li><a href="#">컨텐츠 </a></li>
								<li><a href="#">커뮤니티</a></li>
								<ul class="quick">
								<form id="searchform">
									<input type="submit" value="&#xf002;" id="search">
									<input type="text" placeholder="      검색어를 입력하세요" class="ui_select2">
									<input type="submit" value="&#xf030;">
								</form>
									<li><a href="#">로그인</a></li>
									<li><a href="#">회원가입</a></li>
								</ul>
							</ul>
						</nav>
					</div>
					
					<div class="group_nav">
						
						<a href="#" role="button" class="btn_more" data-clk="svc.more" data-edit="N">더보기</a>
						<div id="gnb" class="ly_open">
						<div class="ly_service" style="display: none;">
						<div class="group_service NM_FAVORITE_ALL_LY">
						  <dl class="list_service">
						    <dt class="service_title">최근검색어</dt>
						      <dd class="service_data"><a href="#" name="weather" data-clk="map.weather">날씨</a></dd>
						      <dd class="service_data"><a href="#" name="mycar" data-clk="map.mycar">네이버 MY CAR</a></dd>
						      <dd class="service_data"><a href="#" name="ngame" data-clk="map.ngame">네이버 게임</a></dd>
						      <dd class="service_data"><a href="#" name="booking" data-clk="map.booking">네이버 예약</a></dd>
						      <dd class="service_data"><a href="#" name="premium" data-clk="map.premium">네이버 프리미엄콘텐츠</a></dd>
						      <dd class="service_data"><a href="#" name="plus" data-clk="map.plus">네이버플러스 멤버십</a></dd>
						      <dd class="service_data"><a href="#" name="news" data-clk="map.news">뉴스</a></dd>
						      <dd class="service_data"><a href="#" name="datalab" data-clk="map.datalab">데이터랩</a></dd>
						      <dd class="service_data"><a href="#" name="memo" data-clk="map.meno">메모</a></dd>
						  </dl>
						  <dl class="list_service">
						    <dt class="service_title">인기검색어</dt>
						      <dd class="service_data"><a href="#" name="band" data-clk="map.band">밴드</a></dd>
						      <dd class="service_data"><a href="#" name="land" data-clk="map.land">부동산</a></dd>
						      <dd class="service_data"><a href="#" name="bookmark" data-clk="map.bookmark">북마크</a></dd>
						      <dd class="service_data"><a href="#" name="software" data-clk="map.software">소프트웨어</a></dd>
						      <dd class="service_data"><a href="#" name="sports" data-clk="map.sports">스포츠</a></dd>
						      <dd class="service_data"><a href="#" name="nstore" data-clk="map.nstore">시리즈</a></dd>
						      <dd class="service_data"><a href="#" name="nstoreon" data-clk="map.serieson">시리즈온</a></dd>
						  </dl>
						  <dl class="list_service">
						    <dt class="service_title">추천검색어</dt>
						      <dd class="service_data"><a href="#" name="movie" data-clk="map.movie">영화</a></dd>
						      <dd class="service_data"><a href="#" name="audioclip" data-clk="map.audioclip">오디오클립</a></dd>
						      <dd class="service_data"><a href="#" name="office" data-clk="map.office">오피스</a></dd>
						      <dd class="service_data"><a href="#" name="whale" data-clk="map.whale">웨일</a></dd>
						      <dd class="service_data"><a href="#" name="webnovel" data-clk="map.webnovel">웹소설</a></dd>
						      <dd class="service_data"><a href="#" name="comic" data-clk="map.webtoon">웹툰</a></dd>
						      <dd class="service_data"><a href="#" name="influencer" data-clk="map.influencer">인플루언서 검색</a></dd>
						  </dl>
						  <dl class="list_service">
						    <dt class="service_title">판매랭킹</dt>
						      <dd class="service_data"><a href="#" name="auto" data-clk="map.auto">자동차</a></dd>
						      <dd class="service_data"><a href="#" name="contact" data-clk="map.contact">주소록</a></dd>
						      <dd class="service_data"><a href="#" name="stock" data-clk="map.stock">증권</a></dd>
						      <dd class="service_data"><a href="#" name="map" data-clk="map.map">지도</a></dd>
						      <dd class="service_data"><a href="#" name="terms" data-clk="map.terms">지식백과</a></dd>
						      <dd class="service_data"><a href="#" name="book" data-clk="map.book">책</a></dd>
						  </dl>
						</div>
						</div>
						</div>
						
							
						</div>
					
					
					
					
					
				</div>
			</div>
		</header>
		<!-- //header -->

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="<c:url value="/resources/css/bootstrap.min.js"/>"></script>
    <script>
    $(document).ready(function(){ 

    $("#searchform").on('click',function(){
		$('.ui_select2').attr('display',"none");

	});
    	
    
    
    
    });
    </script>
    
  </body>
</html>