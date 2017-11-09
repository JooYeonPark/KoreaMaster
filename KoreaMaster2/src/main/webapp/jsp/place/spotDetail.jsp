<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Title Of Site -->
<title>Togoby - Tour hosting</title>
<meta name="description"
	content="HTML template for multiple tour agency, local agency, traveller, tour hosting based on Twitter Bootstrap 3.x.x" />
<meta name="keywords"
	content="tour agency, tour guide, travel, trip, holiday, vocation, relax, adventure, virtual tour, tour planner" />
<meta name="author" content="crenoveative">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- Fav and Touch Icons -->
<link rel="apple-touch-icon" sizes="144x144"
	href="/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon"
	href="/images/ico/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="/images/ico/favicon.png">

<!-- CSS Plugins -->
<link rel="stylesheet" type="text/css"
	href="/bootstrap//css/bootstrap.min.css" media="screen">
<link href="/css/main.css" rel="stylesheet">
<link href="/css/plugin.css" rel="stylesheet">

<!-- CSS Custom -->
<link href="/css/style.css" rel="stylesheet">
<link href="/css/routeDetail.css" rel="stylesheet">
<link href="/css/itineraryStyle.css" rel="stylesheet">

<!-- Add your style -->
<link href="/css/your-style.css" rel="stylesheet">

</head>

