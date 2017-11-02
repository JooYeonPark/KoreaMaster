<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
					</ul></li>


			</ul>

		</div>
		<!--/.nav-collapse -->

		<div class="nav-mini-wrapper">
			<ul class="nav-mini">
				<li><a data-toggle="modal" href="#registerModal"><i
						class="icon-user-follow" data-toggle="tooltip"
						data-placement="bottom" title="sign up"></i></a></li>
				<li><a data-toggle="modal" href="#loginModal"><i
						class="icon-login" data-toggle="tooltip" data-placement="bottom"
						title="login"></i> </a></li>
			</ul>
		</div>

	</div>

	<div id="slicknav-mobile"></div>

</nav>
<!-- end Navbar (Header) -->

