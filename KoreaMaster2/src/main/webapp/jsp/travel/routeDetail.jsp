<%@page import="kr.or.koreaMaster.place.domain.Spot"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%-- Title Of Site --%>
<title>한반도 뽀개기 - 루트 상세보기</title>
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

<%-- Core JS --%>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/core-plugins.js"></script>
<script type="text/javascript" src="/js/customs.js"></script>

<script>
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
            style="background-image: url('/images/detail-header.jpg');">
            <div class="container">

               <div class="page-title detail-header-02">

                  <div class="row">

                     <div
                        class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">

                        <h2>${route.cityName} 여행 </h2>
                        <span class="labeling text-white mt-25"><span>${route.days} days ${route.days-1} nights</span></span>
                     </div>

                  </div>

               </div>

            </div>

         </div>
         <%-- end breadcrumb --%>

         <%-- 주 컨테이너 --%>
         <div class="pt-50 pb-50">
            <div id="detail-content-sticky-nav-01">
               <div class="container">
                  <div class="row">
                     <div class="col-xs-12 col-sm-12 col-md-8">
                        <div class="content-wrapper">
                           <h3 class="section-title">${route.cityName} 여행</h3>
                           <div id="detail-content-sticky-nav-01">
                              <%-- 여행에 일수, 도시 등 설명   START --%>
                              <div class="featured-icon-simple-wrapper">
                                 <div class="GridLex-gap-30">
                                    <div class="GridLex-grid-noGutter-equalHeight">
                                       <div class="GridLex-col-4_sm-4_xs-12_xss-12">
                                          <div class="featured-icon-simple-item">
                                             <div class="icon text-primary">
                                                <i class="flaticon-travel-icons-suitcase-1"></i>
                                             </div>
                                             ${route.days} days &amp; ${route.days-1} nights<br />tour
                                          </div>
                                       </div>

                                       <div class="GridLex-col-4_sm-4_xs-12_xss-12">
                                          <div class="featured-icon-simple-item">
                                             <div class="icon text-primary">
                                                <i class="flaticon-travel-icons-map"></i>
                                             </div>
                                             Visit city:<br />${route.cityName}
                                          </div>
                                       </div>

                                       <div class="GridLex-col-4_sm-4_xs-12_xss-12">
                                          <div class="featured-icon-simple-item">
                                             <div class="icon text-primary">
                                                <i class="flaticon-travel-icons-bus"></i>
                                             </div>
                                             Travel with transportation 
                                          </div>
                                       </div>

                                    </div>
                                 </div>
                              </div>
                              <%-- 여행에 일수, 도시 등 설명   END --%>
                              
                              <div class="mb-25"></div>
                              <div class="bb"></div>
                              <div class="mb-25"></div>
                              
                           </div>

                           <%-- 여행 일정  --%>
                           <form action="/trip.do" method="post" class="form">
                              <input type="hidden" name="startDate" value="${route.startDate}"/>
                              <input type="hidden" name="endDate" value="${route.endDate}"/>
                              <input type="hidden" name="tripName" value="${route.cityName}여행기"/>
                              <input type="hidden" name="routeSpots" value="${route.routeNo}"/>
                              
                           
                              <div id="detail-content-sticky-nav-03">
   
                                 <h2 class="font-lg">Itinerary</h2>
   
                                       
                                       <c:forEach var="item" items="${route.routeSpots}" varStatus="status" > 
                                       <%-- day --%>
                                       
                                       <div class="GridLex-col-3_mdd-4_sm-6_xs-6_xss-12">
                                                <%--  상세일정 보여주는 dic START --%>
                                                   <%-- 일정 보여주는 ui START --%>
                                                   
                                                      <div class="td-timeline-wrap">
                                                         <ul class="td-timeline">
                                                            <li>
                                                            <c:if test="${(status.index)%5 eq 0}">
                                                               <div class="td-timeline-badge">Day ${status.count} </div>
                                                            </c:if>
                                                                     <%-- 세부일정 시작 --%>
                                                                     <div class="td-timeline-panel">
                                                                     <div class="td-timeline-panel-time">
                                                                        <span class="text-darker">07:00</span> <span
                                                                           class="text-xs-right">AM</span>
                                                                     </div>
                                                                     <div class="td-timeline-panel-bubble">
                                                                        <i class="fa fa-plane text-darker"></i>
                                                                        <h4 class="timeline-title">${item.name}</h4>
                                                                        <c:if test="${(status.index)%5 ne 0}">
                                                                        <p>${item.detail}</p><hr>
                                                                        </c:if>
                                                                        <p>주소 : ${item.addressDetail}</p>
                                                                        <p>운영시간 : ${item.operatingHour}</p>
                                                                        <p>휴관일 : ${item.closedDate}</p>
                                                                        <p>연락처 : ${item.phone}</p>
                                                                        <p>요금 : ${item.fare}</p>
                                                                        <p>홈페이지 : <a href="${item.homepage}">${item.homepage}</a></p>
                                                                     </div>
                                                                  </div>
                                                               <%-- 세부일정 끝 --%>
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
   
                        <%-- 오른쪽 사이드 메뉴 START --%>
								<div id="sidebar-sticky" class="col-xs-12 col-sm-12 col-md-4">
									<aside class="sidebar-wrapper">
										<div class="row gap-20">
											<div class="col-sm-12 col-md-12">
												<div class="form-group"> 
													<label>TITLE</label>
													<input class="form-control noteInfo" placeholder="TITLE" type="text" name="noteName" required> 
												</div>
											
											</div>
											
											<div class="col-sm-12 col-md-12">
											
												<div class="form-group"> 
													<label>MEMO</label>
													<textarea rows="3" class="form-control noteInfo" name="detail" required> </textarea>
												</div>
											
											</div>
										</div>
	
										<%-- 내 루트 저장 버튼 --%>
										<a href="#" class="add-fav-btn mt-25 ml-10 ml-0-sm">
											<div class="inner text-primary">
												<button type="submit" class="btn btn-default text-primary submit" style="background: #FFFFFF; color:#000000; border-color: #FFFFFF;"> Add Favorite</button>
											</div>
										</a>
	
									</aside>
	
								</div>
								<%-- 오른쪽 사이드 메뉴 END --%>
                     </form>
                  </div>
               </div>
            </div>
            <%-- detail-content-sticky-nav-01  div END --%>

            <div class="multiple-sticky no-border hidden-sm hidden-xs">&#032;</div>
            <%-- is used to stop the above stick menu --%>

            <%-- 또다른 추천 루트  START --%>
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
   <script type="text/javascript" src="/js/jquery.sumogallery.js"></script>
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