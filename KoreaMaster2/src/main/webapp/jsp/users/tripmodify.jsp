<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Title Of Site -->
	<titl>한반도 뽀개기 - 여행수정</title>
	<meta name="description" content="HTML template for multiple tour agency, local agency, traveller, tour hosting based on Twitter Bootstrap 3.x.x" />
	<meta name="keywords" content="tour agency, tour guide, travel, trip, holiday, vocation, relax, adventure, virtual tour, tour planner" />
	<meta name="author" content="crenoveative">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
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
<link rel="stylesheet" type="text/css"
	href="/bootstrap//css/bootstrap.min.css" media="screen">
<link href="/css/main.css" rel="stylesheet">
<link href="/css/plugin.css" rel="stylesheet">

<%-- CSS Custom --%>
<link href="/css/style.css" rel="stylesheet">
<link href="/css/routeDetail.css" rel="stylesheet">
<link href="/css/itineraryStyle.css" rel="stylesheet">

<%-- Add your style --%>
<link href="/css/your-style.css" rel="stylesheet">
<link href="/css/ksj-style.css" rel="stylesheet">

<!-- Core JS -->
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/core-plugins.js"></script>
<script type="text/javascript" src="/js/customs.js"></script>

<script type="text/javascript" >
var modalCl;
var count = ${list.size()};

$(document).ready(function(){
	
	$(document).on("click", ".pull-right", function (event) {
		event.preventDefault();
		var itemNum = $(this).attr("name");
		/*console.log($(this).parents());*/
		$(this).parents().get(3).remove(); 
	});
	
 	$(document).on("click", "#spotModal .spotAdd", function(event){
		var no = $(this).attr('name');
	
		var ob = ($(this).children().get(1)).childNodes;
		var homePage = ob.item(9).textContent.substring(7);
		
		// .td-timeline-panel의 name=modalCl의 뒤에 append
		var spotStr = "";
		spotStr += "<div class='GridLex-col-12_mdd-12_sm-12_xs-12_xss-12'  id='"+count+"'>"+
				   "<div class='td-timeline-wrap' name='"+count+"'>"+
				   "<ul class='td-timeline'>"+
				   "<li> <div class='td-timeline-panel' name='"+count+"'>"+
				   "<div class='td-timeline-panel-time'>"+
				   "<span class='text-darker'>07:00</span> "+
				   "<span class='text-xs-right'>AM</span>"+
				   "</div> <div class='td-timeline-panel-bubble'>"+
				   "<a href='' class='btn pull-right btn-default btn-md	 delbtn ksj-icon-remove' name='"+count+"'><i class='fa fa-fw fa-remove'></i></a>"+
				   "<i class='fa fa-plane text-darker'></i>"+
				   "<h4 class='timeline-title'>"+ob.item(1).textContent+"</h4>"+
				   "<p>상세설명</p><hr>"+
				   "<p>"+ob.item(4).textContent+"</p>"+
				   "<p>"+ob.item(5).textContent+"</p>"+
				   "<p>"+ob.item(6).textContent+"</p>"+
				   "<p>"+ob.item(7).textContent+"</p>"+
				   "<p>"+ob.item(8).textContent+"</p>"+
				   "<p>홈페이지 : <a href='"+homePage+"'>"+homePage+"</a></p>"+
				   "</div> <button class='btn pull-left btn-default btn-md delbtn ksj-icon-plus' name='"+count+"'><i class='fa fa-fw fa-plus'></i></button>"+
				   "</div> </li> </ul></div> </div>";
		
		count += 1;
		
		$("#spotModal").modal('hide');
		
		var tmp = "#"+modalCl;
		$(spotStr).insertAfter(tmp);
	}); 
	
	$(document).on("click", ".ksj-icon-plus", function(){
		modalCl = $(this).attr('name');
		$("#spotModal").modal();
	});
	
	$('#spotModal').on('show.bs.modal', function (event) {
		/*  console.log(modalCl); */
		 var spotSize = $(".td-timeline-panel").size();
			
		if(spotSize >= 5){
			$(".modal-body").html("1일 최대 장소를 초과하셨습니다.(최대 5개)");
		}else{
			/*  alert("장소 추가 가능 : " + spotSize); */
			var cityNo = $("#cityNo").val();
			var tripNo = $("#tripNo").val();
			
			$.ajax({
				url : "/spotList.do",
				data : {"cityNo" : cityNo, "tripNo" : tripNo},
				dataType: "json",
				success : function(data){
					var list = data.array;
					/* var str = "<div class='GridLex-grid-noGutter-equalHeight col-sm-12'>"; */
					 var str = "";
					$.each(list, function(i, spot) {
						/* str += "<div class='spotAdd' id='"+spot.no+"'}><img src='/images/spot/"+spot.picture+"' style='width:400px; height:250px;'></div>"+
								"<div class='trip-guide-content'><h5 styl='vertical-align:center;'>"+spot.name+"</h5></div><br>";  */
						str+="<div class='td-timeline-panel spotAdd' name='"+spot.no+"'>"+
							 "<div class='td-timeline-panel-time'  name='"+spot.no+"'>"+
							 "<span class='text-xs-right'><img src='/images/spot/"+spot.picture+"' style='width:130px;'></span>"+
							 "</div>"+
							 "<div class='td-timeline-panel-bubble'>"+
							 "<i class='fa fa-plane text-darker'></i>"+
							 "<h4 class='timeline-title' name='"+spot.no+"'>" +spot.name+"</h4>"+
							 "<p>상세설명</p><hr>"+
							 "<p>주소 : "+spot.addressDetail+"</p>"+
							 "<p>운영시간 : "+spot.operatingHour+"</p>"+
							 "<p>휴관일 : "+spot.closedDate+"</p>"+
							 "<p>연락처 : "+spot.phone+"</p>"+
							 "<p>요금 : "+spot.fare+"</p>"+
							 "<p>홈페이지 : "+spot.homepage+"</a></p>"+
							 "</div> </div>";
							
					});
					/* str += "</div>"; */
					$(".modal-body").append(str);
				}
			});
		}
		 
	 });
	
});
</script>
	
