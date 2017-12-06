<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Title Of Site -->
<title>한반도 뽀개기</title>
<meta name="description"
	content="HTML template for multiple tour agency, local agency, traveller, tour hosting based on Twitter Bootstrap 3.x.x" />
<meta name="keywords"
	content="tour agency, tour guide, travel, trip, holiday, vocation, relax, adventure, virtual tour, tour planner" />
<meta name="author" content="crenoveative">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- Fav and Touch Icons -->
<link rel="apple-touch-icon" sizes="144x144"
	href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon"
	href="images/ico/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="images/ico/favicon.png">

<!-- CSS Plugins -->
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css" media="screen">
<link href="css/main.css" rel="stylesheet">
<link href="css/plugin.css" rel="stylesheet">

<!-- CSS Custom -->
<link href="css/style.css" rel="stylesheet">

<!-- Add your style -->
<link href="css/your-style.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>

<body class="home transparent-header">

	<div id="introLoader" class="introLoading"></div>

	<!-- start Container Wrapper -->

	<div class="container-wrapper">

		<!-- start Header -->
		<header id="header">
			<jsp:include page="include/navigation.jsp" />
		</header>
		<!-- end Header -->

		<!-- start Main Wrapper -->
		<div class="main-wrapper scrollspy-container">

			<!-- start hero-header -->
			<div class="hero img-bg-01">
				<div class="container">

					<h1>Where do you want to go?</h1>
					<p>Discover your wonderful and unique travel plan</p>

					<form>
						<div class="form-group">
							<input type="text" placeholder="ex: Seoul,Busan,Incheon"
								class="form-control flexdatalist" name="countries">
							<button class="btn">
								<i class="icon-magnifier"></i>
							</button>
						</div>
						
					</form>

				</div>

			</div>
			<!-- end hero-header -->

			<div class="post-hero clearfix">

				<div class="container">

					<div class="row">
					
						<div class="col-xs-12 col-sm-4 mb-20-xs">
							<div class="horizontal-featured-icon-sm clearfix">
								<div class="icon">
									<i class="ri ri-location"></i>
								</div>
								<div class="content">
									<h6>Looking for a tour plan?</h6>
									<span>We will give you wonderful plan.</span>
								</div>
							</div>
						</div>

						<div class="col-xs-12 col-sm-4 mb-20-xs">
							<div class="horizontal-featured-icon-sm clearfix">
								<div class="icon">
									<i class="ri ri-user"></i>
								</div>
								<div class="content">
									<h6>Need someone to make your plan?</h6>
									<span>We give personalized service. It must satisfy you!!</span>
								</div>
							</div>
						</div>

						<div class="col-xs-12 col-sm-4 mb-20-xs">
							<div class="horizontal-featured-icon-sm clearfix">
								<div class="icon">
									<i class="ri ri-equal-circle"></i>
								</div>
								<div class="content">
									<h6>Want to save your time?</h6>
									<span>You can save your time using our service. Cause we will give perfect plan.</span>
								</div>
							</div>
						</div>

					</div>

				</div>

			</div>
			
			
			<div class="featured-bg pt-80 pb-60 img-bg-02">

				<div class="container">

					<div class="row">


					</div>

					<div class="row mt-70">

						<div class="col-xs-12 col-sm-8 col-sm-offset-2">

							<div class="fearured-join-item mb-0">
								<h2 class="alt-font-size">Create Your Trip?</h2>
								<p class="mb-25 font20">We will give you wonderful and perfect plan for only you! click below button.
								Let's time to make your plan!</p>
								<a href="/jsp/travel/routeRequest.jsp" class="btn btn-primary btn-lg">Make My Plan</a>
							</div>

						</div>

					</div>

				</div>

			</div>

			<div class="container pt-70 pb-60 clearfix">

				<div class="row">

					<div class="col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">

						<div class="section-title">

							<h2 class="uppercase">THEMES</h2>

						</div>

					</div>

				</div>

				<div class="mb-30">

					<div class="GridLex-gap-20 GridLex-gap-15-mdd GridLex-gap-10-xs">

						<div class="GridLex-grid-noGutter-equalHeight">

							<div class="GridLex-col-4_sm-4_xs-6_xss-12">

								<div class="top-destination-item">
									<a href="/jsp/place/spotList.jsp?themeName=3">
										<div class="image">
											<img src="images/top-destinations/culture.jpg" alt="images" />
										</div>
										<h4 class="uppercase">
											<span>culture</span>
										</h4>
									</a>
								</div>
							</div>

							<div class="GridLex-col-4_sm-4_xs-6_xss-12">

								<div class="top-destination-item">
									<a href="/jsp/place/spotList.jsp?themeName=2">
										<div class="image">
											<img src="images/top-destinations/experience.jpg" alt="images" />
										</div>
										<h4 class="uppercase">
											<span>Experience</span>
										</h4>
									</a>
								</div>

							</div>

							<div class="GridLex-col-4_sm-4_xs-6_xss-12">

								<div class="top-destination-item">
									<a href="/jsp/place/spotList.jsp?themeName=5">
										<div class="image">
											<img src="images/top-destinations/history.jpg" alt="images" />
										</div>
										<h4 class="uppercase">
											<span>History</span>
										</h4>
									</a>
								</div>

							</div>

							<div class="GridLex-col-4_sm-4_xs-6_xss-12">

								<div class="top-destination-item">
									<a href="/jsp/place/spotList.jsp?themeName=1">
										<div class="image">
											<img src="images/top-destinations/nature.jpg" alt="images" />
										</div>
										<h4 class="uppercase">
											<span>Nature</span>
										</h4>
									</a>
								</div>

							</div>

							<div class="GridLex-col-4_sm-4_xs-6_xss-12">

								<div class="top-destination-item">
									<a href="/jsp/place/spotList.jsp?themeName=6">
										<div class="image">
											<img src="images/top-destinations/shopping.jpg" alt="images" />
										</div>
										<h4 class="uppercase">
											<span>Shopping</span>
										</h4>
									</a>
								</div>
							</div>

							<div class="GridLex-col-4_sm-4_xs-6_xss-12">

								<div class="top-destination-item">
									<a href="/jsp/place/spotList.jsp?themeName=4">
										<div class="image">
											<img src="images/top-destinations/sport.jpg" alt="images" />
										</div>
										<h4 class="uppercase">
											<span>Sport</span>
										</h4>
									</a>
								</div>

							</div>

						</div>

					</div>

				</div>

			</div>

			<div class="bg-white pt-70 pb-60 clearfix">

				<div class="container">

					<div class="row">

						<div class="col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">

							<div class="section-title">

								<h2>Recommended trips</h2>
								<p class="lead">The trips that offered by local guides or
									experts for travellers</p>
							</div>

						</div>

					</div>

					<div class="trip-guide-wrapper mb-30">

						<div class="GridLex-gap-20 GridLex-gap-15-mdd GridLex-gap-10-xs">

							<div class="GridLex-grid-noGutter-equalHeight">

								<div class="GridLex-col-4_mdd-4_sm-6_xs-6_xss-12">

									<div class="trip-guide-item">

										<div class="trip-guide-image">
											<img src="images/trip/01.jpg" alt="images" />
										</div>

										<div class="trip-guide-content">
											<h3>Bangkok-Pattaya Safari Adventure</h3>
											<p>Game of as rest time eyes with of this it. Add was
												music merry any truth since going...</p>
										</div>

										<div class="trip-guide-bottom">

											<div class="trip-guide-person clearfix">
												<div class="image">
													<img src="images/testimonial/01.jpg" class="img-circle"
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
														Starting at <span class="block inline-block-xs">USD
															687.00</span>
													</div>
												</div>
												<div class="col-xs-12 col-sm-6 text-right text-left-xs">
													<a href="#" class="btn btn-primary">Details</a>
												</div>
											</div>

										</div>

									</div>

								</div>

								<div class="GridLex-col-4_mdd-4_sm-6_xs-6_xss-12">

									<div class="trip-guide-item">

										<div class="trip-guide-image">
											<img src="images/trip/02.jpg" alt="images" />
										</div>

										<div class="trip-guide-content">
											<h3>Chiang Mai Sustainable Trails</h3>
											<p>Resolution devonshire pianoforte assistance an he
												particular middletons...</p>
										</div>

										<div class="trip-guide-bottom">

											<div class="trip-guide-person clearfix">
												<div class="image">
													<img src="images/testimonial/01.jpg" class="img-circle"
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
															data-readonly value="4.0" />
													</div>
												</div>
												<div class="col-xs-6 col-sm-6 text-right">5 days 4
													nights</div>
											</div>

											<div class="row gap-10">
												<div class="col-xs-12 col-sm-6">
													<div class="trip-guide-price">
														Starting at <span class="block inline-block-xs">USD
															687.00</span>
													</div>
												</div>
												<div class="col-xs-12 col-sm-6 text-right text-left-xs">
													<a href="#" class="btn btn-primary">Details</a>
												</div>
											</div>

										</div>

									</div>

								</div>

								<div class="GridLex-col-4_mdd-4_sm-6_xs-6_xss-12">

									<div class="trip-guide-item">

										<div class="trip-guide-image">
											<img src="images/trip/03.jpg" alt="images" />
										</div>

										<div class="trip-guide-content">
											<h3>Hong Kong Best Highlight Explore</h3>
											<p>Betrayed cheerful declared end and. Questions we
												additions is extremely incommode...</p>
										</div>

										<div class="trip-guide-bottom">

											<div class="trip-guide-person clearfix">
												<div class="image">
													<img src="images/testimonial/01.jpg" class="img-circle"
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
															data-readonly value="3.5" />
													</div>
												</div>
												<div class="col-xs-6 col-sm-6 text-right">5 days 4
													nights</div>
											</div>

											<div class="row gap-10">
												<div class="col-xs-12 col-sm-6">
													<div class="trip-guide-price">
														Starting at <span class="block inline-block-xs">USD
															687.00</span>
													</div>
												</div>
												<div class="col-xs-12 col-sm-6 text-right text-left-xs">
													<a href="#" class="btn btn-primary">Details</a>
												</div>
											</div>

										</div>

									</div>

								</div>

								<div class="GridLex-col-3_mdd-6_sm-6_xs-6_xss-12">

									<div class="trip-guide-item">

										<div class="trip-guide-image">
											<img src="images/trip/01.jpg" alt="images" />
										</div>

										<div class="trip-guide-content">
											<h3>Bangkok-Pattaya Safari Adventure</h3>
											<p>Game of as rest time eyes with of this it. Add was
												music merry any truth since going...</p>
										</div>

										<div class="trip-guide-bottom">

											<div class="trip-guide-person clearfix">
												<div class="image">
													<img src="images/testimonial/01.jpg" class="img-circle"
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
														Starting at <span class="block inline-block-xs">USD
															687.00</span>
													</div>
												</div>
												<div class="col-xs-12 col-sm-6 text-right text-left-xs">
													<a href="#" class="btn btn-primary">Details</a>
												</div>
											</div>

										</div>

									</div>

								</div>

								<div class="GridLex-col-3_mdd-6_sm-6_xs-6_xss-12">

									<div class="trip-guide-item">

										<div class="trip-guide-image">
											<img src="images/trip/02.jpg" alt="images" />
										</div>

										<div class="trip-guide-content">
											<h3>Chiang Mai Sustainable Trails</h3>
											<p>Resolution devonshire pianoforte assistance an he
												particular middletons...</p>
										</div>

										<div class="trip-guide-bottom">

											<div class="trip-guide-person clearfix">
												<div class="image">
													<img src="images/testimonial/01.jpg" class="img-circle"
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
															data-readonly value="4.0" />
													</div>
												</div>
												<div class="col-xs-6 col-sm-6 text-right">5 days 4
													nights</div>
											</div>

											<div class="row gap-10">
												<div class="col-xs-12 col-sm-6">
													<div class="trip-guide-price">
														Starting at <span class="block inline-block-xs">USD
															687.00</span>
													</div>
												</div>
												<div class="col-xs-12 col-sm-6 text-right text-left-xs">
													<a href="#" class="btn btn-primary">Details</a>
												</div>
											</div>

										</div>

									</div>

								</div>

								<div class="GridLex-col-3_mdd-6_sm-6_xs-6_xss-12">

									<div class="trip-guide-item">

										<div class="trip-guide-image">
											<img src="images/trip/03.jpg" alt="images" />
										</div>

										<div class="trip-guide-content">
											<h3>Hong Kong Best Highlight Explore</h3>
											<p>Betrayed cheerful declared end and. Questions we
												additions is extremely incommode...</p>
										</div>

										<div class="trip-guide-bottom">

											<div class="trip-guide-person clearfix">
												<div class="image">
													<img src="images/testimonial/01.jpg" class="img-circle"
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
															data-readonly value="3.5" />
													</div>
												</div>
												<div class="col-xs-6 col-sm-6 text-right">5 days 4
													nights</div>
											</div>

											<div class="row gap-10">
												<div class="col-xs-12 col-sm-6">
													<div class="trip-guide-price">
														Starting at <span class="block inline-block-xs">USD
															687.00</span>
													</div>
												</div>
												<div class="col-xs-12 col-sm-6 text-right text-left-xs">
													<a href="#" class="btn btn-primary">Details</a>
												</div>
											</div>

										</div>

									</div>

								</div>

								<div class="GridLex-col-3_mdd-6_sm-6_xs-6_xss-12">

									<div class="trip-guide-item">

										<div class="trip-guide-image">
											<img src="images/trip/04.jpg" alt="images" />
										</div>

										<div class="trip-guide-content">
											<h3>Bangkok-Pattaya Safari Adventure</h3>
											<p>Savings her pleased are several started females met.
												Short her not among being any...</p>
										</div>

										<div class="trip-guide-bottom">

											<div class="trip-guide-person clearfix">
												<div class="image">
													<img src="images/testimonial/01.jpg" class="img-circle"
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
														Starting at <span class="block inline-block-xs">USD
															687.00</span>
													</div>
												</div>
												<div class="col-xs-12 col-sm-6 text-right text-left-xs">
													<a href="#" class="btn btn-primary">Details</a>
												</div>
											</div>

										</div>

									</div>

								</div>

							</div>

						</div>

					</div>

				</div>

			</div>



			<div class="bg-white">
				<div class="pt-70 pb-60 max-width-wrapper">

				</div>

			</div>

		</div>

		<!-- end Main Wrapper -->

		<jsp:include page="include/footer.jsp" />

	</div>

	<!-- end Container Wrapper -->


	<!-- start Back To Top -->

	<div id="back-to-top">
		<a href="#"><i class="ion-ios-arrow-up"></i></a>
	</div>

	<!-- end Back To Top -->

	<!-- Core JS -->
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/core-plugins.js"></script>
	<script type="text/javascript" src="js/customs.js"></script>

	<!-- Only in Home Page -->
	<script type="text/javascript" src="js/jquery.flexdatalist.js"></script>

</body>

</html>