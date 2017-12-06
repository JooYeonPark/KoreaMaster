<%@page import="kr.or.koreaMaster.user.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Title Of Site -->
	<title>한반도 뽀개기 - 회원정보수정</title>
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
	<link href="/css/your-style.css" rel="stylesheet">

</head>

<body>

	<!-- start Container Wrapper -->
	<div class="container-wrapper">

		<!-- start Header -->
			<jsp:include page="/include/navigation.jsp"></jsp:include>		
		<!-- end Header -->

		<!-- start Main Wrapper -->
		
		<div class="main-wrapper scrollspy-container">
		
			<!-- start Breadcrumb -->
			
			<div class="breadcrumb-wrapper">
				<div class="container">
					<ol class="breadcrumb">
						<li><a href="#">홈</a></li>
						<li><a href="#">마이페이지</a></li>
						<li class="active">회원정보수정</li>
					</ol>
				</div>
			</div>
			
			<!-- end Breadcrumb -->

			<div class="user-profile-wrapper">

				<div class="user-header">
					
					<div class="content">
					
						<div class="content-top">
						
							<div class="container">
							
								<div class="inner-top">
								
									<div class="image">
										<img src="/images/man/01.jpg" alt="image" />
									</div>
									
									<div class="GridLex-gap-20">
									
										<div class="GridLex-grid-noGutter-equalHeight GirdLex-grid-bottom">
							
											<div class="GridLex-col-7_sm-12_xs-12_xss-12">
											
												<div class="GridLex-inner">
													<div class="heading clearfix">
														<h3><%= user.getUsersName() %></h3>
													</div>
													<ul class="user-meta">
														<li><i class="fa fa-map-marker"></i> <%= user.getUsersAddress() %> <span class="mh-5 text-muted">|</span> <i class="fa fa-phone"></i> <%= user.getUsersTelephone() %></li>
														<li>
															<div class="user-social inline-block">
																<a><i class="icon-social-twitter" data-toggle="tooltip" data-placement="top" title="twitter"></i></a>
																<a><i class="icon-social-facebook" data-toggle="tooltip" data-placement="top" title="facebook"></i></a>
																<a><i class="icon-social-gplus" data-toggle="tooltip" data-placement="top" title="google plus"></i></a>
																<a><i class="icon-social-instagram" data-toggle="tooltip" data-placement="top" title="instrgram"></i></a>
															</div>
															<a class="btn btn-primary btn-xs btn-border">Follow</a>
														</li>
														<li>
														</li>
													</ul>
												</div>
												
											</div>
											
											
										</div>
								
									</div>
									
								
								</div>
							
							</div>
							
						</div>
						
						<div class="content-bottom">
						
							<div class="container">
							
								<div class="inner-bottom">
							
									<ul class="user-header-menu">
										<li><a href="/note?cmd=my-tripNote&usersId=<%= user.getUsersId() %>">나의 여행노트</a></li>
										<li><a href="/guide-detail-offer.html">나의 여행달력</a></li>
										<li><a href="/note?cmd=my-map">나의 여행지도</a></li>
										<li class="active"><a>마이페이지</a></li>
									</ul>
								
								</div>
								
							</div>
							
						</div>

					</div>

				</div>
				
			</div>

			<div class="pt-30 pb-50">
			
				<div class="container">

					<div class="row">
						
						<div class="col-xs-12 col-sm-4 col-md-3 mt-20">

							<aside class="sidebar-wrapper pr-5 pr-0-xs">
	
								<div class="common-menu-wrapper">
							
									<ul class="common-menu-list">
										
										<li><a href="/note?cmd=my-tripNote&usersId=<%= user.getUsersId() %>">나의 여행노트</a></li>
										<li><a href="/note?cmd=my-tripNote&usersId=<%= user.getUsersId() %>">나의 여행달력</a></li>
										<li><a href="/note?cmd=my-map">나의 여행지도</a></li>
										<li class="active"><a>마이페이지</a></li>
										
									</ul>
									
								</div>
								
							</aside>
						
						</div>
						
						<div class="col-xs-12 col-sm-8 col-md-9 mt-20">
						
							<div class="dashboard-wrapper">
							
								<h4 class="section-title">Edit profile</h4>
								<p class="mmt-15 mb-20">Interested astonished he at cultivated or me. Nor brought one invited she produce her.</p>
								
								<form class="post-form-wrapper">
									
									<div class="row gap-20">

										<div class="col-sm-6 col-md-4">
												
											<div class="form-group bootstrap-fileinput-style-01">
												<label>Photo</label>
												<input type="file" name="form-register-photo" id="form-register-photo">
												<span class="font12 font-italic">** photo must not bigger than 250kb</span>
											</div>

										</div>
										
										<div class="clear"></div>
										
										<div class="col-sm-6 col-md-4">
												
											<div class="form-group">
												<label>First Name</label>
												<input type="text" class="form-control" value="Christine">
											</div>
											
										</div>
										
										<div class="col-sm-6 col-md-4">
										
											<div class="form-group">
												<label>Last Name</label>
												<input type="text" class="form-control" value="Gateau">
											</div>
											
										</div>
										
										<div class="clear"></div>
										
										<div class="col-sm-6 col-md-4">
										
											<div class="form-group">
												<label>Born</label>
												<div class="row gap-5">
													<div class="col-xs-3 col-sm-3">
														<select class="selectpicker form-control" data-live-search="false">
															<option value="0">day</option>
															<option value="1">01</option>
															<option value="2" selected>02</option>
															<option value="3">03</option>
														</select>
													</div>
													<div class="col-xs-5 col-sm-5">
														<select class="selectpicker form-control" data-live-search="false">
															<option value="0">month</option>
															<option value="1">Jan</option>
															<option value="2" selected>Feb</option>
															<option value="3">Mar</option>
														</select>
													</div>
													<div class="col-xs-4 col-sm-4">
														<select class="selectpicker form-control" data-live-search="false">
															<option value="0">year</option>
															<option value="1">1985</option>
															<option value="2" selected>1986</option>
															<option value="3">1987</option>
														</select>
													</div>
												</div>
											</div>
											
										</div>
										
										<div class="col-sm-6 col-md-4">
										
											<div class="form-group">
												<label>Email</label>
												<input type="email" class="form-control" value="myemail@gmail.com">
											</div>
											
										</div>
										
										<div class="clear"></div>
										
										<div class="col-sm-6 col-md-4">
										
											<div class="form-group">
												<label>Address</label>
												<input type="text" class="form-control" value="254">
											</div>
											
										</div>
										
										<div class="col-sm-6 col-md-4">
										
											<div class="form-group">
												<label>City/town</label>
												<input type="text" class="form-control" value="Somewhere ">
											</div>
											
										</div>
										
										<div class="clear"></div>
										
										<div class="col-sm-6 col-md-4">
										
											<div class="form-group">
												<label>Province/State</label>
												<input type="text" class="form-control" value="Paris">
											</div>
											
										</div>
										
										<div class="col-sm-6 col-md-4">
										
											<div class="form-group">
												<label>Street</label>
												<input type="text" class="form-control" value="Somewhere ">
											</div>
											
										</div>

										<div class="clear"></div>
										
										<div class="col-sm-6 col-md-4">
										
											<div class="form-group">
												<label>Zip Code</label>
												<input type="text" class="form-control" value="35214">
											</div>
											
										</div>
										
										<div class="col-sm-6 col-md-4">
										
											<div class="form-group">
												<label>Country</label>
												<select class="selectpicker show-tick form-control" data-live-search="false">
													<option value="0">Select</option>
													<option value="1">Thailand</option>
													<option value="2" selected>France</option>
													<option value="3">China</option>
													<option value="4">Malaysia </option>
													<option value="5">Italy</option>
												</select>
											</div>
											
										</div>

										<div class="clear"></div>
										
										<div class="col-sm-6 col-md-4">
										
											<div class="form-group">
												<label>Facebook</label>
												<input type="text" class="form-control" placeholder="placeholder">
											</div>
											
										</div>
										
										<div class="col-sm-6 col-md-4">
										
											<div class="form-group">
												<label>Twitter</label>
												<input type="text" class="form-control" placeholder="placeholder">
											</div>
											
										</div>

										<div class="clear"></div>
										
										<div class="col-sm-6 col-md-4">
										
											<div class="form-group">
												<label>Google Plus</label>
												<input type="text" class="form-control" placeholder="placeholder">
											</div>
											
										</div>

										<div class="col-sm-6 col-md-4">
										
											<div class="form-group">
												<label>Youtube</label>
												<input type="text" class="form-control" placeholder="placeholder">
											</div>
											
										</div>
										
										<div class="clear mb-10"></div>

										<div class="col-sm-12">
											<a href="#" class="btn btn-primary">Save</a>
											<a href="#" class="btn btn-primary btn-border">Cancel</a>
										</div>

									</div>
									
								</form>
								
							</div>
							
						</div>

					</div>

				</div>
			
			</div>

		</div>
		
		<!-- end Main Wrapper -->
		
		<!-- start Footer Wrapper -->
		
		<div class="footer-wrapper scrollspy-footer">
		
			<footer class="main-footer">
			
				<div class="container">
				
					<div class="row">
					
						<div class="col-sm-12 col-md-4">
						
							<h5 class="footer-title">newsletter</h5>
							
							<p class="font16">Subsribe to get our latest updates and oeffers</p>
							
							<div class="footer-newsletter">
								
								<div class="form-group">
									<input class="form-control" placeholder="enter your email " />
									<button class="btn btn-primary">subsribe</button>
								</div>
								
								<p class="font-italic font13">*** Don't worry, we wont spam you!</p>
							
							</div>

						</div>
						
						<div class="col-sm-12 col-md-8">
						
							<div class="row">
								
								<div class="col-xs-12 col-sm-4 col-md-3 col-md-offset-3 mt-25-sm">
									<h5 class="footer-title">footer</h5>
									<ul class="footer-menu">
										<li><a href="#">Support</a></li>
										<li><a href="#">Advertise</a></li>
										<li><a href="#">Media Relations</a></li>
										<li><a href="#">Affiliates</a></li>
										<li><a href="#">Careers</a></li>
									</ul>
								</div>
								
								<div class="col-xs-12 col-sm-4 col-md-3 mt-25-sm">
									<h5 class="footer-title">quick  links</h5>
									<ul class="footer-menu">
										<li><a href="#">Media Relations</a></li>
										<li><a href="#">Affiliates</a></li>
										<li><a href="#">Careers</a></li>
										<li><a href="#">Support</a></li>
										<li><a href="#">Advertise</a></li>
									</ul>
								</div>
								
								<div class="col-xs-12 col-sm-4 col-md-3 mt-25-sm">
								
									<h5 class="footer-title">helps</h5>
									<ul class="footer-menu">
										<li><a href="#">Using a Tour</a></li>
										<li><a href="#">Submitting a Tour</a></li>
										<li><a href="#">Managing My Account</a></li>
										<li><a href="#">Merchant Help</a></li>
										<li><a href="#">White Label Website</a></li>
									</ul>
								
								</div>

							</div>

						</div>
						
					</div>
					
				</div>
				
			</footer>
			
			<footer class="bottom-footer">
			
				<div class="container">
				
					<div class="row">
					
						<div class="col-xs-12 col-sm-6 col-md-4">
				
							<p class="copy-right">&#169; 2017 Togoby - tour hosting</p>
							
						</div>
						
						<div class="col-xs-12 col-sm-6 col-md-4">
						
							<ul class="bottom-footer-menu">
								<li><a href="#">Cookies</a></li>
								<li><a href="#">Policies</a></li>
								<li><a href="#">Terms</a></li>
								<li><a href="#">Blogs</a></li>
							</ul>
						
						</div>
						
						<div class="col-xs-12 col-sm-12 col-md-4">
							<ul class="bottom-footer-menu for-social">
								<li><a href="#"><i class="icon-social-twitter" data-toggle="tooltip" data-placement="top" title="twitter"></i></a></li>
								<li><a href="#"><i class="icon-social-facebook" data-toggle="tooltip" data-placement="top" title="facebook"></i></a></li>
								<li><a href="#"><i class="icon-social-google" data-toggle="tooltip" data-placement="top" title="google plus"></i></a></li>
								<li><a href="#"><i class="icon-social-instagram" data-toggle="tooltip" data-placement="top" title="instrgram"></i></a></li>
							</ul>
						</div>
					
					</div>

				</div>
				
			
			</footer>
			
		</div>
		
		<!-- end Footer Wrapper -->

	</div>
	
	<!-- end Container Wrapper -->
 
 
