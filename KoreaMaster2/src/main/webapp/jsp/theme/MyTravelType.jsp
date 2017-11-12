<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% session.setAttribute("user", "cyzy4862"); %>

<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Title Of Site -->
	<title>Togoby - Tour hosting</title>
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

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	
	
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
	
	<!-- my JS -->
	<script type="text/javascript" src="/js/MyTravelTypeJS.js"></script>
	
</head>

<body class="transparent-header">

<!-- start Container Wrapper -->
<div class="container-wrapper">
	
	<header id="header">
		<!-- start Navbar (Header) -->
<%-- 		<jsp:include page="/include/navigation.jsp"/> --%>
		<!-- end Navbar (Header) -->
	</header>
	
	<!-- start Main Wrapper -->
		
		<div class="main-wrapper scrollspy-container">
		
			<!-- start breadcrumb -->
			
			<div class="breadcrumb-image-bg pb-100 no-bg" style="background-image:url('/images/breadcrumb-bg.jpg');">
				<div class="container">
					<div class="page-title">
						<div class="row">
							<div class="col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3">
							
								<h2>What is your travel type?</h2>
								<p>We can help find your travel type</p>
						
							</div>
						</div>
					</div>
					
					<div class="breadcrumb-wrapper">
					
						<ol class="breadcrumb">
							<li><a href="#">Home</a></li>
							<li class="active"><span>travel type test</span></li>
						</ol>
					
					</div>
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
									<div class="promo-box-02 mb-40">

										<div class="icon">
											<i class="ti-plus"></i>
										</div>

										<h4> Start find your travel type FOR FREE!! </h4>

									</div>

									<!-- start Test -->
									<div class="row">
										<h4 class="section-title"> My travel type test</h4>
										<p> '나의 여행 성향 테스트' 를 통해 고객님의 성향을 파악한 후 그에 맞는 여행 플랜을 제공해드립<br/>니다. 신중히 설문에 응해주십시오. 감사합니다. </p>
										<h4 class="section-title"></h4>
										<br/><br/>
			
										<!-- start travelTest -->
										<div id="travelTest">


											<!-- no.1 -->
											<div id="question_1" class="age-option-wrapper">
												<label class="block"> 1. 다음 중 어느 관광지를 선택 하시겠습니까? </label>

												<div class="row">
													<div class="col-sm-12">
														<div class="radio-block">
															<input id="check_1-1" name="question_1" type="radio" class="radio" value="check_1-1" checked="checked"/>
															<label class="" for="check_1-1"><span> 화려한 불빛으로 빛나는 도심 </span></label>
														</div>
													</div>
													
													<div class="clear"></div>
					
													<div class="col-sm-12">
														<div class="radio-block">
															<input id="check_1-2" name="question_1" type="radio" class="radio" value="check_1-2"/>
															<label class="" for="check_1-2"><span> 잔잔한 파도가 치는 바다 </span></label>
														</div>
													</div>	
												</div>
											</div>
											
											<br/><br/>
											
											<!-- no.2 -->
											<div id="question_2" class="manyPeople-option-wrapper">
												<label class="block"> 2. 여행이란 조용하고 평온한 곳에서 유유자적해야 한다. </label>
											
												<div class="row">
													<div class="col-sm-12">
														<div class="radio-block">
															<input id="check_2-1" name="question_2" type="radio" class="radio" value="check_2-1"/>
															<label class="" for="check_2-1"><span> 동의한다. </span></label>
														</div>
													</div>
													
													<div class="clear"></div>
					
													<div class="col-sm-12">
														<div class="radio-block">
															<input id="check_2-2" name="question_2" type="radio" class="radio" value="check_2-2"/>
															<label class="" for="check_2-2"><span> 동의하지 않는다. </span></label>
														</div>
													</div>
												</div>
											</div>
											
											<br/><br/>
											
											<!-- no.3 -->
											<div id="question_3" class="season-option-wrapper">
												<label class="block"> 3. 같이 여행간 친구가 무서운 액티비티를 하자고 한다. 나는 _ </label>
											
												<div class="row">
													<div class="col-sm-12">
														<div class="radio-block">
															<input id="check_3-1" name="question_3" type="radio" class="radio" value="check_3-1"/>
															<label class="" for="check_3-1"><span> 여행을 와서 안하면 언제 할까. 친구와 함께한다. </span></label>
														</div>
													</div>
													
													<div class="clear"></div>
					
													<div class="col-sm-12">
														<div class="radio-block">
															<input id="check_3-2" name="question_3" type="radio" class="radio" value="check_3-2"/>
															<label class="" for="check_3-2"><span> 그 시간에 쇼핑하러 가거나 워터파크를 간다. </span></label>
														</div>
													</div>
												</div>
											</div>
											
											<br/><br/>
											
											<!-- no.4 -->
											<div id="question_4" class="ficture-option-wrapper">
												<label class="block"> 4. 두 가지 선택사항. 깨끗한 바다 or 곡선의 미 전통 한옥마을 나는 _ </label>
											
												<div class="row">
													<div class="col-sm-12">
														<div class="radio-block">
															<input id="check_4-1" name="question_4" type="radio" class="radio" value="check_4-1"/>
															<label class="" for="check_4-1"><span> 바다를 선택하겠다. </span></label>
														</div>
													</div>
													
													<div class="clear"></div>
					
													<div class="col-sm-12">
														<div class="radio-block">
															<input id="check_4-2" name="question_4" type="radio" class="radio" value="check_4-2"/>
															<label class="" for="check_4-2"><span> 한옥마을을 선택하겠다.	 </span></label>
														</div>
													</div>
												</div>
											</div>
											
											<br/><br/>
											
											<!-- no.5 -->
											<div id="question_5" class="ficture-option-wrapper">
												<label class="block"> 5. 숙소 근처에 예상치 못한 볼거리가 많은 전시회가 있다. 인생 샷을 건질 수 있을 것만 같은 예감이 든다. 하지만 계획에 없었기 때문에 전시회를 가면 쇼핑을 못하게 된다. 나는 _ </label>
											
												<div class="row">
													<div class="col-sm-12">
														<div class="radio-block">
															<input id="check_5-1" name="question_5" type="radio" class="radio" value="check_5-1"/>
															<label class="" for="check_5-1"><span> 쇼핑은 언제든지 할 수 있다. 전시회를 간다. </span></label>
														</div>
													</div>
													
													<div class="clear"></div>
					
													<div class="col-sm-12">
														<div class="radio-block">
															<input id="check_5-2" name="question_5" type="radio" class="radio" value="check_5-2"/>
															<label class="" for="check_5-2"><span> 그래도 쇼핑은 포기 못한다. </span></label>
														</div>
													</div>
												</div>
											</div>
											
											<br/><br/>
											
											<!-- no.6 -->
											<div id="question_6" class="ficture-option-wrapper">
												<label class="block"> 6. 일정대로라면 한복을 입고 꽃이 예쁘게 핀 한옥마을로 가아하지만, 현지인이 멋있는 아쿠아리움을 추천해줬다. 나는 둘 중에 _ 을(를) 선택하겠다. </label>
											
												<div class="row">
													<div class="col-sm-12">
														<div class="radio-block">
															<input id="check_6-1" name="question_6" type="radio" class="radio" value="check_6-1"/>
															<label class="" for="check_6-1"><span> 한옥마을 </span></label>
														</div>
													</div>
													
													<div class="clear"></div>
					
													<div class="col-sm-12">
														<div class="radio-block">
															<input id="check_6-2" name="question_6" type="radio" class="radio" value="check_6-2"/>
															<label class="" for="check_6-2"><span> 아쿠아리움 </span></label>
														</div>
													</div>
												</div>
											</div>
											
											<br/><br/>
											
											<!-- no.7 -->
											<div id="question_7" class="ficture-option-wrapper">
												<label class="block"> 7. 요즘 유행하는 집 라인을 타고 싶지만 비용이 비싸다. 차라리 무료로 허브비누를 만들 수 있는 허브 박물관을 가겠다. </label>
											
												<div class="row">
													<div class="col-sm-12">
														<div class="radio-block">
															<input id="check_7-1" name="question_7" type="radio" class="radio" value="check_7-1"/>
															<label class="" for="check_7-1"><span> 동의한다. </span></label>
														</div>
													</div>
													
													<div class="clear"></div>
					
													<div class="col-sm-12">
														<div class="radio-block">
															<input id="check_7-2" name="question_7" type="radio" class="radio" value="check_7-2"/>
															<label class="" for="check_7-2"><span> 동의하지 않는다. </span></label>
														</div>
													</div>
												</div>
											</div>
											
											<br/><br/>
											
											<!-- no.8 -->
											<div id="question_8" class="ficture-option-wrapper">
												<label class="block"> 8. 소문난 맛집에 갔다. 사람이 너무 많아 여행계획에 차질이 생겨 쇼핑이나 온천체험을 포기해야 한다. 나는 _ </label>
											
												<div class="row">
													<div class="col-sm-12">
														<div class="radio-block">
															<input id="check_8-1" name="question_8" type="radio" class="radio" value="check_8-1"/>
															<label class="" for="check_8-1"><span> 쇼핑은 절대 포기 못한다. </span></label>
														</div>
													</div>
													
													<div class="clear"></div>
					
													<div class="col-sm-12">
														<div class="radio-block">
															<input id="check_8-2" name="question_8" type="radio" class="radio" value="check_8-2"/>
															<label class="" for="check_8-2"><span> 온천체험은 절대 포기 못한다. </span></label>
														</div>
													</div>
												</div>
											</div>
											
											<br/><br/>
											
											<!-- no.9 -->
											<div id="question_9" class="ficture-option-wrapper">
												<label class="block"> 9. 나는 자연을 즐기는 것 보다 전시물들의 아름다움을 볼 수 있는 전시회를 방문하는 것이 <br/>더 좋다. </label>
											
												<div class="row">
													<div class="col-sm-12">
														<div class="radio-block">
															<input id="check_9-1" name="question_9" type="radio" class="radio" value="check_9-1"/>
															<label class="" for="check_9-1"><span> 동의한다. </span></label>
														</div>
													</div>
													
													<div class="clear"></div>
					
													<div class="col-sm-12">
														<div class="radio-block">
															<input id="check_9-2" name="question_9" type="radio" class="radio" value="check_9-2"/>
															<label class="" for="check_9-2"><span> 동의하지 않는다. </span></label>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- end travelTest -->
									
								</div>
								
								<div class="mb-50">
									<div class="checkbox-block font-icon-checkbox">
										<input id="test_accept" name="test_accept" type="checkbox" class="checkbox" />
										<label class="" for="test_accept"> '나의 여행 성향 테스트'에 작성하신 정보들을 본 사의 고객들의 편의를 위하여 서비스 제공을 위하여 사용 하는 것에 동의합니다.&nbsp;&nbsp;&nbsp;&nbsp;
										<a data-toggle="modal" href="#con_limit_Modal" class="font700"> Learn more consent &amp; limitations </a></label>
									</div>

									<div class="mb-25"></div>

									<div class="modal-footer text-center">
										<button id="finish" type="button" class="btn btn-primary btn-border">Finish</button>
									</div>
								</div>
							</div>
						</div>
						<br/><br/><br/><br/><br/><br/><br/>
				</div>
			</div>
		</div>
	</div>
	<!-- end container -->

	<!-- start Footer Wrapper -->
	<jsp:include page="/include/footer.jsp"/>
	<!-- end Footer Wrapper -->
	
