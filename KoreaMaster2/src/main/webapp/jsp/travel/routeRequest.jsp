<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Title Of Site -->
	<title>Create Trip</title>
	<meta name="description" content="HTML template for multiple tour agency, local agency, traveller, tour hosting based on Twitter Bootstrap 3.x.x" />
	<meta name="keywords" content="tour agency, tour guide, travel, trip, holiday, vocation, relax, adventure, virtual tour, tour planner" />
	<meta name="author" content="crenoveative">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	<!-- Fav and Touch Icons -->
	<link rel="apple-touch-icon" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon" href="images/ico/apple-touch-icon-57-precomposed.png">
	<link rel="shortcut icon" href="images/ico/favicon.png">

	<!-- CSS Plugins -->
	<link rel="stylesheet" type="text/css" href="/bootstrap//css/bootstrap.min.css" media="screen">	
	<link href="/css/main.css" rel="stylesheet">
	<link href="/css/plugin.css" rel="stylesheet">

	<!-- CSS Custom -->
	<link href="/css/style.css" rel="stylesheet">
	
	<!-- Add your style -->
	<link href="/css/your-style.css" rel="stylesheet">

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	
</head>

<body class="transparent-header">

	<!-- start Container Wrapper -->
	<div class="container-wrapper">

		<!-- start Header -->
		
		<header id="header">
			<jsp:include page="/include/navigation.jsp"/>
		</header>
		
		<!-- end Header -->

		<!-- start Main Wrapper -->
		
		<div class="main-wrapper scrollspy-container">
		
			<!-- start breadcrumb -->
			
			<div class="breadcrumb-image-bg pb-100 no-bg" style="background-image:url('images/breadcrumb-bg.jpg');">
				<div class="container">

					<div class="page-title">
					
						<div class="row">
						
							<div class="col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3">
							
								<h2>Create Your Tour</h2>
						
							</div>
							
						</div>

					</div>
					
					<div class="breadcrumb-wrapper">
					
						<ol class="breadcrumb">
							<li><a href="#">Home</a></li>
							<li class="active"><span>Trip Create</span></li>
						</ol>
					
					</div>

				</div>
				
			</div>
			
			<!-- end breadcrumb -->
			
			<div class="bg-light">
			
				<div class="create-tour-wrapper">

					<div class="container">
					
						<div class="row">
						
							<div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
							
								<div class="form">
								
									<div class="create-tour-inner">
									
									
										<div class="row">
										<div class="sidebar-booking-inner">
												<div class="row gap-10" id="rangeDatePicker">
													<div class="col-xss-12 col-xs-6 col-sm-6">
														<div class="form-group">
															<label>From</label> <input type="text"
																id="rangeDatePickerTo" class="form-control"
																placeholder="yyyy/mm/dd" />
														</div>
													</div>

													<div class="col-xss-12 col-xs-6 col-sm-6">
														<div class="form-group">
															<label>To</label> <input type="text"
																id="rangeDatePickerFrom" class="form-control"
																placeholder="yyyy/mm/dd" />
														</div>
													</div>
												</div>

											</div>
											
											<div class="col-xs-6 col-sm-6">
												<div class="form-group">
													<label>시도</label>
													<select class="selectpicker show-tick form-control" title="Select placeholder">
														<option value="0">Select Option 1</option>
														<option value="1">Select Option 2</option>
														<option value="2">Select Option 3</option>
														<option value="3">Select Option 4</option>
													</select>
												</div>
												
											</div>
											
											<div class="col-xs-6 col-sm-6">
											
												<div class="form-group">
													<label>시군구</label>
													<select class="selectpicker show-tick form-control" title="Select placeholder">
														<option value="0">Select Option 1</option>
														<option value="1">Select Option 2</option>
														<option value="2">Select Option 3</option>
														<option value="3">Select Option 4</option>
													</select>
												</div>
												
											</div>
										</div>
										
										<hr>
										<h5 class="text-uppercase">이번 여행에서 원하는 테마가 있으면 선택해주세요. <br>
										본인 성향대로 평소처럼 여행하고 싶다면 선택하지 않으셔도 됩니다.</h5>
										
										<div class="row gap-20">
											
											<div class="col-xs-8 col-sm-8">
											
												<label class="block">Tour style:</label>
												
												<div class="category-checkbox-wrapper clearfix mt-10 mb-15">
					
													<div class="category-checkbox-item">
														<div class="checkbox-block">
															<input id="checkbox_block-1" name="checkbox_block" type="checkbox" class="checkbox"/>
															<label class="" for="checkbox_block-1">
																<span class="category-checkbox-inner">
																	<span class="middle-outer">
																		<span class="middle-inner">
																			<span class="icon">
																				<i class="flaticon-travel-icons-mountain"></i>
																			</span>
																			자연
																		</span>
																	</span>
																</span>
															</label>
														</div>
													</div>
													
													<div class="category-checkbox-item">
														<div class="checkbox-block">
															<input id="checkbox_block-2" name="checkbox_block" type="checkbox" class="checkbox"/>
															<label class="" for="checkbox_block-2">
																<span class="category-checkbox-inner">
																	<span class="middle-outer">
																		<span class="middle-inner">
																			<span class="icon">
																				<i class="flaticon-travel-icons-snorkel"></i>
																			</span>
																			체험
																		</span>
																	</span>
																</span>
															</label>
														</div>
													</div>
													
													<div class="category-checkbox-item">
														<div class="checkbox-block">
															<input id="checkbox_block-3" name="checkbox_block" type="checkbox" class="checkbox"/>
															<label class="" for="checkbox_block-3">
																<span class="category-checkbox-inner">
																	<span class="middle-outer">
																		<span class="middle-inner">
																			<span class="icon">
																				<i class="flaticon-ventures-wallet-closed"></i>
																			</span>
																			문화시설
																		</span>
																	</span>
																</span>
															</label>
														</div>
													</div>
													
													<div class="category-checkbox-item">
														<div class="checkbox-block">
															<input id="checkbox_block-4" name="checkbox_block" type="checkbox" class="checkbox"/>
															<label class="" for="checkbox_block-4">
																<span class="category-checkbox-inner">
																	<span class="middle-outer">
																		<span class="middle-inner">
																			<span class="icon">
																				<i class="flaticon-travel-icons-kayak"></i>
																			</span>
																			레포츠
																		</span>
																	</span>
																</span>
															</label>
														</div>
													</div>
												
													<div class="category-checkbox-item">
														<div class="checkbox-block">
															<input id="checkbox_block-5" name="checkbox_block" type="checkbox" class="checkbox"/>
															<label class="" for="checkbox_block-5">
																<span class="category-checkbox-inner">
																	<span class="middle-outer">
																		<span class="middle-inner">
																			<span class="icon">
																				<i class="flaticon-ventures-big-towers"></i>
																			</span>
																			역사
																		</span>
																	</span>
																</span>
															</label>
														</div>
													</div>
													
													<div class="category-checkbox-item">
														<div class="checkbox-block">
															<input id="checkbox_block-6" name="checkbox_block" type="checkbox" class="checkbox"/>
															<label class="" for="checkbox_block-6">
																<span class="category-checkbox-inner">
																	<span class="middle-outer">
																		<span class="middle-inner">
																			<span class="icon">
																				<i class="flaticon-ventures-cart-facing-left"></i>
																			</span>
																			쇼핑
																		</span>
																	</span>
																</span>
															</label>
														</div>
													</div>
													
												</div>
											</div><!-- ./col-xs-12 col-sm-12 -->
											
										</div>

									</div>
								
									<div class="mb-50">
					
										<div class="mb-25"></div>
										<a href="requested-create-done.html" class="btn btn-primary btn-wide">Submit</a>
										
									</div>
									
								</div>
								
							</div>
						
						</div>
						
					</div>
					
				</div>
			
			</div>

		</div>
		
		<!-- end Main Wrapper -->
		
		<jsp:include page="/include/footer.jsp"/>
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

<!-- Create Page JS -->
<script type="text/javascript" src="/js/jquery.bootstrap-touchspin.js"></script>
<script type="text/javascript" src="/js/dropzone.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/jquery.ui.timepicker.js"></script>
<script type="text/javascript" src="/js/bootstrap-tokenfield.js"></script>
<script type="text/javascript" src="/js/typeahead.bundle.min.js"></script>
<script type="text/javascript" src="/js/customs-create.js"></script>

<!-- Detail Page JS -->
<script type="text/javascript" src="/js/customs-datepicker.js"></script>

</body>


</html>