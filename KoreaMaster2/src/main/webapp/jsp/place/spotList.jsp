<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

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
<link href="/css/routeDetail.css" rel="stylesheet">
<link href="/css/itineraryStyle.css" rel="stylesheet">

<!-- Add your style -->
<link href="/css/your-style.css" rel="stylesheet">

<!-- Core JS -->
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/core-plugins.js"></script>
<script type="text/javascript" src="/js/customs.js"></script>

<!-- Result Page JS -->
<script type="text/javascript" src="/js/bootstrap-tokenfield.js"></script>
<script type="text/javascript" src="/js/typeahead.bundle.min.js"></script>
<script type="text/javascript" src="/js/ion.rangeSlider.min.js"></script>
<script type="text/javascript" src="/js/jquery.bootstrap-touchspin.js"></script>
<script type="text/javascript" src="/js/customs-result.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
var page = 1;
var theme = "all";
var sort = "useNum";

$(function(){	
	init();
	
	$("#theme").change(function() {
		theme = $("#theme option:selected").val();
		var data = {"page" : page, "themeName" : theme, "sort" : sort};
		listPage(data);
	});
	
	$("#sort").change(function() {
		sort = $("#sort option:selected").attr("id");
		var data = {"page" : page, "themeName" : theme, "sort" : sort};
		listPage(data);
	});
	
	/* // 이벤트 찾아 넣기
	$("#autocompleteTagging").change(function() {
		console.log($("#autocompleteTagging").val());
	});  */
	
});

function init(){
	var data = {"page" : page, "themeName" : theme, "sort" : sort};
	listPage(data);
}

function listPage(data){
	$("#gridSpot div[class='GridLex-col-3_mdd-4_sm-6_xs-6_xss-12']").remove();
	var str = "";
	// 전체 리스트 불러오기
	$.ajax({
		url : "/listPage.do",
		data : data,
		dataType: "json",
		success : function(data){
			$.each(data, function(index, spot) {
				var detail = spot.detail;
				str += "<div class='GridLex-col-3_mdd-4_sm-6_xs-6_xss-12' id='"+spot.cityNo+"'>" + 
						"<div class='trip-guide-item'>"+
							"<div class='trip-guide-image'>"+
								"<img src='/images/spot/"+spot.picture+"' alt='images' />"+
							"</div>"+
							"<div class='trip-guide-content' style='margin-bottom: 50px;'>"+
								"<h3>"+spot.name+"</h3>"+
								"<p>"+spot.detail+"</p>"+
							"</div>"+
							"<div class='trip-guide-bottom' >"+
								"<div class='trip-guide-meta row gap-10'>"+
									"<div class='col-xs-6 col-sm-6'>"+
										"<div class='rating-item'>"+
											"<input type='hidden' class='rating' data-filled='fa fa-star rating-rated' "+
											"data-empty='fa fa-star-o' data-fractions='2' data-readonly value='"+spot.useNum+"' />"+
										"</div>"+
									"</div>"+
								"</div>"+
								"<div class='row gap-10'>"+
									"<div class='col-sm-offset-6 col-xs-12 col-sm-6 text-right'>"+
										"<a href='/jsp/place/spotdetail.jsp?spotNo="+spot.no+"' class='btn btn-primary' value='"+spot.no+"'>Details</a>"+
									"</div>"+
								"</div>"+
							"</div>"+
						"</div>"+
					"</div>";
			});
			
			$("#gridSpot").append(str);
		}
	});
}

</script>

</head>

