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
<title>한반도 뽀개기 - 식당상세보기</title>
<meta name="description"
	content="HTML template for multiple tour agency, local agency, traveller, tour hosting based on Twitter Bootstrap 3.x.x" />
<meta name="keywords"
	content="tour agency, tour guide, travel, trip, holiday, vocation, relax, adventure, virtual tour, tour planner" />
<meta name="author" content="crenoveative">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<%-- Fav and Touch Icons --%>
<link rel="apple-touch-icon" sizes="144x144"
	href="/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon"
	href="/images/ico/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="/images/ico/favicon.png">

<%-- CSS Plugins --%>
<link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.min.css" media="screen">
<link href="/css/main.css" rel="stylesheet">
<link href="/css/plugin.css" rel="stylesheet">

<%-- CSS Custom --%>
<link href="/css/style.css" rel="stylesheet">
<link href="/css/routeDetail.css" rel="stylesheet">
<%-- <link href="/css/itineraryStyle.css" rel="stylesheet"> --%>

<%-- Add your style --%>
<link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.min.css" media="screen">
<link href="/css/your-style.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<%
int restaurantNo = Integer.parseInt(request.getParameter("restaurantNo"));
%>

<script type="text/javascript">
var restaurantNo = <%=restaurantNo%>;

$(function() {
	init();
});

function init(){
	$.ajax({
		url : "/restaurantDetail.do",
		data : {"restaurantNo":restaurantNo},
		dataType: "json",
		success: function(data) {
			var spot = data;
			var keywordStr = "";
			<%-- 동적으로 생기는 사진 제거 --%>
			$("div").remove(".imgs-grid-image");
			
			<%-- 값을 해당 div에 넣기 --%>
			$("#spotName").html(spot.name);
			$("#sidocity").html(spot.sido + " > " + spot.sigungu);
			$("#cityName").html(spot.sido);
			keywordStr += "<a href='#' class='hash-tag'># "+spot.sido+"</a>";
			$("#sidoName").html(spot.sigungu);
			keywordStr += "<a href='#' class='hash-tag'># "+spot.sigungu+"</a>";
			
			var picPath = "/images/spot/"+spot.picture;
			var picture = $("<img>").attr('src',picPath);
			$("#gallery1").prepend(picture);
			
			$("#detail").html(spot.detail);
			$("#addressdetail").html("<i class='ti-direction mr-5'></i> "+spot.addressDetail);
			
			if (spot.operatingHour != "") {
				$("#operatingHour").html("<i class='ti-time mr-5'></i> "+spot.operatingHour);
			}
			if (spot.closedDate != "") {
				$("#closedDate").html("<i class='ti-na mr-5'></i> "+spot.closedDate);
			}
			if (spot.phone != "") {
				$("#phone").html("<i class='ti-mobile mr-5'></i> "+spot.phone);
			}
			if (spot.fare != "") {
				$("#fare").html("<i class='ti-money mr-5'></i> "+spot.fare);
			}
			
			$("#keywordTag").html(keywordStr);
			
			// 장소 추천 부분
			var relatedList = data.relatedSpot;
			
			if(relatedList.length > 0 ){
				var relatedSize = 4;
				if(relatedList.length < 4){
					relatedSize = relatedList.length;
				}
				
				var relatedStr = "<h2 class='font-lg'>Relatded Spots</h2> <div class='trip-guide-wrapper'>" +
								 "<div class='GridLex-gap-20 GridLex-gap-10-mdd GridLex-gap-5-xs'> "+
								 "<div class='GridLex-grid-noGutter-equalHeight ' id='relatedSpotList'>";
			
				for (var i = 0; i < relatedSize; i++) {
					relatedStr += "<div class='GridLex-col-3_mdd-4_sm-6_xs-6_xss-12'>" +
								  "<div class='trip-guide-item'> <div class='trip-guide-image'>" +
								  "<img src='/images/spot/"+relatedList[i].picture+"' alt='images' /> </div>" +
								  "<div class='trip-guide-content'> <h3>"+relatedList[i].name+"</h3> "+
								  " <p>"+relatedList[i].detail+"</p> </div>"+
								  "<div class='trip-guide-bottom'> <div class='row gap-10'> <div class='col-xs-12 col-sm-offset-6 col-sm-6 text-right'>"+
								  "<a href='/jsp/place/spotdetail.jsp?restaurantNo="+spot.no+"' class='btn btn-primary'>Details</a> </div> </div> </div> </div> </div>";
				}
				relatedStr += "</div> </div> </div>";
				$("#relatedSpotList").html(relatedStr);
			}
			
		}
	});
}