</head>

<body>
	<!-- start Container Wrapper -->
	<div class="container-wrapper">

		<!-- start Header -->
		
		<header id="header">

			<!-- start Navbar (Header) -->
			<jsp:include page="/include/navigation.jsp" />
			<!-- end Navbar (Header) -->

		</header>
		
		<!-- end Header -->

		<!-- start Main Wrapper -->
		
		<div class="main-wrapper scrollspy-container">
		
			<!-- start Breadcrumb -->
			
			<div class="breadcrumb-wrapper">
				<div class="container">
					<ol class="breadcrumb">
						<li><a href="#">Home</a></li>
						<li><a href="#">mypage</a></li>
						<li class="active"><a href="#">Change of travel</a></li>
					</ol>
				</div>
			</div>
			
			<!-- end Breadcrumb -->
			
			<!-- 위쪽 프로필 전체 START -->
			<div class="user-profile-wrapper">
				<div class="user-header">
					<div class="content">
					
					<!-- 간단한 프로필 START -->
						<div class="content-top">
							<div class="container">
								<div class="inner-top">
								
									<!--프로필 사진 START -->
									<div class="image">
										<img src="/images/man/01.jpg" alt="image" />
									</div>
									<!--프로필 사진 END -->
									
									<div class="GridLex-gap-20">
										<!-- GridLex-grid-noGutter-equalHeight GirdLex-grid-bottom START -->
										<div class="GridLex-grid-noGutter-equalHeight GirdLex-grid-bottom">
											<!-- 회원 정보  START -->
											<div class="GridLex-col-7_sm-12_xs-12_xss-12">
												<div class="GridLex-inner">
												<!-- 프로필 회원 이름 -->
													<div class="heading clearfix">
														<h3>Robert Kalvin</h3>
														<span class="label label-success"><i class="fa fa-check mr-3"></i> Verified</span> 
														<span class="label label-info"><i class="fa fa-trophy mr-3"></i> Certified Guide</span>
													</div>
													
													<!-- 회원 주소, 전화번호 등 정보  -->
													<ul class="user-meta">
														<li><i class="fa fa-map-marker"></i> 264, Carson Street Lexington, KY 40539 <span class="mh-5 text-muted">|</span> <i class="fa fa-phone"></i> +4 8547 985</li>
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
											<!-- 회원 정보  END -->
											
											<!-- 회원 프로필 오른쪽 부분 START -->
											<div class="GridLex-col-5_sm-12_xs-12_xss-12">
												<div class="GridLex-inner">
													<div class="row gap-20">
													
														<!-- 별점 및 리뷰 수 START -->
														<div class="col-xss-6 col-xs-6 col-sm-6 col-md-12 text-right text-left-sm">
															<div class="rating-wrapper mb-10">
																<div class="rating-item rating-item-lg">
																	<input type="hidden" class="rating" data-filled="fa fa-star rating-rated" data-empty="fa fa-star-o" data-fractions="2" data-readonly value="4.5"/>
																	<span class="block line14">based on <a href="#">32 reviews</a></span>
																</div>
															</div>
														</div>
														<!-- 별점 및 리뷰 수 END -->
														
														<!-- START -->
														<div class="col-xss-6 col-xs-6 col-sm-6 col-md-12 text-right text-left-sm">
															<div class="user-header-price mt-5-sm">
																<span class="block-sm">From</span> <span class="text-primary number">USD32.00</span> / hour
															</div>
														</div>
														<!-- END -->
													</div>
												</div>
											</div>
											<!-- 회원 프로필 오른쪽 부분 END -->
											
										</div>
										<!--  GridLex-grid-noGutter-equalHeight GirdLex-grid-bottom END -->
									</div>
								</div>
							</div>
						</div>
						<!-- 간단한 프로필 END -->
						
						<!-- 프로필 아래 목록 START -->
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
						<!-- 프로필 아래 목록 END -->
						
					</div>
				</div>
			</div>]
			<!-- 위쪽 프로필 전체 END -->

			<div class="pt-30 pb-50">
			
				<div class="container">

					<div class="row">
						
						<!-- 왼쪽 메뉴 바 START -->
						<div class="col-xs-12 col-sm-4 col-md-3 mt-20">
							<aside class="sidebar-wrapper pr-5 pr-0-xs">
								<div class="common-menu-wrapper">
									<ul class="common-menu-list">
										<li><a href="guide-detail-setting.html">Dashboard</a></li>
										<li><a href="guide-detail-setting-edit-profile.html">Edit profile</a></li>
										<li><a href="guide-detail-setting-guide-information.html">Guide Information</a></li>
										<li class="active"><a href="guide-detail-setting-my-tour.html">My tour</a></li>
										<li><a href="guide-detail-setting-my-wihslist.html">My wihslist</a></li>
										<li><a href="#">Logout</a></li>
									</ul>
								</div>
							</aside>
						</div>
						<!-- 왼쪽 메뉴 바 END -->
						
						<!-- content START -->
						<div class="col-xs-12 col-sm-8 col-md-9 mt-20">
							<div class="dashboard-wrapper">
							
								<h4 class="section-title">Chang of Trip</h4>
								<p class="mmt-15 mb-20"> This page shows you a "My Trip Note". </p>

								<div class="trip-list-wrapper no-bb-last">
									<!-- List Start -->
									<div class="trip-list-item">
									
										<div class="image-absolute">
											<div class="image image-object-fit image-object-fit-cover">
												<img src="/images/baggage.png" alt="image" >
											</div>
										</div>
										
										<!-- 여행 일정 리스트 및 내용 -->
										<div class="content">
											<div class="GridLex-gap-20 mb-5">
												<div class="GridLex-grid-noGutter-equalHeight GridLex-grid-middle">
												
													<div class="GridLex-col-7_sm-12_xs-12_xss-12">
														<div class="GridLex-inner">
															<h6>${trip.name}</h6>
															<span class="font-italic font14">${days-1}박 ${days}일</span>
														</div>
													</div>
													
													<div class="GridLex-col-12_sm-12_xs-12_xss-12">
														<input type="hidden" class="tripNo" id="tripNo" value="${tripNo}"/><!--트립 노트 번호 -->
														<%-- 여행일정 START --%>
														<div id="detail-content-sticky-nav-03">
	
															<h2 class="font-lg">Itinerary</h2>
																   <c:forEach var="item" items="${list}" varStatus="status" > 
																	<%-- day --%>
																	<c:if test="${status.index eq 0 }">
																		<input type="hidden" id="cityNo" value="${item.cityNo}">
																	</c:if>
																	
																	<div class="GridLex-col-12_mdd-12_sm-12_xs-12_xss-12" id="${status.index}">
																		<%--  상세일정 보여주는 div START --%>
																			<%-- 일정 보여주는 ui START --%>
																					
																			<div class="td-timeline-wrap" name="${status.index}">
																				<ul class="td-timeline">
																					<li>
																					<c:if test="${(status.index)%5 eq 0}">
																						<div name="day${status.count}">
																						<div class="td-timeline-badge">Day ${status.count} </div>
																					</c:if>
																						<%-- 세부일정 시작 --%>
																						<div class="td-timeline-panel" name="${status.index}">
																								<div class="td-timeline-panel-time">
																									<span class="text-darker">07:00</span> 
																									<span class="text-xs-right">AM</span>
																								</div>
																								<div class="td-timeline-panel-bubble">
																								<c:if test="${(status.index)%5 ne 0}">
																									<a href="" class="btn pull-right btn-default btn-md	 delbtn ksj-icon-remove" name="${status.index}"><i class="fa fa-fw fa-remove"></i></a><!-- 장소 삭제 -->
																								</c:if>
																									<i class="fa fa-plane text-darker"></i>
																									<h4 class="timeline-title">${item.spotName}</h4>
																									<c:if test="${(status.index)%4 ne 0}">
																										<p>상세설명</p><hr>
																									</c:if>
																									<p>주소 : ${item.addressDetail}</p>
																									<p>운영시간 : ${item.operatingHour}</p>
																									<p>휴관일 : ${item.closedDate}</p>
																									<p>연락처 : ${item.phone}</p>
																									<p>요금 : ${item.fare}</p>
																									<p>홈페이지 : <a href="${item.homepage}">${item.homepage}</a></p>
																								</div>
																						<c:if test="${(status.index+1)%5 != 0}">
																						<!-- 장소 추가 -->
																							<button class="btn pull-left btn-default btn-md delbtn ksj-icon-plus" name="${status.index}" ><i class="fa fa-fw fa-plus"></i></button>
																						</c:if>	
																						</div>
																						<%-- 세부일정 끝 --%>
																						<c:if test="${(status.index)%5 eq 0}">
																							</div>
																						</c:if>
																					</li>
																				</ul>
																			</div>
																			<%-- 일정 보여주는 ui END --%>
																	</div>
																	<%-- day END --%>
																	</c:forEach> 
																	<%-- end of panel --%>
																	
															<div class="mb-25"></div>
															<div class="bb"></div>
															<div class="mb-25"></div>
														</div><%-- 여행일정 END --%>
													</div>
													
												</div>
												
											</div>
											
										</div>
										
										<!-- Modal START -->
										<div class="modal fade" tabindex="-1"  role="dialog">
										    <div class="modal-dialog  modal-lg" id="spotModal" role="document">
										      <div class="modal-content">
										        <div class="modal-header">
										          <button type="button" class="close" data-dismiss="modal">&times;</button>
										          <h4 class="modal-title">여행 일정 추가</h4>
										        </div>
										        <div class="modal-body">
										        <p>추가할 일정을 클릭해주세요 </p>
										        
										        </div>
										        <div class="modal-footer">
										          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
										          <button type="button" class="btn btn-default">Submit</button>
										        </div>
										      </div>
										    </div>
										</div>
										<!-- Modal END -->
									</div>
									<!-- List End -->
								</div>
								
							</div>
						</div>
						<!-- content START -->
						
						
					</div>
				</div>
			</div>
		</div>
		
		<!-- end Main Wrapper -->
		
		<!-- start Footer Wrapper -->
		<jsp:include page="/include/footer.jsp" />
		<!-- end Footer Wrapper -->

	</div>
	
	<!-- end Container Wrapper -->
 
 
<!-- start Back To Top -->

<div id="back-to-top">
   <a href="#"><i class="ion-ios-arrow-up"></i></a>
</div>

<!-- end Back To Top -->


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

</body>

</html>