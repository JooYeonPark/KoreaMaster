<%@page import="kr.or.koreaMaster.user.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Users user = (Users)request.getAttribute("user");
%>

<!doctype>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Title Of Site -->
	<title>한반도 뽀개기 - 로그인</title>
	<meta name="description" content="HTML template for multiple tour agency, local agency, traveller, tour hosting based on Twitter Bootstrap 3.x.x" />
	<meta name="keywords" content="tour agency, tour guide, travel, trip, holiday, vocation, relax, adventure, virtual tour, tour planner" />
	<meta name="author" content="crenoveative">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	<!-- Fav and Touch Icons -->
	<link rel="apple-touch-icon" sizes="144x144" href="/images/ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon" sizes="114x114" href="/images/ico/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon" sizes="72x72" href="/images/ico/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon" href="/images/ico/apple-touch-icon-57-precomposed.png">
	<link rel="shortcut icon" href="/images/ico/favicon.png">

	<!-- CSS Plugins -->
	<link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.min.css" media="screen">	
	<link href="/css/main.css" rel="stylesheet">
	<link href="/css/plugin.css" rel="stylesheet">

	<!-- CSS Custom -->
	<link href="/css/style.css" rel="stylesheet">
	
	<!-- Add your style -->
	<link type="text/css" href="/css/user/UserLogin.css" rel="stylesheet"/>
	
</head>

<body class="home transparent-header">

<!-- start breadcrumb -->

			<div class="breadcrumb-image-bg detail-breadcrumb"
				style="background-image: url('/images/detail-header.jpg');">
				<div class="container">

					<div class="page-title detail-header-02">

						<div class="row">

							<div
								class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">

								<h2>Sign-in into your account</h2>
								<span class="labeling text-white mt-25"><span>Welcome KoreaMaster</span></span>
								<div class="rating-item rating-item-lg mb-25">
								</div>
								<ul class="list-with-icon list-inline-block">
									<li><i class="ion-android-done text-primary"></i>SuJin Kim</li>
									<li><i class="ion-android-done text-primary"></i>HyunHee Kim</li>
									<li><i class="ion-android-done text-primary"></i>JooYeon Park</li>
									<li><i class="ion-android-done text-primary"></i>EunJi Yang</li>
								</ul>

							</div>

						</div>

					</div>

				</div>

			</div>
			<!-- end breadcrumb -->

<!-- 로그인 완료  -->
<!-- start Sign-in Modal -->
<!-- <div id="loginModal" class="modal fade login-box-wrapper" tabindex="-1" data-width="550" data-backdrop="static" data-keyboard="false" data-replace="true"> -->
<form method="post" action="/user?cmd=login-db">
<div id="loginForm">
		
	<div class="modal-body">
		<div class="row gap-20">
			
			<div class="col-sm-12 col-md-12">
	
				<div class="form-group"> 
					<label>UserID</label><br/>
					<input id="usersId" name="usersId" class="form-control" placeholder="Min 4 and Max 10 characters" type="text"> 
				</div>
			
			</div>
			
			<div class="col-sm-12 col-md-12">
			
				<div class="form-group"> 
					<label>Password</label>
					<input id="usersPassword" name="usersPassword" class="form-control" placeholder="Min 4 and Max 10 characters" type="password"> 
				</div>
			
			</div>
			
			<div id="change" class="col-sm-6 col-md-6">
				<div  class="login-box-box-action">
					No account? <a data-toggle="modal" href="#registerModal">Register</a>
				</div>
				<div  class="login-box-link-action">
					<a data-toggle="modal" href="#forgotPasswordModal" class="block line18 mt-1">Forgot password?</a> 
				</div>
				
			</div>
			
		</div>
	</div>
	

	
	<div class="modal-footer text-center">
		<input type="submit" class="btn btn-primary" value="Log-in" id="login" />
	</div>
	
</div>
</form>
<!-- end Sign-in Modal -->

<!-- start Forget Password Modal -->
<div id="forgotPasswordModal" class="modal fade login-box-wrapper" tabindex="-1" data-backdrop="static" data-keyboard="false" data-replace="true">

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title text-center">Restore your forgotten password</h4>
	</div>
	
	<div class="modal-body">
		<div class="row gap-20">
			
			<div class="col-sm-12 col-md-12">
				<p class="mb-20">Maids table how learn drift but purse stand yet set. Music me house could among oh as their. Piqued our sister shy nature almost his wicket. Hand dear so we hour to.</p>
			</div>
			
			<div class="col-sm-12 col-md-12">
	
				<div class="form-group"> 
					<label>Email Address</label>
					<input class="form-control" placeholder="Enter your email address" type="text"> 
				</div>
			
			</div>

			<div class="col-sm-12 col-md-12">
				<div class="checkbox-block"> 
					<input id="forgot_password_checkbox" name="forgot_password_checkbox" class="checkbox" value="First Choice" type="checkbox"> 
					<label class="" for="forgot_password_checkbox">Generate new password</label>
				</div>
			</div>
			
			<div class="col-sm-12 col-md-12">
				<div class="login-box-box-action">
					Return to <a data-toggle="modal" href="#loginModal">Log-in</a>
				</div>
			</div>
			
		</div>
	</div>
	
	<div class="modal-footer text-center">
		<button type="button" class="btn btn-primary">Restore</button>
		<button type="button" data-dismiss="modal" class="btn btn-primary btn-border">Close</button>
	</div>
	
</div>
<!-- end Forget Password Modal -->
 
<!-- Core JS -->
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/core-plugins.js"></script>
<script type="text/javascript" src="/js/customs.js"></script>

<!-- Only in Home Page -->
<script type="text/javascript" src="/js/jquery.flexdatalist.js"></script>

</body>

</html>