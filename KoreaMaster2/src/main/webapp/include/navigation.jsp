<%@page import="kr.or.koreaMaster.user.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 	
	// 로그인한 유저 얻어오기
	Object obj = session.getAttribute("user");
	Users user = null;
	
	// 로그인을 했다면 user에 설정
	if(obj != null) {
		user = (Users)obj;
	}
%>
<head>
<!-- 1202 css추가 -->
<style type="text/css">
	/* 메뉴들 > 로고에 맞춰 마진 수정 */
	.nav.navbar-nav {
		margin : 25px 0 15px 0;
	}
	/* 로그인/회원가입 아이콘 > 로고에 맞춰 마진 수정 */
	ul.nav-mini { 
		margin : 20px 0;
	}
	/* 메뉴들 > 로그인/회원가입 글씨추가함으로써 크기 조정 */
	.navbar-nav-wrapper {
		width : 60%;
	}
	/* 로그인/회원가입 > 글씨추가함으로써 크기 조정 */
	.nav-mini-wrapper {
		width: 25%;
	}
	/* 로그인/회원가입 > 마진줘서 보기 좋게 변경 */
	ul.nav-mini li {
		margin-left : 25px;
	}
	/* 메뉴들 > 글자크기 수정 */
	.nav.navbar-nav > li > a {
		font-size: 18px;
	}
	/* 헤더 > 높이 패딩 줄여서 전체적인 높이 줄임 */
	.navbar.navbar-default {
		padding: 10px 0;
	}
	/* 스크롤 내린 후 헤더 > 패딩 없애버림 */
	.transparent-header .navbar-sticky {
		padding: 0;
	}
	
</style>
</head>
<!-- start Navbar (Header) -->
<nav
	class="navbar navbar-default navbar-fixed-top navbar-sticky-function navbar-arrow">

	<div class="container">

		<div class="logo-wrapper">
			<div class="logo">
				<!-- 1202 현희 로고수정 -->
				<a href="index.jsp"><img src="/images/logo.png" alt="Logo" /></a>
			</div>
		</div>

		<div id="navbar" class="navbar-nav-wrapper">

			<ul class="nav navbar-nav" id="responsive-menu">
				<li><a href="/jsp/place/spotList.jsp">장소</a>
					<ul>
						<li><a href="">서울</a></li>
						<li><a href="">인천</a></li>
						<li><a href="">대구</a></li>
						<li><a href="">광주</a></li>
						<li><a href="">부산</a></li>
						<li><a href="">경기도</a></li>
						<li><a href="">충청북도</a></li>
						<li><a href="">충청남도</a></li>
						<li><a href="">경상남도</a></li>
						<li><a href="">경상북도</a></li>
						<li><a href="">전라북도</a></li>
						<li><a href="">전라북도</a></li>
						<li><a href="">제주도</a></li>
					</ul></li>
				
				<li><a href="/jsp/place/restaurantlist.jsp">식당</a>
				</li>
				
				<li><a href="">여행</a>
                    <ul>
                        <li><a href="/jsp/travel/routeRequest.jsp">여행루트생성</a></li>
                        <li><a href="/jsp/travel/routelist.jsp">여행리스트</a></li>
					</ul>
				</li>
				
				<!-- 로그인 했을 경우에만 마이페이지 보여주기 -->
				<% if(user != null) { %>
				
				<li><a href="">나의여행노트</a>"target/classes/mappers/SigunguMapper.xml"
                    <ul>
                        <li><a href="/note?cmd=my-tripNote&usersId=" + <%= user.getUsersId()%>>나의 여행노트</a></li>
					</ul>
				</li>	
				
				
				<li><a href="/note?cmd=my-page">마이페이지</a>
                    <ul>
                        <li><a href="/note?cmd=my-page">여행 노트</a></li>
					</ul>
				</li>
				<% } %> 
			</ul>

		</div>
		<!--/.nav-collapse --> 

		<div class="nav-mini-wrapper">
			<ul class="nav-mini">
<!-- 1202 현희 한줄정리 후 로그인 회원가입 글씨 추가 -->
			<% if(user == null) { %>
				<li><a data-toggle="modal" href="/user?cmd=join-page"><i class="icon-user-follow" data-toggle="tooltip" data-placement="bottom" title="sign up">&nbsp;SIGN UP</i></a></li>
				<li><a data-toggle="modal" href="/user?cmd=login-page"><i class="icon-login" data-toggle="tooltip" data-placement="bottom" title="login">&nbsp;LOGIN</i> </a></li>
			<% } else { // user가 로그인을 한 상태이면 환영 메세지와 로그아웃 아이콘 출력 %>
				<li id="userHello"><b><%= user.getUsersName() %>님,</b> 환영합니다.</li>
				<li><a href="/user?cmd=logout-page"><i class="icon-logout" data-toggle="tooltip" data-placement="bottom" title="logout"></i></a></li>
			<% } %>
			</ul> 
		</div>
	</div>

	<div id="slicknav-mobile"></div>

</nav>
<!-- end Navbar (Header) -->
