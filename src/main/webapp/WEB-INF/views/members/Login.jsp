<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 내몸내옷 팀 프로젝트 -->
<title>Login.jsp</title>
<!-- 로그인 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
	body {
		background-color: #eee;
	}
	
	.form-signin {
		max-width: 330px;
		padding: 15px;
		margin: 0 auto;
	}
	
	.form-signin .form-signin-heading, .form-signin .checkbox {
		margin-bottom: 10px;
	}
	
	.form-signin .checkbox {
		font-weight: normal;
	}
	
	.form-signin .form-control {
		position: relative;
		height: auto;
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		box-sizing: border-box;
		padding: 10px;
		font-size: 16px;
	}
	
	.form-signin .form-control:focus {
		z-index: 2;
	}
	
	.form-signin input[type="text"] {
		margin-bottom: -1px;
		border-bottom-right-radius: 0;
		border-bottom-left-radius: 0;
	}
	
	.form-signin input[type="password"] {
		margin-bottom: 10px;
		border-top-left-radius: 0;
		border-top-right-radius: 0;
	}
</style>
</head>
<body>
	<!-- 네비게이션 시작 -->
	<jsp:include page="/WEB-INF/views/templates/Top.jsp"/>
	<!-- 네비게이션 끝 -->
	
	<!-- 본문 시작 -->
	<section id="hero" style='background: url("../images/fitness3.jpg") top left;'>
	<div class="container" id="list" style="width: 550px;"> 
		<div class="jumbotron" style="width: 500px;">
		  <h1>로그인&nbsp;<small>로그인 페이지</small></h1>
		</div>
		<div>
			<form id="myform" class="form-horizontal" method="post" action="<c:url value="/KYS/Login.kys"/>">
				<div class="form-group">
					<label class="col-sm-3 control-label">아이디</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="user" placeholder="아이디"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label">비밀번호</label>
					<div class="col-sm-6">
						<input type="password" name="password" class="form-control" placeholder="비밀번호"/>
						<div class="checkbox">
							<label class="text-center">
							<input type="checkbox" id="remember"/>아이디 저장</label>
						</div>
						<!-- 경고 메세지 출력 -->
						<div><h4 style="color: red;">
						<c:if test="${NOT_LOGIN}" var="result"/>
						<c:if test="${! result}">${NOT_LOGIN}</c:if>
						<c:if test="${NEED_LOGIN}" var="needlogin"/>
						<c:if test="${! needlogin}">${NEED_LOGIN}</c:if>
						</h4></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-6">
						<button type="submit" class="btn btn-lg btn-primary btn-block">로그인</button>
					</div>
				</div>
			</form>
			<div class="col-sm-offset-3 col-sm-6 text-center" style="margin-bottom: 15px;"><a href="<c:url value="/KYS/Regist.jsp"/>">회원가입</a></div>
			<div class="col-sm-offset-3 col-sm-6 text-center">관리자 계정<span class="glyphicon glyphicon-wrench"></span> : admin / 1234</div>
		</div>
	</div><!-- container -->
	</section>
	<!-- 본문 끝 -->
	
	<!-- 경고용 모달창 시작 -->
	<div class="modal fade" id="sm-modal" data-backdrop="static">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">

				<!-- 바디 -->
				<div class="modal-body">
				<button class="close" data-dismiss="modal"><sapn>&times;</sapn></button>
					<!-- data-dismiss속성(닫기 기능) 제거 : JS로 제어하기 위해서 -->
					<h4 class="modal-title">알림&nbsp;<span class="glyphicon glyphicon-bullhorn"></span></h4>
					<h4 id="warningMessage" style="color: red;"></h4>
				</div><!-- modal-body -->
				
			</div><!-- modal-content -->
		</div><!-- modal-dialog -->
	</div><!-- modal fade -->
	<!-- 모달창 끝 -->
	
	<!-- Footer 시작 -->
	<jsp:include page="/WEB-INF/views/templates/Footer.jsp"/>
	<!-- Footer 끝 -->
	
<script>
	$(function(){

		var focusObject;

		//모달창이 닫힐때 해당 항목으로 포커스 이동
		$('#sm-modal').on('hidden.bs.modal',function(){
			focusObject.focus();
		});
		
		//각 항목이 빈칸일때 모달창 출력
		$('#myform').on("submit",function(){
			
			if($(this).get(0).user.value==""){
				$('#warningMessage').html("아이디를 입력하세요.");
				$('#sm-modal').modal('show');
				focusObject = $(this).get(0).user;
				return false;
			}
			if($(this).get(0).password.value==""){
				$('#warningMessage').html("비밀번호를 입력하세요.");
				$('#sm-modal').modal('show');
				focusObject = $(this).get(0).password;
				return false;
			}
		});//#myform
		
		//아이디 저장 체크 여부를 확인하는 제이쿼리, 자바스크립트
		var saveUserid = getCookie("saveUserid");
		$("input[name='user']").val(saveUserid); //일단 쿠키를 불러온다음 아이디에 넣기
		
		//쿠키가 로딩되었다면 아이디 저장 체크박스를 체크상태로 유지 
	    if($("input[name='user']").val() != ""){ 
		$("#remember").attr("checked", true);
		}
	    
		//아이디 저장 체크박스 변화 감지
	    $("#remember").change(function(){ 
	        if($("#remember").is(":checked")){ //체크시 7일 동안 쿠키 보관
	            var saveUserid = $("input[name='user']").val();
	            setCookie("saveUserid", saveUserid, 7);
	        }else{ //체크 해제 시 쿠키 삭제
	            deleteCookie("saveUserid");
	        }
    	});

	    // 아이디 저장을 먼저 체크한 상태에서 입력하는 경우에도 쿠키에 값 저장
	    $("input[name='user']").keyup(function(){
	        if($("#remember").is(":checked")){
	            var saveUserid = $("input[name='user']").val();
	            setCookie("saveUserid", saveUserid, 7);
	        }
	    });
		
	});//function()
	
	//아이디 저장용 쿠키
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
</script>
</body>
</html>