<body class="transparent-header">

	<!-- start Container Wrapper -->

	<div class="container-wrapper">

		<!-- start Header -->
		<header id="header"> 
			<!-- start Navbar (Header) --> 
			<jsp:includepage="/include/navigation.jsp" /> 
			<!-- end Navbar (Header) --> 
		</header>
		<!-- end Header -->

		<!-- start Main Wrapper -->

		<div class="main-wrapper scrollspy-container">

			<!-- start breadcrumb -->

			<div class="breadcrumb-image-bg" style="background-image: url('/images/breadcrumb-bg.jpg');">
				<div class="container">

					<div class="page-title">
						<div class="row">
							<div class="col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3">
								<h2>SPOT</h2>
								<p>서울특별시 금천구 </p>
							</div>
						</div>
					</div>

					<div class="breadcrumb-wrapper">
						<ol class="breadcrumb">
							<li><a href="index.jsp">Home</a></li>
							<li><a href="#">Spot</a></li>
							<li class="active">서울특별시</li>
						</ol>
					</div>
				</div>

			</div>

			<!-- end breadcrumb -->

			<div class="filter-full-width-wrapper">
				<!-- 검색 유형  form  start  -->
				<form class="">

					<div class="filter-full-primary">

						<div class="container">

							<div class="filter-full-primary-inner">
								<div class="form-holder">
									<div class="row">
									
										<!-- 키워드 start div -->
										<div class="col-xs-12 col-sm-12 col-md-6">
											<div class="filter-item bb-sm no-bb-xss">
												<div class="input-group input-group-addon-icon no-border no-br-sm">
													<span class="input-group-addon input-group-addon-icon bg-white">
													<label><i class="fa fa-map-marker"></i> Area : </label></span> 
													<input type="text" class="form-control" id="autocompleteTagging" value="대한민국" />
												</div>
											</div>
										</div>
										<!-- 키워드 end div -->

										<div class="col-xs-12 col-sm-12 col-md-6">
											<div class="filter-item-wrapper">
												<div class="row">
												
													<!-- 정렬 start div -->
													<div class="col-xss-12 col-xs-6 col-sm-5">
														<div class="filter-item mmr">
															<div
																class="input-group input-group-addon-icon no-border no-br-xs">
																<span
																	class="input-group-addon input-group-addon-icon bg-white">
																	<label class="block-xs"><i class="fa fa-sort-amount-asc"></i> Sort by:</label>
																	</span> <select class="selectpicker form-control block-xs" id="sort">
																	<option id="useNum"> hitting </option>
																	<option id="name"> Name</option>
																</select>
															</div>
														</div>
													</div>
													<!-- 정렬 end div -->
													
													<!-- 여행 테마별 검색 start div -->
													<div class="col-xss-12 col-xs-6 col-sm-7" >
														<div class="filter-item mmr">
															<div class="input-group input-group-addon-icon no-border no-br-xs">
																<span class="input-group-addon input-group-addon-icon bg-white"><label><i class="fa fa-sort-amount-asc"></i> Trip Style:</label></span>
																<select class="selectpicker " id="theme">
																	<option value="all"> All Types</option>
																	<option value="자연"> Nature</option>
																	<option value="체험"> Experience</option>
																	<option value="문화시설"> Culture</option>
																	<option value="레포츠"> Leports</option>
																	<option value="역사"> History</option>
																	<option value="쇼핑"> Shopping</option>
																</select>
															</div>
														</div>
													</div>
													<!-- 여행 테마별 검색 end div -->
													
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
				<!-- 검색 유형  end form  -->

			</div>

			<div class="pt-30 pb-50">
				<div class="container">
					<div class="trip-guide-wrapper">
						<div class="GridLex-gap-20 GridLex-gap-15-mdd GridLex-gap-10-xs">
							<div class="GridLex-grid-noGutter-equalHeight GridLex-grid-center" id="gridSpot">
								
								<!-- 장소 리스트 추가 -->
								
						</div>
					</div>

					<div class="pager-wrappper clearfix">

						<div class="pager-innner">

							<div class="clearfix">Showing reslut 1 to 15 from 248</div>

							<div class="clearfix">
								<nav class="pager-center">
								<ul class="pagination">
									<li><a href="#" aria-label="Previous"> <span
											aria-hidden="true">&laquo;</span>
									</a></li>
									<li class="active"><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><span>...</span></li>
									<li><a href="#">11</a></li>
									<li><a href="#">12</a></li>
									<li><a href="#">13</a></li>
									<li><a href="#" aria-label="Next"> <span
											aria-hidden="true">&raquo;</span>
									</a></li>
								</ul>
								</nav>
							</div>

						</div>

					</div>

				</div>

			</div>

		</div>
		<!-- end Main Wrapper -->

		<!-- footer -->
		<jsp:include page="/include/footer.jsp" />

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



</body>

</html>