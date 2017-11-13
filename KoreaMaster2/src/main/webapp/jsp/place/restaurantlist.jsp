<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Title Of Site -->
<title>한반도 뽀개기 - 식당</title>
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

<%-- CSS Plugins --%>
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

<script type="text/javascript">

var paramPage = <%=request.getParameter("page")%>;
var paramSort = <%=request.getParameter("sort")%>;
var paramSido = <%=request.getParameter("sido")%>;
var paramSigungu = <%=request.getParameter("sigungu")%>;

var page = 1;
if (paramPage != null) {
	page = paramPage;
}

var sort = 1;
if(paramSort != null){
	sort = paramSort;
}

var sido = 0;
if(paramSido != null){
	sido = paramSido;
}

var sigungu = 0;
if(paramSigungu != null){
	sigungu = paramSigungu;
}

$(function(){
	init();
	
	$("#theme").change(function() {
		theme = $("#theme option:selected").val();
		var data = {"page" : page, "sort" : sort, "sido" : sido, "sigungu" : sigungu};
		listPage(data);
	});
	
	$("#sort").change(function() {
		sort = $("#sort option:selected").attr("id");
		var data = {"page" : page, "sort" : sort, "sido" : sido, "sigungu" : sigungu};
		listPage(data);
	});
	
	$(document).on("click", ".pagination li a", function(event) {
		event.preventDefault();
		page = $(this).attr('href');
		var data = {"page" : page, "sort" : sort, "sido" : sido, "sigungu" : sigungu};
		var param = $.param(data);
		
		window.location.replace("/jsp/place/restaurantlist.jsp?"+param);	
	});
	
	$(document).on("change", "#selectSido", function(event) {
		sido = $("#selectSido option:selected").val();
		
		// 시군구 가져오기
		$.ajax({
			url:"/sigungu.do",
			type:"get",
			data : {sidoNo : sido},
			dataType:"json",
			success:function(data){
				//시도 데이터 불러들여 set
				$.each(data, function(key, value){
					$("#selectSigungu") .append($("<option></option>").attr("value",key).text(value));		
				}); 
				
				$("#selectSigungu").selectpicker("refresh"); 
			},
			error : function(xhr, statusText){
				console.log("("+xhr.status+", "+statusText+")");
			}
		});
		
		//리스트
		var data = {"page" : page, "sort" : sort, "sido" : sido, "sigungu" : sigungu};
		listPage(data);
	});
	
	$(document).on("change", "#selectSigungu", function(event) {
		sigungu = $("#selectSigungu option:selected").val();
		var data = {"page" : page, "sort" : sort, "sido" : sido, "sigungu" : sigungu};
		listPage(data);
	});
	
});

function init(){
	if(sort ==2){
		$("#sort").val("name").prop("selected", true);
	}
	$("#sort").selectpicker("refresh");
	
	if(sigungu != 0){
		$("#selectSigungu").val(sigungu+"").prop("selected", true);
	}
	$("#selectSigungu").selectpicker("refresh");
	
	if(sido != 0){
		$("#selectSido").val(sido+"").prop("selected", true);
	}
	$("#selectSido").selectpicker("refresh");
	
	sidoAjax();
	
	var data = {"page" : page, "sort" : sort, "sido" : sido, "sigungu" : sigungu};
	listPage(data);
}

function sidoAjax(){
	$.ajax({
		url:"/sido.do",
		dataType:"json",
		success:function(data){
			//시도 데이터 불러들여 set
			$.each(data, function(key, value){
				$("#selectSido") .append($("<option></option>").attr("value",key).text(value));		
			}); 
			
			$("#selectSido").selectpicker("refresh"); 
		},
		error : function(xhr, statusText){
			console.log("("+xhr.status+", "+statusText+")");
		}
	});
}