<!-- start Back To Top -->

<div id="back-to-top">
   <a href="#"><i class="ion-ios-arrow-up"></i></a>
</div>

<!-- end Back To Top -->


 

<!-- start Sign-in Modal -->
<div id="loginModal" class="modal fade login-box-wrapper" tabindex="-1" data-width="550" data-backdrop="static" data-keyboard="false" data-replace="true">

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title text-center">Sign-in into your account</h4>
	</div>
	
	<div class="modal-body">
		<div class="row gap-20">
		
			<div class="col-sm-6 col-md-6">
				<button class="btn btn-facebook btn-block mb-5-xs">Log-in with Facebook</button>
			</div>
			<div class="col-sm-6 col-md-6">
				<button class="btn btn-google-plus btn-block">Log-in with Google+</button>
			</div>
			
			<div class="col-md-12">
				<div class="login-modal-or">
					<div><span>or</span></div>
				</div>
			</div>
			
			<div class="col-sm-12 col-md-12">
	
				<div class="form-group"> 
					<label>Username</label>
					<input class="form-control" placeholder="Min 4 and Max 10 characters" type="text"> 
				</div>
			
			</div>
			
			<div class="col-sm-12 col-md-12">
			
				<div class="form-group"> 
					<label>Password</label>
					<input class="form-control" placeholder="Min 4 and Max 10 characters" type="text"> 
				</div>
			
			</div>
			
			<div class="col-sm-6 col-md-6">
				<div class="checkbox-block"> 
					<input id="remember_me_checkbox" name="remember_me_checkbox" class="checkbox" value="First Choice" type="checkbox"> 
					<label class="" for="remember_me_checkbox">Remember me</label>
				</div>
			</div>
			
			<div class="col-sm-6 col-md-6">
				<div class="login-box-link-action">
					<a data-toggle="modal" href="#forgotPasswordModal" class="block line18 mt-1">Forgot password?</a> 
				</div>
			</div>
			
			<div class="col-sm-12 col-md-12">
				<div class="login-box-box-action">
					No account? <a data-toggle="modal" href="#registerModal">Register</a>
				</div>
			</div>
			
		</div>
	</div>
	
	<div class="modal-footer text-center">
		<button type="button" class="btn btn-primary">Log-in</button>
		<button type="button" data-dismiss="modal" class="btn btn-primary btn-border">Close</button>
	</div>
	
