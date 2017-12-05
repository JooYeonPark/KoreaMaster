<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<%-- Title Of Site --%>
	<title>Create Trip</title>
	<meta name="description" content="HTML template for multiple tour agency, local agency, traveller, tour hosting based on Twitter Bootstrap 3.x.x" />
	<meta name="keywords" content="tour agency, tour guide, travel, trip, holiday, vocation, relax, adventure, virtual tour, tour planner" />
	<meta name="author" content="crenoveative">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	<%-- Fav and Touch Icons --%>
	<link rel="apple-touch-icon" sizes="144x144" href="/images/ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon" sizes="114x114" href="/images/ico/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon" sizes="72x72" href="/images/ico/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon" href="/images/ico/apple-touch-icon-57-precomposed.png">
	<link rel="shortcut icon" href="/images/ico/favicon.png">

	<%-- CSS Plugins --%>
	<link rel="stylesheet" type="text/css" href="/bootstrap//css/bootstrap.min.css" media="screen">	
	<link href="/css/main.css" rel="stylesheet">
	<link href="/css/plugin.css" rel="stylesheet">

	<%-- CSS Custom --%>
	<link href="/css/style.css" rel="stylesheet">
	
	<%-- Add your style --%>
	<link href="/css/your-style.css" rel="stylesheet">

	<%-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries --%>
	<%--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]--%>
	
	
<%-- Core JS --%>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/core-plugins.js"></script>
<script type="text/javascript" src="/js/customs.js"></script>

<%-- Create Page JS --%>
<script type="text/javascript" src="/js/jquery.bootstrap-touchspin.js"></script>
<script type="text/javascript" src="/js/dropzone.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/jquery.ui.timepicker.js"></script>
<script type="text/javascript" src="/js/bootstrap-tokenfield.js"></script>
<script type="text/javascript" src="/js/typeahead.bundle.min.js"></script>
<script type="text/javascript" src="/js/customs-create.js"></script>

<%-- Detail Page JS --%>
<script type="text/javascript" src="/js/moment.min.js"></script>
<script type="text/javascript" src="/js/jquery.daterangepicker.js"></script>

<%-- Address --%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style>
.month-wrapper{
display: flex;
}
</style>
	