<body class="transparent-header with-multiple-sticky">

	<!-- start Container Wrapper -->
	<div class="container-wrapper">

		<!-- start Header -->
		<header id="header">

			<!-- start Navbar (Header) -->
			<jsp:include page="/include/navigation.jsp"/>
			<!-- end Navbar (Header) -->

		</header>
		<!-- end Header -->

		<!-- start Main Wrapper -->

		<div class="main-wrapper scrollspy-container">

			<!-- start breadcrumb -->

			<div class="breadcrumb-image-bg detail-breadcrumb"
				style="background-image: url('/images/detail-header.jpg');">
				<div class="container">

					<div class="page-title detail-header-02">

						<div class="row">

							<div
								class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">

								<h2>Bangkok-Pattaya Safari Adventure</h2>
								<span class="labeling text-white mt-25"><span>Bangkok,
										Pattaya, Choburi, &amp; Sattaheeb</span> <span>5 days 4 nights</span></span>
								<div class="rating-item rating-item-lg mb-25">
									<input type="hidden" class="rating"
										data-filled="fa fa-star rating-rated"
										data-empty="fa fa-star-o" data-fractions="2" data-readonly
										value="4.5" />
									<div class="rating-text">
										<a href="#">(32 reviews)</a>
									</div>
								</div>
								<ul class="list-with-icon list-inline-block">
									<li><i class="ion-android-done text-primary"></i>100%
										private</li>
									<li><i class="ion-android-done text-primary"></i>Instantly
										confirmed</li>
									<li><i class="ion-android-done text-primary"></i>Free
										cancellation</li>
									<li><i class="ion-android-done text-primary"></i>Satisfaction
										guarantee</li>
								</ul>

							</div>

						</div>

					</div>

					<!-- 현재 페이지 경로 표시 START -->
					<div class="breadcrumb-wrapper text-left">

						<ol class="breadcrumb">
							<li><a href="#">Home</a></li>
							<li><a href="#">Offered</a></li>
							<li><a href="#">Thailand</a></li>
							<li class="active">Bangkok</li>
						</ol>

					</div>
					<!-- 현재 페이지 경로 표시 END -->

				</div>

			</div>
			<!-- end breadcrumb -->

			<!-- 루트 소메뉴 START -->
			<div class="multiple-sticky hidden-sm hidden-xs">
				<div class="multiple-sticky-inner">
					<div class="multiple-sticky-container container">
						<div class="multiple-sticky-item clearfix">
							<ul id="multiple-sticky-menu"
								class="multiple-sticky-menu clearfix">
								<li><a href="#detail-content-sticky-nav-01">Overview</a></li>
								<li><a href="#detail-content-sticky-nav-02">Gallery</a></li>
								<li><a href="#detail-content-sticky-nav-03">Itinerary</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- 루트 소메뉴  END -->


			<!-- 주 컨테이너 -->
			<div class="pt-50 pb-50">
				<div id="detail-content-sticky-nav-01">
					<div class="container">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-8">
								<div class="content-wrapper">
								
								<!-- 여행지 사진 갤러리 START -->
									<div id="detail-content-sticky-nav-02">
										<h2 class="font-lg">Gallery</h2>

										<div class="gallery-grid-3-2-wrapper mb-30">
											<div id="gallery1"></div>
										</div>

										<div class="mb-25"></div>
										<div class="bb"></div>
										<div class="mb-25"></div>

									</div>
									<!-- 여행지 사진 갤러리  END -->
									
									
									<h3 class="section-title">Tour Title</h3>
									<div id="detail-content-sticky-nav-01">
										<!-- 여행 설명 : 문장으로  START-->
										<p class="lead">Goodness doubtful material has denoting
											suitable she two. Dear mean she way and poor bred they come.
											He otherwise me incommode explained so in remaining. Polite
											barton in it warmly do county length. Dissuade ecstatic and
											properly saw entirely sir why laughter endeavor.</p>
										<!-- 여행 설명 : 문장으로 END -->



										<!-- 여행 테마 아이콘으로 START -->
										<div class="featured-icon-simple-wrapper">
											<div class="GridLex-gap-30 GridLex-gap-20-xs">
												<div
													class="GridLex-grid-noGutter-equalHeight GridLex-grid-4_sm-4_xs-3_xss-1 GridLex-grid-center">

													<div class="GridLex-col">
														<div class="featured-icon-simple-item">
															<div class="icon text-primary">
																<i class="flaticon-travel-icons-mountain"></i>
															</div>
															Adventure
														</div>
													</div>

													<div class="GridLex-col">
														<div class="featured-icon-simple-item">
															<div class="icon text-primary">
																<i class="flaticon-travel-icons-island"></i>
															</div>
															Beach
														</div>
													</div>

													<div class="GridLex-col">
														<div class="featured-icon-simple-item">
															<div class="icon text-primary">
																<i class="flaticon-travel-icons-kayak"></i>
															</div>
															Kayak
														</div>
													</div>

													<div class="GridLex-col">
														<div class="featured-icon-simple-item">
															<div class="icon text-primary">
																<i class="flaticon-travel-icons-cocktail"></i>
															</div>
															Sweet
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- 여행 테마 아이콘으로 END -->

										<div class="mb-25"></div>
										<div class="bb"></div>
										<div class="mb-25"></div>

										<!-- 여행 상세 정보  -->
										<div class="row">
											<div class="col-xs-12 col-sm-12 col-md-12">
												<div class="featured-list-in-box">
													<h4 class="uppercase spacing-1">Trip Detail</h4>

													<ul class="clearfix">
														<li class="row gap-20">
															<div class="col-xs-12 col-sm-7">상세주소</div>
															<div
																class="col-xs-12 col-sm-5 text-primary text-right text-left-xs mt-xs space">
																<i class="ti-location-pin mr-5"></i> Bangkok in't
																airport
															</div>
														</li>
														<li class="row gap-20">
															<div class="col-xs-12 col-sm-7">운영시간</div>
															<div
																class="col-xs-12 col-sm-5 text-primary text-right text-left-xs mt-xs space">
																<i class="ti-timer mr-5"></i> 09:00 am
															</div>
														</li>
														<li class="row gap-20">
															<div class="col-xs-12 col-sm-7">휴관일</div>
															<div
																class="col-xs-12 col-sm-5 text-primary text-right text-left-xs mt-xs space">
																<i class="ti-user mr-5"></i> 23
															</div>
														</li>
														<li class="row gap-20">
															<div class="col-xs-12 col-sm-7">연락처</div>
															<div
																class="col-xs-12 col-sm-5 text-primary text-right text-left-xs mt-xs space">
																<i class="ti-flag mr-5"></i> English, Thai, Malay
															</div>
														</li>
														<li class="row gap-20">
															<div class="col-xs-12 col-sm-7">요금</div>
															<div
																class="col-xs-12 col-sm-5 text-primary text-right text-left-xs mt-xs space">
																<i class="ti-flag mr-5"></i> English, Thai, Malay
															</div>
														</li>
														<li class="row gap-20">
															<div class="col-xs-12 col-sm-7">홈페이지</div>
															<div
																class="col-xs-12 col-sm-5 text-primary text-right text-left-xs mt-xs space">
																<i class="ti-flag mr-5"></i> English, Thai, Malay
															</div>
														</li>
													</ul>
												</div>
											</div>
										</div>

										<div class="mb-25"></div>
										<div class="bb"></div>
										<div class="mb-25"></div>

									</div>

								</div>
							</div>

							<!-- 오른쪽 사이드 메뉴 START -->
							<div id="sidebar-sticky" class="col-xs-12 col-sm-12 col-md-4">
								<aside class="sidebar-wrapper">
									

									<!-- 내 루트 저장 버튼 -->
									<a href="#" class="add-fav-btn mt-25 ml-10 ml-0-sm">
										<div class="inner">
											<i class="ti-heart"></i> Add Favourite
										</div>
									</a>

									<div class="hash-tag-wrapper clearfix mt-10 ml-10 ml-0-sm">
										<a href="#" class="hash-tag"># Bangkok trip</a> <a href="#"
											class="hash-tag"># Pattay float market</a> <a href="#"
											class="hash-tag"># Choburi one day</a> <a href="#"
											class="hash-tag"># Sattaheeb the beach</a>
									</div>

								</aside>

							</div>
							<!-- 오른쪽 사이드 메뉴 END -->
						</div>
					</div>
				</div>
				<!-- detail-content-sticky-nav-01  div END -->

				<div class="multiple-sticky no-border hidden-sm hidden-xs">&#032;</div>
				<!-- is used to stop the above stick menu -->

				<!-- 또다른 추천 루트  START -->
				<div class="bg-light pt-50 pb-70">
					<div class="container">
					
						<h2 class="font-lg">Relatded tours</h2>

						<div class="trip-guide-wrapper">
							<div class="GridLex-gap-20 GridLex-gap-10-mdd GridLex-gap-5-xs">
								<div class="GridLex-grid-noGutter-equalHeight GridLex-grid-center">
									<!-- 추천 경로 1 START -->
									<div class="GridLex-col-3_mdd-4_sm-6_xs-6_xss-12">

										<div class="trip-guide-item">
											<div class="trip-guide-image">
												<img src="/images/trip/01.jpg" alt="images" />
											</div>
											<div class="trip-guide-content">
												<h3>Bangkok-Pattaya Safari Adventure</h3>
												<p>Game of as rest time eyes with of this it. Add was
													music merry any truth since going...</p>
											</div>
											<div class="trip-guide-bottom">

												<div class="trip-guide-person clearfix">
													<div class="image">
														<img src="/images/testimonial/01.jpg" class="img-circle"
															alt="images" />
													</div>
													<p class="name">
														By: <a href="#">Robert Kalvin</a>
													</p>
													<p>Local expert from Thailand</p>
												</div>

												<div class="trip-guide-meta row gap-10">
													<div class="col-xs-6 col-sm-6">
														<div class="rating-item">
															<input type="hidden" class="rating"
																data-filled="fa fa-star rating-rated"
																data-empty="fa fa-star-o" data-fractions="2"
																data-readonly value="4.5" />
														</div>
													</div>
													<div class="col-xs-6 col-sm-6 text-right">5 days 4
														nights</div>
												</div>

												<div class="row gap-10">
													<div class="col-xs-12 col-sm-6">
														<div class="trip-guide-price">
															Starting at <span class="number">USD687.00</span>
														</div>
													</div>
													<div class="col-xs-12 col-sm-6 text-right">
														<a href="#" class="btn btn-primary">Details</a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- 추천 경로 1 END -->

									<!-- 추천 경로2 START -->
									<div class="GridLex-col-3_mdd-4_sm-6_xs-6_xss-12">

										<div class="trip-guide-item">
											<div class="trip-guide-image">
												<img src="/images/trip/01.jpg" alt="images" />
											</div>
											<div class="trip-guide-content">
												<h3>Bangkok-Pattaya Safari Adventure</h3>
												<p>Game of as rest time eyes with of this it. Add was
													music merry any truth since going...</p>
											</div>
											<div class="trip-guide-bottom">

												<div class="trip-guide-person clearfix">
													<div class="image">
														<img src="/images/testimonial/01.jpg" class="img-circle"
															alt="images" />
													</div>
													<p class="name">
														By: <a href="#">Robert Kalvin</a>
													</p>
													<p>Local expert from Thailand</p>
												</div>

												<div class="trip-guide-meta row gap-10">
													<div class="col-xs-6 col-sm-6">
														<div class="rating-item">
															<input type="hidden" class="rating"
																data-filled="fa fa-star rating-rated"
																data-empty="fa fa-star-o" data-fractions="2"
																data-readonly value="4.5" />
														</div>
													</div>
													<div class="col-xs-6 col-sm-6 text-right">5 days 4
														nights</div>
												</div>

												<div class="row gap-10">
													<div class="col-xs-12 col-sm-6">
														<div class="trip-guide-price">
															Starting at <span class="number">USD687.00</span>
														</div>
													</div>
													<div class="col-xs-12 col-sm-6 text-right">
														<a href="#" class="btn btn-primary">Details</a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- 추천 경로2 END -->

									<!-- 추천 경로 3 START -->
									<div class="GridLex-col-3_mdd-4_sm-6_xs-6_xss-12">

										<div class="trip-guide-item">
											<div class="trip-guide-image">
												<img src="/images/trip/01.jpg" alt="images" />
											</div>
											<div class="trip-guide-content">
												<h3>Bangkok-Pattaya Safari Adventure</h3>
												<p>Game of as rest time eyes with of this it. Add was
													music merry any truth since going...</p>
											</div>
											<div class="trip-guide-bottom">

												<div class="trip-guide-person clearfix">
													<div class="image">
														<img src="/images/testimonial/01.jpg" class="img-circle"
															alt="images" />
													</div>
													<p class="name">
														By: <a href="#">Robert Kalvin</a>
													</p>
													<p>Local expert from Thailand</p>
												</div>

												<div class="trip-guide-meta row gap-10">
													<div class="col-xs-6 col-sm-6">
														<div class="rating-item">
															<input type="hidden" class="rating"
																data-filled="fa fa-star rating-rated"
																data-empty="fa fa-star-o" data-fractions="2"
																data-readonly value="4.5" />
														</div>
													</div>
													<div class="col-xs-6 col-sm-6 text-right">5 days 4
														nights</div>
												</div>

												<div class="row gap-10">
													<div class="col-xs-12 col-sm-6">
														<div class="trip-guide-price">
															Starting at <span class="number">USD687.00</span>
														</div>
													</div>
													<div class="col-xs-12 col-sm-6 text-right">
														<a href="#" class="btn btn-primary">Details</a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- 추천 경로 3 END -->

									<!-- 추천 경로 4 START -->
									<div class="GridLex-col-3_mdd-4_sm-6_xs-6_xss-12">

										<div class="trip-guide-item">
											<div class="trip-guide-image">
												<img src="/images/trip/01.jpg" alt="images" />
											</div>
											<div class="trip-guide-content">
												<h3>Bangkok-Pattaya Safari Adventure</h3>
												<p>Game of as rest time eyes with of this it. Add was
													music merry any truth since going...</p>
											</div>
											<div class="trip-guide-bottom">

												<div class="trip-guide-person clearfix">
													<div class="image">
														<img src="/images/testimonial/01.jpg" class="img-circle"
															alt="images" />
													</div>
													<p class="name">
														By: <a href="#">Robert Kalvin</a>
													</p>
													<p>Local expert from Thailand</p>
												</div>

												<div class="trip-guide-meta row gap-10">
													<div class="col-xs-6 col-sm-6">
														<div class="rating-item">
															<input type="hidden" class="rating"
																data-filled="fa fa-star rating-rated"
																data-empty="fa fa-star-o" data-fractions="2"
																data-readonly value="4.5" />
														</div>
													</div>
													<div class="col-xs-6 col-sm-6 text-right">5 days 4
														nights</div>
												</div>

												<div class="row gap-10">
													<div class="col-xs-12 col-sm-6">
														<div class="trip-guide-price">
															Starting at <span class="number">USD687.00</span>
														</div>
													</div>
													<div class="col-xs-12 col-sm-6 text-right">
														<a href="#" class="btn btn-primary">Details</a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- 추천 경로 4 END -->

								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 또다른 추천 루트 END -->
			</div>
		</div>
		<!-- end Main Wrapper -->

		<!-- footer -->
		<jsp:include page="/include/footer.jsp"/>

	</div>
	<!-- end Container Wrapper -->


	<!-- start Back To Top -->
	<div id="back-to-top">
		<a href="#"><i class="ion-ios-arrow-up"></i></a>
	</div>

	<!-- end Back To Top -->

	<!-- start Sign-in Modal -->
	<div id="loginModal" class="modal fade login-box-wrapper" tabindex="-1"
		data-width="550" data-backdrop="static" data-keyboard="false"
		data-replace="true">

		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">&times;</button>
			<h4 class="modal-title text-center">Sign-in into your account</h4>
		</div>

		<div class="modal-body">
			<div class="row gap-20">

				<div class="col-sm-6 col-md-6">
					<button class="btn btn-facebook btn-block mb-5-xs">Log-in
						with Facebook</button>
				</div>
				<div class="col-sm-6 col-md-6">
					<button class="btn btn-google-plus btn-block">Log-in with
						Google+</button>
				</div>

				<div class="col-md-12">
					<div class="login-modal-or">
						<div>
							<span>or</span>
						</div>
					</div>
				</div>

				<div class="col-sm-12 col-md-12">

					<div class="form-group">
						<label>Username</label> <input class="form-control"
							placeholder="Min 4 and Max 10 characters" type="text">
					</div>

				</div>

				<div class="col-sm-12 col-md-12">

					<div class="form-group">
						<label>Password</label> <input class="form-control"
							placeholder="Min 4 and Max 10 characters" type="text">
					</div>

				</div>

				<div class="col-sm-6 col-md-6">
					<div class="checkbox-block">
						<input id="remember_me_checkbox" name="remember_me_checkbox"
							class="checkbox" value="First Choice" type="checkbox"> <label
							class="" for="remember_me_checkbox">Remember me</label>
					</div>
				</div>

				<div class="col-sm-6 col-md-6">
					<div class="login-box-link-action">
						<a data-toggle="modal" href="#forgotPasswordModal"
							class="block line18 mt-1">Forgot password?</a>
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
			<button type="button" data-dismiss="modal"
				class="btn btn-primary btn-border">Close</button>
		</div>

	</div>
	<!-- end Sign-in Modal -->

	<!-- start Register Modal -->
	<div id="registerModal" class="modal fade login-box-wrapper"
		tabindex="-1" data-backdrop="static" data-keyboard="false"
		data-replace="true">

		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">&times;</button>
			<h4 class="modal-title text-center">Create your account for free</h4>
		</div>

		<div class="modal-body">

			<div class="row gap-20">

				<div class="col-sm-6 col-md-6">
					<button class="btn btn-facebook btn-block mb-5-xs">Register
						with Facebook</button>
				</div>
				<div class="col-sm-6 col-md-6">
					<button class="btn btn-google-plus btn-block">Register
						with Google+</button>
				</div>

				<div class="col-md-12">
					<div class="login-modal-or">
						<div>
							<span>or</span>
						</div>
					</div>
				</div>

				<div class="col-sm-12 col-md-12">

					<div class="form-group">
						<label>Username</label> <input class="form-control"
							placeholder="Min 4 and Max 10 characters" type="text">
					</div>

				</div>

				<div class="col-sm-12 col-md-12">

					<div class="form-group">
						<label>Email Address</label> <input class="form-control"
							placeholder="Enter your email address" type="text">
					</div>

				</div>

				<div class="col-sm-12 col-md-12">

					<div class="form-group">
						<label>Password</label> <input class="form-control"
							placeholder="Min 8 and Max 20 characters" type="text">
					</div>

				</div>

				<div class="col-sm-12 col-md-12">

					<div class="form-group">
						<label>Password Confirmation</label> <input class="form-control"
							placeholder="Re-type password again" type="text">
					</div>

				</div>

				<div class="col-sm-12 col-md-12">
					<div class="checkbox-block">
						<input id="register_accept_checkbox"
							name="register_accept_checkbox" class="checkbox"
							value="First Choice" type="checkbox"> <label class=""
							for="register_accept_checkbox">By register, I read &amp;
							accept <a href="#">the terms</a>
						</label>
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
			<button type="button" data-dismiss="modal"
				class="btn btn-primary btn-border">Close</button>
		</div>

	</div>
	<!-- end Register Modal -->

	<!-- start Forget Password Modal -->
	<div id="forgotPasswordModal" class="modal fade login-box-wrapper"
		tabindex="-1" data-backdrop="static" data-keyboard="false"
		data-replace="true">

		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">&times;</button>
			<h4 class="modal-title text-center">Restore your forgotten
				password</h4>
		</div>

		<div class="modal-body">
			<div class="row gap-20">

				<div class="col-sm-12 col-md-12">
					<p class="mb-20">Maids table how learn drift but purse stand
						yet set. Music me house could among oh as their. Piqued our sister
						shy nature almost his wicket. Hand dear so we hour to.</p>
				</div>

				<div class="col-sm-12 col-md-12">

					<div class="form-group">
						<label>Email Address</label> <input class="form-control"
							placeholder="Enter your email address" type="text">
					</div>

				</div>

				<div class="col-sm-12 col-md-12">
					<div class="checkbox-block">
						<input id="forgot_password_checkbox"
							name="forgot_password_checkbox" class="checkbox"
							value="First Choice" type="checkbox"> <label class=""
							for="forgot_password_checkbox">Generate new password</label>
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
			<button type="button" data-dismiss="modal"
				class="btn btn-primary btn-border">Close</button>
		</div>

	</div>
	<!-- end Forget Password Modal -->

	<!-- Core JS -->
	<script type="text/javascript" src="/js/jquery-1.11.3.min.js"></script>
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


	<script type="text/javascript" src="/js/moment.min.js"></script>
	<script type="text/javascript" src="/js/jquery.daterangepicker.js"></script>
	<script type="text/javascript" src="/js/customs-datepicker.js"></script>

	<!-- Custom JS -->
	<script type="text/javascript" src="/js/routeDetail.js"></script>

</body>

</html>