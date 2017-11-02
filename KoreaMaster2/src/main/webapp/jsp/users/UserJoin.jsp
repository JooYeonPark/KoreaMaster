<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String projectName = "/koreamaster"; %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Title Of Site -->
	<title>한뽀 - 한반도뽀개기</title>
	<meta name="description" content="HTML template for multiple tour agency, local agency, traveller, tour hosting based on Twitter Bootstrap 3.x.x" />
	<meta name="keywords" content="tour agency, tour guide, travel, trip, holiday, vocation, relax, adventure, virtual tour, tour planner" />
	<meta name="author" content="crenoveative">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	<!-- Fav and Touch Icons -->
	<link rel="apple-touch-icon" sizes="144x144" href="<%= projectName %>/images/ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon" sizes="114x114" href="<%= projectName %>/images/ico/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon" sizes="72x72" href="<%= projectName %>/images/ico/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon" href="<%= projectName %>/images/ico/apple-touch-icon-57-precomposed.png">
	<link rel="shortcut icon" href="<%= projectName %>/images/ico/favicon.png">

	<!-- CSS Plugins -->
	<link rel="stylesheet" type="text/css" href="<%= projectName %>/bootstrap/css/bootstrap.min.css" media="screen">	
	<link href="<%= projectName %>/css/main.css" rel="stylesheet">
	<link href="<%= projectName %>/css/plugin.css" rel="stylesheet">

	<!-- CSS Custom -->
	<link href="<%= projectName %>/css/style.css" rel="stylesheet">
	
	<!-- Add your style -->
	<link href="<%= projectName %>/css/your-style.css" rel="stylesheet">

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
<title> 우리반 연습 </title>
</head>
<body>

<!-- 회원가입 완료 / 추가할 부분 이메일 인증번호 보내고 확인받기 -->
<!-- start Register Modal -->
<form method="post" action="<%= projectName %>/user?cmd=join-db" enctype="multipart/form-data">
<!-- <div id="registerModal" class="modal fade login-box-wrapper" tabindex="-1" data-backdrop="static" data-keyboard="false" data-replace="true"> -->

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title text-center">Create your account for free</h4>
	</div>
	
	<div class="modal-body">
	
		<div class="row gap-20">
		
			<div class="col-sm-6 col-md-6">
				<button class="btn btn-facebook btn-block mb-5-xs">Register with Facebook</button>
			</div>
			<div class="col-sm-6 col-md-6">
				<button class="btn btn-google-plus btn-block">Register with Google+</button>
			</div>
			
			<div class="col-md-12">
				<div class="login-modal-or">
					<div><span>or</span></div>
				</div>
			</div>
			
			<div class="col-sm-12 col-md-12">
	
				<div class="form-group"> 
					<label>Username</label>
					<input id="usersName" name="usersName" class="form-control" placeholder="Min 4 and Max 10 characters" type="text"> 
				</div>
			
			</div>
			
			<div class="col-sm-12 col-md-12">
	
				<div class="form-group"> 
					<label>UserID</label> <br/>
					<input id="usersId" name="usersId" class="form-control" placeholder="Enter your ID" type="text">
					<input id="id-confirm"class="form-control" value="ID Check" type="button" /> 
				</div>
			
			</div>
			
			<div class="col-sm-12 col-md-12">
			
				<div class="form-group"> 
					<label>Password</label>
					<input id="usersPassword" name="usersPassword" class="form-control" placeholder="Min 8 and Max 20 characters" type="password"> 
				</div>
			
			</div>
			
			<div class="col-sm-12 col-md-12">
			
				<div class="form-group"> 
					<label>Password Confirmation</label>
					<input class="form-control" placeholder="Re-type password again" type="password"> 
				</div>
			
			</div>
			
			<div class="col-sm-12 col-md-12">
	
				<div class="form-group"> 
					<label>Email Address</label>
					<input id="usersEmail" name="usersEmail" class="form-control" placeholder="Enter your email address" type="text"> 
				</div>
			
			</div>
			
			<div class="col-sm-12 col-md-12">
			
				<div class="form-group"> 
					<label>Tel</label> <br/>
					<select class="form-control tel" name="tel1">
						<option>010</option>
						<option>011</option>
						<option>017</option>						
					</select> -
					<input class="form-control tel" name="tel2" placeholder="1234" type="text"> -
					<input class="form-control tel" name="tel3" placeholder="5678" type="text">
				</div>
			
			</div>			
	
	<!-- 우편번호 API 연결하기 -->
			
			<div class="col-sm-12 col-md-12">
	
				<div class="form-group"> 
					<label>Address</label><br/>
					<input id="usersPostcode" name="usersPostcode" class="form-control" placeholder="12345" type="text">
					<input id="searchPostcode"class="form-control" value="search" type="button">
					<input id="usersAddress" name="usersAddress" class="form-control" placeholder="충남 계룡시 두마면 두계리" type="text">
					<input id="usersAddressDetail" name="usersAddressDetail" class="form-control" placeholder="e-편한세상 102동" type="text"> 
				</div>
			
			</div>
			
			<!-- 사진 파일 업로드 -->
			
			<div class="col-sm-12 col-md-12">
	
				<div class="form-group"> 
					<label>Profile</label><br/>
					 <input type="file" name="usersPicture"/>
				</div>
			
			</div>
			
			<div class="col-sm-12 col-md-12">
				<div class="checkbox-block"> 
					<input id="register_accept_checkbox" name="register_accept_checkbox" class="checkbox" value="First Choice" type="checkbox"> 
					<label class="" for="register_accept_checkbox">By register, I read &amp; accept <a href="#">the terms</a></label>
				</div>
				
			</div>
			
			<div class="col-sm-12 col-md-12">
				<div class="login-box-box-action">
<!-- 					Already have account? <a data-toggle="modal" href="#loginModal">Log-in</a> -->
					Already have account? <a data-toggle="modal" href="#loginModal">Log-in</a>
				</div>
			</div>
			
		</div>
	
	</div>
	
	<div class="modal-footer text-center">
		<input type="submit" class="btn btn-primary" value="Register"/>
		<button type="button" data-dismiss="modal" class="btn btn-primary btn-border">Close</button>
	</div>
	
<!-- </div> -->
</form>
<!-- end Register Modal -->

</body>
</html>