<script>
$(document).ready(function(){
   
   var days ;
    
    $("#selectpicker").selectpicker(); 


	$('#rangeDatePicker > div > div').dateRangePicker({
		separator : ' to ',
		autoClose: true,
		format: 'YYYY-MM-DD',
		stickyMonths: true,
		startDate: new Date(),
		minDays : 0,
		maxDays : 0,
		showTopbar: false,
		getValue: function()
		{
			if ($('#rangeDatePickerTo').val() && $('#rangeDatePickerFrom').val() )
				return $('#rangeDatePickerTo').val() + ' to ' + $('#rangeDatePickerFrom').val();
			else
				return '';
		},
		setValue: function(s,s1,s2)
		{
			$('#rangeDatePickerTo').val(s1);
			$('#rangeDatePickerFrom').val(s2);
		},
		
		customArrowPrevSymbol: '<i class="fa fa-arrow-circle-left"></i>',
		customArrowNextSymbol: '<i class="fa fa-arrow-circle-right"></i>'
		
	}).bind('datepicker-change',function(event,obj)
	        {
	    var array = obj.value.split("to");
	    var ms = new Date(array[1])-new Date(array[0]);
	    days = (ms / (1000*60*60*24)) + 1;
	    
	    var text = 	
	        '<div class="col-xs-12 col-sm-12 gap-10 form-group">'+ 
	        	'<div class="form-group">'+
	        		'<div class="col-xs-8 col-sm-8" style="padding-left:30px;"><input type="text" class="form-control" id="address" name="address"  required></div>'+
	        		'<div class="col-xs-4 col-sm-4" style="padding-left:30px;"><input type="button" onclick="daumPostcode()" value="주소찾기" class="btn btn-template-main"></div>'+
	        	'</div>'+
	        '</div>' ;

	    
	    $(".departures").html('<div class="form-group"><label style="padding-left:30px;">출발장소</label></div>');    
	        
	    for(var i=0; i<days; i++){
		 	$(".departures").append(text);
		}; 
	});
	
	
    
	$.ajax({
		url:"/sigungu.do",
		type:"get",
		data : "sidoNo=1",
		dataType:"json",
		success:function(data){
			inputSigungu(data);
		},
		error : function(xhr, statusText){
			console.log("("+xhr.status+", "+statusText+")");
		}
	});
	
	$.ajax({
		url:"/sido.do",
		type:"get",
		dataType:"json",
		success:function(data){
			inputSido(data);
		},
		error : function(xhr, statusText){
			console.log("("+xhr.status+", "+statusText+")");
		}
	});
	
	//시도 클릭마다 시군구가 달라짐
	$("#selectSido").change(function(){
		$.ajax({
			url:"/sigungu.do",
			type:"get",
			data : "sidoNo="+$("#selectSido").attr("value"),
			dataType:"json",
			success:function(data){
				inputSigungu(data);
			},
			error : function(xhr, statusText){
				console.log("("+xhr.status+", "+statusText+")");
			}
		});
		
	});
	
	
	<%-- Submit --%>
	$(".submit").click(function(){
	    var usersId = "${user.usersId}";
	    var startDate = $("input[name=startDate]").val();
	    var endDate = $("input[name=endDate]").val();
	    var city = $("select[name=city] option:selected").val();
	    var departureList = new String();
	     $("select[name=departure] option:selected").each(function(){
		     departureList = departureList + $(this).val()+ ',';
		 }); 
	    $("input[name=address]").each(function(){
		     departureList = departureList + $(this).val()+ ',';
		 });
	    var themes = new String();
	    $('input:checkbox[name=checkbox_block]:checked').each(function() { 
	      themes = themes + $(this).val() + ',';
	   });
	    
	     if(startDate!=null && endDate!=null && city!=null && departureList!=null && themes!=null){
	        var data = {
	                startDate : startDate, 
	                endDate : endDate, 
	                city : city, 
	                departures : departureList, 
	                theme : themes, 
	                days : days,
	                usersId : usersId
	    		};
	    		var param = $.param(data);
	    		
	        window.location.replace("/route.do?"+param); 
	        return false;
	    } 
	});
	
	<%-- CheckBox를 RadioButton처럼 사용하기 위해 (이미 css가 checkBox로 지정되어있어서 부득이하게...)--%>
	  $('input:checkbox[name=checkbox_block]').click(function(){
	   if($(this).prop('checked')){
	       //모든 checkbox click 해제
	       $('input:checkbox[name=checkbox_block]').prop('checked',false);
	       //나의 checkbox click
	       $(this).prop('checked',true);
	   } 
	}); 
	  
	 
	
}); //end $(document).ready

//시도 select 설정
var inputSido = function(data){
	console.log(data);
	
	var cnt = 0;
	
	//시도 데이터 불러들여 set
	$.each(data, function(key, value){
	    if(cnt == 0) var selectedClass = "selected";
	    else selectedClass = "";
	    
		$("#selectSido")
		.append($("<option " + selectedClass + "></option>")
			.attr("value",key)
			.text(value));		
		
		cnt++;
	}); 
	
	
	$("#selectSido").selectpicker("refresh"); 
}

var inputSigungu = function(data){
	
	$("#selectSigungu").html(""); 
	
	$.each(data, function(key, value){
		var option = $("<option></option>").attr("value", key).text(value);
		//$("<option></option>").attr("value", key).text(value)
		$("#selectSigungu").append(option);
	}); 
	
	$("#selectSigungu").selectpicker("refresh"); 
	
}

<%-- 주소 API --%>
function daumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('address').value = fullRoadAddr;
        }
    }).open();
}




