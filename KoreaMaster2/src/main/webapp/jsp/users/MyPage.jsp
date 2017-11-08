
<%@page import="kr.or.koreaMaster.user.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	String projectName = "/koreamaster";
    	Users user = (Users)session.getAttribute("user");
//     	Object obj = request.getAttribute("user");
//     	if(obj != null) {
//     		Users user = (Users)obj;
//     	}
    %>
<!DOCTYPE>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Title Of Site -->
	<title>한뽀 - 한반도뽀개기 여행노트</title>
	<meta name="description" content="HTML template for multiple tour agency, local agency, traveller, tour hosting based on Twitter Bootstrap 3.x.x" />
	<meta name="keywords" content="tour agency, tour guide, travel, trip, holiday, vocation, relax, adventure, virtual tour, tour planner" />
	<meta name="author" content="crenoveative">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	<!-- Fav and Touch Icons -->
	<link rel="apple-touch-icon" sizes="144x144" href=">/images/ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon" sizes="114x114" href="/images/ico/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon" sizes="72x72" href="/images/ico/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon" href="/images/ico/apple-touch-icon-57-precomposed.png">
	<link rel="shortcut icon" href="/images/ico/favicon.png">

	<!-- CSS Plugins -->
	<link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.min.css" media="screen">	
	<link href="/css/main.css" rel="stylesheet">
	<link href=">/css/plugin.css" rel="stylesheet">

	<!-- CSS Custom -->
	<link href=">/css/style.css" rel="stylesheet">
	
	<!-- Add your style -->
	<link href=">/css/your-style.css" rel="stylesheet">	
</head>

<body>

	<!-- start Container Wrapper -->
	<div class="container-wrapper">

		<!-- start Header -->
		
		<header id="header">
			<jsp:include page="/include/navigation.jsp"/>
		</header>
		
		<!-- end Header -->

		<!-- start Main Wrapper -->
		
		<div class="main-wrapper scrollspy-container">
		
			<!-- start Breadcrumb -->
			
			<div class="breadcrumb-wrapper">
				<div class="container">
					<ol class="breadcrumb">
						<li><a href="#">Home</a></li>
						<li><a href="#">Pages</a></li>
						<li><a href="#">Shortcodes</a></li>
						<li class="active">Components</li>
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
										<img src="" alt="image" />
									</div>
									
									<div class="GridLex-gap-20">
									
										<div class="GridLex-grid-noGutter-equalHeight GirdLex-grid-bottom">
							
											<div class="GridLex-col-7_sm-12_xs-12_xss-12">
											
												<div class="GridLex-inner">
													<div class="heading clearfix">
														<h3><%= user.getUsersName() %></h3>
<!-- 														<span class="label label-success"><i class="fa fa-check mr-3"></i> Verified</span>  -->
<!-- 														<span class="label label-info"><i class="fa fa-trophy mr-3"></i> Certified Guide</span> -->
													</div>
													<ul class="user-meta">
														<li><i class="fa fa-map-marker"></i> <%= user.getUsersAddress() %> <span class="mh-5 text-muted">|</span> 
<!-- 														<i class="fa fa-phone"></i> +4 8547 985</li> -->
														<li>
															<div class="user-social inline-block">
																<a href="#"><i class="icon-social-twitter" data-toggle="tooltip" data-placement="top" title="twitter"></i></a>
																<a href="#"><i class="icon-social-facebook" data-toggle="tooltip" data-placement="top" title="facebook"></i></a>
																<a href="#"><i class="icon-social-gplus" data-toggle="tooltip" data-placement="top" title="google plus"></i></a>
																<a href="#"><i class="icon-social-instagram" data-toggle="tooltip" data-placement="top" title="instrgram"></i></a>
															</div>
															<a href="#" class="btn btn-primary btn-xs btn-border">Follow</a>
														</li>
														<li>
														</li>
													</ul>
												</div>
												
											</div>
											
											<div class="GridLex-col-5_sm-12_xs-12_xss-12">
											
												<div class="GridLex-inner">
													
													<div class="row gap-20">
														<div class="col-xss-6 col-xs-6 col-sm-6 col-md-12 text-right text-left-sm">
															<div class="rating-wrapper mb-10">
																<div class="rating-item rating-item-lg">
																	<input type="hidden" class="rating" data-filled="fa fa-star rating-rated" data-empty="fa fa-star-o" data-fractions="2" data-readonly value="4.5"/>
																	<span class="block line14">based on <a href="#">32 reviews</a></span>
																</div>
															</div>
														</div>
														<div class="col-xss-6 col-xs-6 col-sm-6 col-md-12 text-right text-left-sm">
															<div class="user-header-price mt-5-sm">
																<span class="block-sm">From</span> <span class="text-primary number">USD32.00</span> / hour
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
						
						<div class="content-bottom">
						
							<div class="container">
							
								<div class="inner-bottom">
							
									<ul class="user-header-menu">
										<li><a href="guide-detail.html">Profile</a></li>
										<li><a href="guide-detail-offer.html">Tours <span>12</span></a></li>
										<li><a href="guide-detail-gallery.html">Gallery</a></li>
										<li><a href="guide-detail-reviews.html">Reviews</a></li>
										<li><a href="guide-detail-following.html">Followings <span>25</span></a></li>
										<li><a href="guide-detail-follower.html">Followers <span>8</span></a></li>
										<li class="active"><a href="guide-detail-setting.html">Dashboard</a></li>
									</ul>
								
								</div>
								
							</div>
							
						</div>
						
					</div>

				</div>
				
			</div>
			
		</div>
		
		<!-- end Main Wrapper -->
		
		</div>
	
	<!-- end Container Wrapper -->
 
<!-- Core JS -->
<script type="text/javascript" src=">/js/jquery.min.js"></script>
<script type="text/javascript" src=">/js/core-plugins.js"></script>
<script type="text/javascript" src=">/js/customs.js"></script>

<!-- Detail Page JS -->
<script type="text/javascript" src=">/js/jquery.stickit.js"></script>
<script type="text/javascript" src=">/js/bootstrap-tokenfield.js"></script>
<script type="text/javascript" src=">/js/typeahead.bundle.min.js"></script>
<script type="text/javascript" src=">/js/jquery.sumogallery.js"></script>
<script type="text/javascript" src=">/js/images-grid.js"></script>
<script type="text/javascript" src=">/js/jquery.bootstrap-touchspin.js"></script>
<script type="text/javascript" src=">/js/customs-detail.js"></script>

</body>

</html>