</div>	
<!-- end Container Wrapper -->

<!-- start Back To Top -->
<div id="back-to-top">
	<a href="#"><i class="ion-ios-arrow-up"></i></a>
</div>
<!-- end Back To Top -->
	






<!-- start consent&limitations Modal -->
<div id="con_limit_Modal" class="modal fade login-box-wrapper" tabindex="-1" data-backdrop="static" data-keyboard="false" data-replace="true">

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title text-center">Learn more consent &amp; limitations</h4>
	</div>
	
	<div class="modal-body">
		<div class="row gap-20">

			<div class="col-sm-12 col-md-12">
				<div class="form-group"> 
					<label>Consent</label>
					<textarea class="form-group" rows=6 cols=75 readonly="readonly">1. 목적: 여행정보 서비스, 온라인 회원 관리       2. 수집항목: - 필수: 성명, 아이디, 비밀번호, 이메일, 휴대폰번호, 뉴스레터수신여부 - 선택: 관심분야, SMS수신여부, 직업, 주소, 필명, 전화번호, 생년월일, 결혼여부, 결혼기념일, 가입동기  ※ 아이핀, 휴대전화 인증시 개인식별정보 DI (Duplication Information : 중복가입확인정보),  CI (Connection information : 사용자 교유 식별자)   3. 수집방법: 홈페이지 회원 가입      4. 개인정보 보유·이용기간: 동의일로부터 동의철회(직권해지)시 까지</textarea>
				</div>
			</div>
			
			<div class="col-sm-12 col-md-12">
				<div class="form-group"> 
					<label>Limitations</label>
					<textarea class="form-group" rows=6 cols=75 readonly="readonly">약관의 내용은 서비스 화면에 게시하고 이용자가 동의함으로써 효력이 발생합니다. 공사는 합리적인 사유가 발생될 경우에는 이 약관을 변경할 수 있으며, 약관이 변경되는 경우에는 최소한 7일전에 공지합니다. 또한 새로운 서비스가 개설될 경우, 별도의 명시된 설명이 없는 한 이 약관에 따라 제공됩니다.          ※ 위 개인정보 수집.이용에 관한 동의는 회원가입에 필수적이므로 이에 동의하셔야 이후 절차를 진행할 수 있습니다. 수집에 동의하지 않으시는 경우 공사에서 제공하는 관광정보 지킴이, 관광서비스 제공, 관광정보사용신청등의 서비스에 제한이 있을 수 있습니다.</textarea>
				</div>
			</div>
			
		</div>
	</div>
	
	<div class="modal-footer text-center">
		<button type="button" data-dismiss="modal" class="btn btn-primary btn-border">Close</button>
	</div>
	
</div>
<!-- end Register Modal -->


</body>

</html>