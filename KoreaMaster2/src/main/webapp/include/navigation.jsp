<%@page import="kr.or.koreaMaster.user.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
// 	String projectName = "/KoreaMaster2";
	
	// 로그인한 유저 얻어오기
	Object obj = session.getAttribute("user");
	Users user = null;
	
	// 로그인을 했다면 user에 설정
	if(obj != null) {
		user = (Users)obj;
	}
%>

<!-- start Navbar (Header) -->
<nav
	class="navbar navbar-default navbar-fixed-top navbar-sticky-function navbar-arrow">

	<div class="container">

		<div class="logo-wrapper">
			<div class="logo">
				<a href="/index.jsp"><img src="images/logo-white.png" alt="Logo" /></a>
			</div>
		</div>

		<div id="navbar" class="navbar-nav-wrapper">

			<ul class="nav navbar-nav" id="responsive-menu">
				<li><a href="">Offered Tour</a>
					<ul>
						<li><a href="">Offered Tour Result</a></li>

					</ul></li>

				<li><a href="">여행</a>
                    <ul>
                        <li><a href="/jsp/travel/routeRequest.jsp">여행루트생성</a></li>
					</ul>
				</li>
			</ul>

		</div>
		<!--/.nav-collapse --> 

		<div class="nav-mini-wrapper">
			<ul class="nav-mini">
			<% if(user == null) { %>
				<li><a data-toggle="modal" href="/user?cmd=join-page"><i
						class="icon-user-follow" data-toggle="tooltip"
						data-placement="bottom" title="sign up"></i></a></li>
				<li><a data-toggle="modal" href="/user?cmd=login-page"><i
						class="icon-login" data-toggle="tooltip" data-placement="bottom"
						title="login"></i> </a></li>
						<% } else { 
			// user가 로그인을 한 상태이면 환영 메세지와 로그아웃 아이콘 출력
		%>
				<li id="userHello"><b><%= user.getUsersName() %>님,</b> 환영합니다.</li>
				<li><a href="/user?cmd=logout-page"><i class="icon-logout" data-toggle="tooltip" data-placement="bottom" title="logout"></i></a></li>
		<% } %>
			</ul>
		</div>
	</div>

	<div id="slicknav-mobile"></div>

</nav>
<!-- end Navbar (Header) -->

