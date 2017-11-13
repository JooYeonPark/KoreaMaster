<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Title Of Site -->
<title>한반도 뽀개기 - 루트 리스트</title>
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
<%
String pTheme = request.getParameter("themeName");
String pSort = request.getParameter("sort");
%>

var paramPage = <%=request.getParameter("page")%>;
var paramTheme = <%=request.getParameter("themeName")%>;
var paramSort = <%=request.getParameter("sort")%>;

var page =1;
if (paramPage != null) {
	page = paramPage;
}

var theme = 0;
if(paramTheme != null){
	theme = paramTheme;
} 

var sort = 1;
if(paramSort != null){
	sort = paramSort;
}

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
	
	$(document).on("click", ".pagination li a", function(event) {
		event.preventDefault();
		page = $(this).attr('href');
		var data = {"page" : page, "themeName" : theme, "sort" : sort};
		var param = $.param(data);
		
		 window.location.replace("/jsp/place/spotList.jsp?"+param);	
	});
	
});


function init(){
	// sort선택값 지정
	if(sort != 1){
		$("#sort").val("name").prop("selected", true);
	}
	
	//  theme sort 선택값 지정
	if(theme != 0){
		$("#theme").val(theme+"").prop("selected", true);
	}
	
	var data = {"page" : page, "themeName" : theme, "sort" : sort};
	listPage(data);
}

<%-- 검색 및 페이지에 따른 list가져오기 ajax --%>
function listPage(data){
	$("#gridSpot div[class='GridLex-col-3_mdd-4_sm-6_xs-6_xss-12']").remove();
	var str = "";
	// 전체 리스트 불러오기
	$.ajax({
		url : "/spotPage.do",
		data : data,
		dataType: "json",
		success : function(data){
			var maxPage = data.maxPage
			var startPage = data.startPage
			var pageStr = "";
			
			if(page != 1){
				pageStr += "<li><a href='"+(page-1)+"' aria-label='Previous' id='"+(page-1)+"'> <span aria-hidden='true'>&laquo;</span> </a></li>";
			}
			for (var i = startPage; i < startPage+5; i++) {
				if(i == page){
					pageStr += "<li class='active'><a href='#' >"+i+"</a></li>"
				}else{
					pageStr += "<li class=''><a href='"+i+"'>"+i+"</a></li>"
				}
				
			}
			if(page != maxPage){
				pageStr += "<li><a href='"+(page+1)+"' aria-label='Next'> <span aria-hidden='true'>&raquo;</span> </a></li>";
			}
			$(".pagination").html(pageStr);
			
			$.each(data.array, function(index, spot) {
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
								<p>대한민국 </p>
							</div>
						</div>
					</div>

					<div class="breadcrumb-wrapper">
						<ol class="breadcrumb">
							<li><a href="index.jsp">Home</a></li>
							<li class="active"><a href="#">Spot</a></li>
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
																	<label class="block-xs"><i class="fa fa-sort-amount-asc"></i> 시도 :</label>
																	</span> <select class="selectpicker form-control block-xs" id="sort">
																</select>
															</div>
														</div>
													</div>
													<div class="col-xss-12 col-xs-6 col-sm-5">
														<div class="filter-item mmr">
															<div
																class="input-group input-group-addon-icon no-border no-br-xs">
																<span
																	class="input-group-addon input-group-addon-icon bg-white">
																	<label class="block-xs"><i class="fa fa-sort-amount-asc"></i> 시군구 :</label>
																	</span> <select class="selectpicker form-control block-xs" id="sort">
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
																	<option value="0"> All Types</option>
																	<option value="1"> 자연</option>
																	<option value="2"> 경험</option>
																	<option value="3"> 문화</option>
																	<option value="4"> 레포츠</option>
																	<option value="5"> 역사</option>
																	<option value="6"> 쇼핑</option>
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
							<!-- <div class="clearfix">Showing reslut 1 to 15 from 248</div> -->
							<div class="clearfix">
								<nav class="pager-center">
								<ul class="pagination">
								<!-- 페이지 -->
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


</body>

</html>