</div>
<!-- end Sign-in Modal -->

<!-- start Register Modal -->
<div id="registerModal" class="modal fade login-box-wrapper" tabindex="-1" data-backdrop="static" data-keyboard="false" data-replace="true">

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
					<input class="form-control" placeholder="Min 4 and Max 10 characters" type="text"> 
				</div>
			
			</div>
			
			<div class="col-sm-12 col-md-12">
	
				<div class="form-group"> 
					<label>Email Address</label>
					<input class="form-control" placeholder="Enter your email address" type="text"> 
				</div>
			
			</div>
			
			<div class="col-sm-12 col-md-12">
			
				<div class="form-group"> 
					<label>Password</label>
					<input class="form-control" placeholder="Min 8 and Max 20 characters" type="text"> 
				</div>
			
			</div>
			
			<div class="col-sm-12 col-md-12">
			
				<div class="form-group"> 
					<label>Password Confirmation</label>
					<input class="form-control" placeholder="Re-type password again" type="text"> 
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
					Already have account? <a data-toggle="modal" href="#loginModal">Log-in</a>
				</div>
			</div>
			
		</div>
	
	</div>
	
	<div class="modal-footer text-center">
		<button type="button" class="btn btn-primary">Register</button>
		<button type="button" data-dismiss="modal" class="btn btn-primary btn-border">Close</button>
	</div>
	
</div>
<!-- end Register Modal -->

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

<!-- Detail Page JS -->
<script type="text/javascript" src="/js/jquery.stickit.js"></script>
<script type="text/javascript" src="/js/bootstrap-tokenfield.js"></script>
<script type="text/javascript" src="/js/typeahead.bundle.min.js"></script>
<script type="text/javascript" src="/js/jquery.sumogallery.js"></script>
<script type="text/javascript" src="/js/images-grid.js"></script>
<script type="text/javascript" src="/js/jquery.bootstrap-touchspin.js"></script>
<script type="text/javascript" src="/js/customs-detail.js"></script>

<!-- Dashboard Edit Profile Page JS -->
<script type="text/javascript" src="/js/fileinput.min.js"></script>
<script type="text/javascript" src="/js/customs-fileinput.js"></script>
<script type="text/javascript" src="/js/bootstrap3-wysihtml5.min.js"></script>
<script>

$('.bootstrap3-wysihtml5').wysihtml5({});
</script>

</body>

</html>