<%-- 검색 및 페이지에 따른 list가져오기 ajax --%>
function listPage(data){
	$("#gridSpot div[class='GridLex-col-3_mdd-4_sm-6_xs-6_xss-12']").remove();
	var str = "";
	// 전체 리스트 불러오기
	$.ajax({
		url : "/restaurantPage.do",
		data : data,
		dataType: "json",
		success : function(data){
			var maxPage = data.maxPage;
			var startPage = data.startPage;
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
				
				if(i == maxPage) break;
				
			}
			if(page != maxPage){
				pageStr += "<li><a href='"+(page+1)+"' aria-label='Next'> <span aria-hidden='true'>&raquo;</span> </a></li>";
			}
			$(".pagination").html(pageStr);
			
			$.each(data.array, function(index, restaurant) {
				var detail = restaurant.detail;
				str += "<div class='GridLex-col-3_mdd-4_sm-6_xs-6_xss-12' id='"+restaurant.cityNo+"'>" + 
						"<div class='trip-guide-item'>"+
							"<div class='trip-guide-image'>"+
								"<img src='/images/spot/"+restaurant.picture+"' alt='images' />"+
							"</div>"+
							"<div class='trip-guide-content' style='margin-bottom: 50px;'>"+
								"<h3>"+restaurant.name+"</h3>"+
								"<p>"+restaurant.detail+"</p>"+
							"</div>"+
							"<div class='trip-guide-bottom' >"+
								"<div class='trip-guide-meta row gap-10'>"+
									"<div class='col-xs-6 col-sm-6'>"+
										"<div class='rating-item'>"+
											"<input type='hidden' class='rating' data-filled='fa fa-star rating-rated' "+
											"data-empty='fa fa-star-o' data-fractions='2' data-readonly value='"+restaurant.useNum+"' />"+
										"</div>"+
									"</div>"+
								"</div>"+
								"<div class='row gap-10'>"+
									"<div class='col-sm-offset-6 col-xs-12 col-sm-6 text-right'>"+
										"<a href='/jsp/place/restaurantdetail.jsp?restaurantNo="+restaurant.no+"' class='btn btn-primary' value='"+restaurant.no+"'>Details</a>"+
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
								<h2>RESTAURANT</h2>
								<p>대한민국 </p>
							</div>
						</div>
					</div>

					<div class="breadcrumb-wrapper">
						<ol class="breadcrumb">
							<li><a href="index.jsp">Home</a></li>
							<li class="active"><a href="#">Restaurant</a></li>
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
										<!-- 도시별 start div -->
										<div class="col-xss-12 col-xs-6 col-sm-3">
											<div class="filter-item mmr">
												<div class="input-group input-group-addon-icon no-border no-br-xs">
													<span class="input-group-addon input-group-addon-icon bg-white">
														<label class="block-xs"><i class="fa fa-sort-amount-asc"></i> 시도:</label>
													</span> 
													<select class="selectpicker" id="selectSido">
													<option value="0">전체</option>
													</select>
												</div>
											</div> 
										</div>
										<!-- 도시별 end div -->
										
										<!-- 시군구별 start div -->
										<div class="col-xss-12 col-xs-6 col-sm-3">
											<div class="filter-item mmr">
												<div class="input-group input-group-addon-icon no-border no-br-xs">
													<span class="input-group-addon input-group-addon-icon bg-white">
														<label class="block-xs"><i class="fa fa-sort-amount-asc"></i> 시군구:</label>
													</span> 
													<select class="selectpicker" id="selectSigungu">
													<option value="0">전체</option>
													</select>
												</div>
											</div> 
										</div>
										<!-- 시군구별 end div -->

										<div class="col-xs-12 col-sm-12 col-md-6">
											<div class="filter-item-wrapper">
												<div class="row">
												
													<!-- 정렬 start div -->
													<div class="col-xss-12 col-xs-6 col-sm-6">
														<div class="filter-item mmr">
															<div class="input-group input-group-addon-icon no-border no-br-xs">
																<span class="input-group-addon input-group-addon-icon bg-white">
																	<label class="block-xs"><i class="fa fa-sort-amount-asc"></i> Sort by:</label> </span> 
																	<select class="selectpicker" id="sort">
																	<option id="1" value="higging"> hitting </option>
																	<option id="2" value="name"> name</option>
																</select>
															</div>
														</div>
													</div>
													<!-- 정렬 end div -->
													
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
							<div class="GridLex-grid-noGutter-equalHeight " id="gridSpot">
								
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