</script>
</head>

<body class="transparent-header">

	<%-- start Container Wrapper --%>
	<div class="container-wrapper">

		<%-- start Header --%>
		
		<header id="header">
			<jsp:include page="/include/navigation.jsp"/>
		</header>
		
		<%-- end Header --%>

		<%-- start Main Wrapper --%>
		<div class="main-wrapper scrollspy-container">
		
			<%-- start breadcrumb --%>
			<div class="breadcrumb-image-bg pb-100 no-bg" style="background-image:url('/images/breadcrumb-bg.jpg');">
				<div class="container">
					<div class="page-title">
						<div class="row">
							<div class="col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3">
								<h2>Create Your Tour</h2>
							</div>
						</div>
					</div>
					
					<div class="breadcrumb-wrapper">
						<ol class="breadcrumb">
							<li><a href="/">Home</a></li>
							<li class="active"><span>Trip Create</span></li>
						</ol>
					</div>
				</div>
			</div>
			<%-- end breadcrumb --%>
			
			<div class="bg-light"><%-- 밝은 배경 --%>
				<div class="create-tour-wrapper">
					<div class="container">
						<div class="row">
							<div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
							
								<%-- start form --%>
								<div class="form">
									<div class="create-tour-inner">
										<input type="hidden" name="departures" value="" id="hiddenDepart">
									
										<div class="row">
										
										<%-- 날짜 선택 From - to 시작--%>
										<div class="sidebar-booking-inner">
											<div class="row gap-10" id="rangeDatePicker">
												<div class="col-xss-12 col-xs-6 col-sm-6">
													<div class="form-group">
														<label>From</label> <input type="text" id="rangeDatePickerTo" class="form-control" name="startDate"
															placeholder="yyyy/mm/dd" />
														</div>
													</div>

												<div class="col-xss-12 col-xs-6 col-sm-6">
													<div class="form-group">
														<label>To</label> <input type="text" id="rangeDatePickerFrom" class="form-control" name="endDate"
															placeholder="yyyy/mm/dd" />
													</div>
												</div>
											</div>
										</div>
										<%-- 날짜 선택 끝 --%>
											
										<%-- 시.도 선택  --%>
										<div class="col-xs-6 col-sm-6">
											<div class="form-group">
												<label>시도</label>
												<select class="selectpicker show-tick form-control" title="Select placehorlder" id="selectSido">
												</select>
											</div>
										</div><%-- 시.도 선택 끝  --%>
										
										<%-- 시군구 선택 시작 --%>
										<div class="col-xs-6 col-sm-6">
											<div class="form-group">
												<label>시군구</label>
												<select class="selectpicker show-tick form-control" title="Select placeholder" id="selectSigungu" name="city">
												</select>
											</div>
										</div><%-- 시군구 선택 끝 --%>
									
									                                    
                                      <div class="row departures" >
                                       </div><!-- ./col-xs-12 col-sm-12 -->    
                                        
									</div><%-- ./row --%>
										
									<hr>
									<p class="text-center"><h5 class="text-uppercase">이번 여행에서 원하는 테마가 있으면 선택해주세요. <br>
									본인 성향대로 평소처럼 여행하고 싶다면 선택하지 않으셔도 됩니다.</h5></p>
										
									<%-- 아이콘 모음 시작 --%>
									<div class="row gap-20">
										<div class="col-xs-8 col-sm-8 col-xs-offset-2 col-sm-offset-2">
												<div class="category-checkbox-wrapper clearfix mt-10 mb-15">
					
													<div class="category-checkbox-item">
														<div class="checkbox-block">
															<input id="checkbox_block-1" name="checkbox_block" type="checkbox" class="checkbox" value="1"/>
															<label class="" for="checkbox_block-1">
																<span class="category-checkbox-inner">
																	<span class="middle-outer">
																		<span class="middle-inner">
																			<span class="icon">
																				<i class="flaticon-travel-icons-mountain"></i>
																			</span>
																			자연
																		</span>
																	</span>
																</span>
															</label>
														</div>
													</div>
													
													<div class="category-checkbox-item">
														<div class="checkbox-block">
															<input id="checkbox_block-2" name="checkbox_block" type="checkbox" class="checkbox" value="2"/>
															<label class="" for="checkbox_block-2">
																<span class="category-checkbox-inner">
																	<span class="middle-outer">
																		<span class="middle-inner">
																			<span class="icon">
																				<i class="flaticon-travel-icons-snorkel"></i>
																			</span>
																			체험
																		</span>
																	</span>
																</span>
															</label>
														</div>
													</div>
													
													<div class="category-checkbox-item">
														<div class="checkbox-block">
															<input id="checkbox_block-3" name="checkbox_block" type="checkbox" class="checkbox" value="3"/>
															<label class="" for="checkbox_block-3">
																<span class="category-checkbox-inner">
																	<span class="middle-outer">
																		<span class="middle-inner">
																			<span class="icon">
																				<i class="flaticon-ventures-wallet-closed"></i>
																			</span>
																			문화시설
																		</span>
																	</span>
																</span>
															</label>
														</div>
													</div>
													
													<div class="category-checkbox-item">
														<div class="checkbox-block">
															<input id="checkbox_block-4" name="checkbox_block" type="checkbox" class="checkbox" value="4"/>
															<label class="" for="checkbox_block-4">
																<span class="category-checkbox-inner">
																	<span class="middle-outer">
																		<span class="middle-inner">
																			<span class="icon">
																				<i class="flaticon-travel-icons-kayak"></i>
																			</span>
																			레포츠
																		</span>
																	</span>
																</span>
															</label>
														</div>
													</div>
												
													<div class="category-checkbox-item">
														<div class="checkbox-block">
															<input id="checkbox_block-5" name="checkbox_block" type="checkbox" class="checkbox" value="5"/>
															<label class="" for="checkbox_block-5">
																<span class="category-checkbox-inner">
																	<span class="middle-outer">
																		<span class="middle-inner">
																			<span class="icon">
																				<i class="flaticon-ventures-big-towers"></i>
																			</span>
																			역사
																		</span>
																	</span>
																</span>
															</label>
														</div>
													</div>
													
													<div class="category-checkbox-item">
														<div class="checkbox-block">
															<input id="checkbox_block-6" name="checkbox_block" type="checkbox" class="checkbox" value="6"/>
															<label class="" for="checkbox_block-6">
																<span class="category-checkbox-inner">
																	<span class="middle-outer">
																		<span class="middle-inner">
																			<span class="icon">
																				<i class="flaticon-ventures-cart-facing-left"></i>
																			</span>
																			쇼핑
																		</span>
																	</span>
																</span>
															</label>
														</div>
													</div>
													
												</div>
											</div><%-- ./col-xs-12 col-sm-12 --%>
											
										</div><%-- 아이콘 모음 끝 --%>

									</div><%-- ./create-tour-inner --%>
								
									<div class="mb-50">
										<div class="mb-25"></div>
										<button class="btn btn-primary btn-wide submit">Submit</button>
									</div>
									
								</div><%-- ./form --%>
								
							</div><%-- ./col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2 --%>
						
						</div><%-- ./row --%>
						
					</div><%-- ./container --%>
					
				</div><%-- ./create-tour-wrapper --%>
			
			</div><%-- ./bg-light --%>
		</div>
		<%-- end Main Wrapper --%>
		
		<jsp:include page="/include/footer.jsp"/>
	</div>
	
	<%-- end Container Wrapper --%>
 
 
<%-- start Back To Top --%>
<%-- 맨 위로 올리기 버튼 --%>
<div id="back-to-top">
   <a href="#"><i class="ion-ios-arrow-up"></i></a>
</div>
<%-- end Back To Top --%>

	
</body>


</html>