</script>

</head>

<body class="transparent-header with-multiple-sticky">

	<%-- start Container Wrapper --%>
	<div class="container-wrapper">

		<%-- start Header --%>
		<header id="header">

			<%-- start Navbar (Header) --%>
			<jsp:include page="/include/navigation.jsp"/>
			<%-- end Navbar (Header) --%>

		</header>
		<%-- end Header --%>

		<%-- start Main Wrapper --%>

		<div class="main-wrapper scrollspy-container">

			<%-- start breadcrumb --%>

			<div class="breadcrumb-image-bg detail-breadcrumb"
				style="background-image: url('/images/bannerimage1.jpg');">
				<div class="container">

					<div class="page-title detail-header-02">

						<div class="row">

							<div
								class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">

								<h2 id="spotName"></h2>
								<span class="labeling text-white mt-25"><span id="sidocity"></span></span>
								<%--별점 --%>
							<%-- 	<div class="rating-item rating-item-lg mb-25">
									<input type="hidden" class="rating"
										data-filled="fa fa-star rating-rated"
										data-empty="fa fa-star-o" data-fractions="2" data-readonly
										value="4.5" />
									<div class="rating-text">
										<a href="#">(32 reviews)</a>
									</div>
								</div> --%>
								<ul class="list-with-icon list-inline-block">
									<li><i class="ion-android-done text-primary"></i>100% private</li>
									<li><i class="ion-android-done text-primary"></i>Instantly confirmed</li>
									<li><i class="ion-android-done text-primary"></i>Free cancellation</li>
									<li><i class="ion-android-done text-primary"></i>Satisfaction guarantee</li>
								</ul>

							</div>

						</div>

					</div>

					<%-- 현재 페이지 장소 표시 START --%>
					<div class="breadcrumb-wrapper text-left">

						<ol class="breadcrumb">
							<li><a href="#">Home</a></li>
							<li><a href="#">SPOT</a></li>
							<li><a href="#">Korea</a></li>
							<li><a href="#" id="cityName"></a></li>
							<li class="active" id="sidoName"></li>
						</ol>

					</div>
					<%-- 현재 페이지 장소 표시 END --%>

				</div>

			</div>
			<%-- end breadcrumb --%>

			<%-- 루트 소메뉴 START --%>
			<div class="multiple-sticky hidden-sm hidden-xs">
				<div class="multiple-sticky-inner">
					<div class="multiple-sticky-container container">
						<div class="multiple-sticky-item clearfix">
							<ul id="multiple-sticky-menu"
								class="multiple-sticky-menu clearfix">
								<!-- <li><a href="#detail-content-sticky-nav-01">Overview</a></li> -->
								<li><a href="#detail-content-sticky-nav-02">Gallery</a></li>
								<li><a href="#detail-content-sticky-nav-03">Detail</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<%-- 루트 소메뉴  END --%>


			<%-- 주 컨테이너 --%>
			<div class="pt-50 pb-50">
				<div id="detail-content-sticky-nav-01">
					<div class="container">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-8">
								<div class="content-wrapper">
								
								<%-- 여행지 사진 갤러리 START --%>
									<div id="detail-content-sticky-nav-02">
										<h2 class="font-lg">Gallery</h2>

										<div class="gallery-grid-3-2-wrapper mb-30">
											<div id="gallery1">
											
											</div>
										</div>

										<div class="mb-25"></div>
										<div class="bb"></div>
										<div class="mb-25"></div>

									</div>
									<%-- 여행지 사진 갤러리  END --%>
									
									
									<h3 class="section-title">Spot Detail</h3>
									<div id="detail-content-sticky-nav-03">
										<%-- 여행 설명 : 문장으로  START--%>
										<p class="lead" id="detail"></p>
										<%-- 여행 설명 : 문장으로 END --%>

										<div class="mb-25"></div>
										<div class="bb"></div>
										<div class="mb-25"></div>

										<%-- 여행 상세 정보  --%>
										<div class="row">
											<div class="col-xs-12 col-sm-12 col-md-12">
												<div class="featured-list-in-box">
													<h4 class="uppercase spacing-1">Spot Detail</h4>

													<ul class="clearfix">
														<li class="row gap-20">
															<div class="col-xs-12 col-sm-4">상세주소</div>
															<div class="col-xs-12 col-sm-8 text-primary text-right text-left-xs mt-xs space" id="addressdetail">
																
															</div>
														</li>
														<li class="row gap-20">
															<div class="col-xs-12 col-sm-4">운영시간</div>
															<div class="col-xs-12 col-sm-8 text-primary text-right text-left-xs mt-xs space" id="operatingHour">
															</div>
														</li>
														<li class="row gap-20">
															<div class="col-xs-12 col-sm-4">휴관일</div>
															<div class="col-xs-12 col-sm-8 text-primary text-right text-left-xs mt-xs space" id="closedDate">
															</div>
														</li>
														<li class="row gap-20">
															<div class="col-xs-12 col-sm-4">연락처</div>
															<div class="col-xs-12 col-sm-8 text-primary text-right text-left-xs mt-xs space" id="phone">
															</div>
														</li>
														<li class="row gap-20">
															<div class="col-xs-12 col-sm-4">요금</div>
															<div class="col-xs-12 col-sm-8 text-primary text-right text-left-xs mt-xs space" id="fare">
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

							<%-- 오른쪽 사이드 메뉴 START--%>
							<div id="sidebar-sticky" class="col-xs-12 col-sm-12 col-md-4">
								<aside class="sidebar-wrapper">

									<a href="#" class="add-fav-btn mt-25 ml-10 ml-0-sm">
										<div class="inner">
											<i class="ti-heart"></i> Add Favourite
										</div>
									</a>

									<div class="hash-tag-wrapper clearfix mt-10 ml-10 ml-0-sm" id='keywordTag'>
									</div>

								</aside>

							</div>
							<%-- 오른쪽 사이드 메뉴 END --%>
						</div>
					</div>
				</div>
				<%-- detail-content-sticky-nav-01  div END --%>

				<div class="multiple-sticky no-border hidden-sm hidden-xs">&#032;</div>
				<%-- is used to stop the above stick menu --%>

				<%-- 또다른 추천 루트  START --%>
				<div class="bg-light pt-50 pb-70">
					<div class="container" id="relatedSpotList">
						
					</div>
				</div>
				<%-- 또다른 추천 루트 END --%>
			</div>
		</div>
		<%-- end Main Wrapper --%>

		<%-- footer --%>
		<jsp:include page="/include/footer.jsp"/>

	</div>
	<%-- end Container Wrapper --%>


	<%-- start Back To Top --%>
	<div id="back-to-top">
		<a href="#"><i class="ion-ios-arrow-up"></i></a>
	</div>

	<%-- end Back To Top --%>


	<%-- Core JS --%>
	<script type="text/javascript" src="/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="/js/core-plugins.js"></script>
	<script type="text/javascript" src="/js/customs.js"></script>

	<%-- Detail Page JS --%>
	<script type="text/javascript" src="/js/jquery.stickit.js"></script>
	<script type="text/javascript" src="/js/bootstrap-tokenfield.js"></script>
	<script type="text/javascript" src="/js/typeahead.bundle.min.js"></script>
	<!-- <script type="text/javascript" src="/js/jquery.sumogallery.js"></script> -->
	<script type="text/javascript" src="/js/images-grid.js"></script>
	<script type="text/javascript" src="/js/jquery.bootstrap-touchspin.js"></script>
	<script type="text/javascript" src="/js/customs-detail.js"></script>


	<script type="text/javascript" src="/js/moment.min.js"></script>
	<script type="text/javascript" src="/js/jquery.daterangepicker.js"></script>
	<script type="text/javascript" src="/js/customs-datepicker.js"></script>

	<%-- Custom JS --%>
	<script type="text/javascript" src="/js/routeDetail.js"></script>

</body>

</html>