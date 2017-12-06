<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Title Of Site -->
	<title>한뽀 - 회원가입</title>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript" src="/js/UserJoin.js"></script>
	<style type="text/css">
		#joinForm {
			width: 700px;
			margin: 0 auto;
			font-size: 20px;
		}
		#join {
			width : 650px;
		}
		.detail-breadcrumb.breadcrumb-image-bg {
			padding: 90px;
		}
		/* 헤더부분 간격 조절 */
		.detail-breadcrumb.breadcrumb-image-bg {
			padding: 90px;
		}
		.modal-footer {
			margin: 20px;
			border-top: 0px;
		}
		.modal-body {
			margin-top: 20px;
		}
		.checkJoin {
			font-size: 17px;
			color : red;
		}
		.red {
			color : red;
		}
		.gray {
			color : gray;
		}
	</style>	
 
	
</head>
<body>

<!-- start breadcrumb -->

	<div class="breadcrumb-image-bg detail-breadcrumb"
		style="background-image: url('/images/detail-header.jpg');">
		<div class="container">
	
			<div class="page-title detail-header-02">
	
				<div class="row">
	
					<div
						class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
	
						<h2>Create your account for free</h2>
						<span class="labeling text-white mt-25"><span>Welcome KoreaMaster</span></span>
						<div class="rating-item rating-item-lg mb-25">
						</div>
						<ul class="list-with-icon list-inline-block">
							<li><i class="ion-android-done text-primary"></i>SuJin Kim</li>
							<li><i class="ion-android-done text-primary"></i>HyunHee Kim</li>
							<li><i class="ion-android-done text-primary"></i>JooYeon Park</li>
							<li><i class="ion-android-done text-primary"></i>EunJi Yang</li>
						</ul>
	
					</div>
	
				</div>
	
			</div>
	
		</div>
	
	</div>
<!-- end breadcrumb -->

<!-- start Register Modal -->
<form id="joinForm" method="post" action="/user?cmd=join-db" enctype="multipart/form-data">
	
	<div class="modal-body">
	
		<div class="row gap-20">
			
	<!-- 사용자 이름 -->		
			<div class="col-sm-12 col-md-12">
				<div class="form-group"> 
					<label>Username</label>
					<input id="usersName" name="usersName" class="form-control" placeholder="Min 4 and Max 10 characters" type="text">
					<div class="checkJoin" id="name-check"></div> 
				</div>
			</div>
			
	<!-- 사용자 아이디 -->	
			<div class="col-sm-12 col-md-12">
				<div class="form-group"> 
					<label>UserID</label> <br/>
					<input id="usersId" name="usersId" class="form-control" placeholder="Enter your ID" type="text">
					<div class="checkJoin" id="id-check"></div>
				</div>
			</div>
			
	<!-- 사용자 비밀번호 -->
			<div class="col-sm-12 col-md-12">
				<div class="form-group"> 
					<label>Password</label>
					<input id="usersPassword" name="usersPassword" class="form-control" placeholder="Min 4 and Max 20 characters" type="password">
					<div class="checkJoin" id="pass-check"></div> 
				</div>
			</div>
			
	<!-- 사용자 비밀번호 확인 -->
			<div class="col-sm-12 col-md-12">
				<div class="form-group"> 
					<label>Password Confirmation</label>
					<input id="passwordConfirmation" class="form-control" placeholder="Re-type password again" type="password">
					<div class="checkJoin" id="word-check"></div> 
				</div>
			</div>
			
	<!-- 사용자 이메일 -->
			<div class="col-sm-12 col-md-12">
				<div class="form-group"> 
					<label>Email Address</label>
					<input id="usersEmail" name="usersEmail" class="form-control" placeholder="Enter your email address" type="text">
					<div class="checkJoin" id="email-check"></div> 
				</div>
			</div>
			
	<!-- 사용자 전화번호 -->
			<div class="col-sm-12 col-md-12">		
				<div class="form-group"> 
					<label>Tel</label> <br/>
					<select class="form-control tel" name="tel1">
						<option>010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>	
						<option>019</option>							
					</select> -
					<input id="tel1" class="form-control tel" name="tel2" placeholder="1234" type="text"> -
					<input id="tel2" class="form-control tel" name="tel3" placeholder="5678" type="text">
					<div class="checkJoin" id="tel-check"></div>
				</div>
			</div>			
	
	<!-- 우편번호 API 연결하기 -->
			<div class="col-sm-12 col-md-12">
				<div class="form-group"> 
					<label>Address</label><br/>
					<input id="usersPostcode" name="usersPostcode" class="form-control" placeholder="12345" type="text">
					<input onclick="sample6_execDaumPostcode()" id="searchPostcode"class="form-control" value="search" type="button">
					<input id="usersAddress" name="usersAddress" class="form-control" placeholder="충남 계룡시 두마면 두계리" type="text">
					<input id="usersAddressDetail" name="usersAddressDetail" class="form-control" placeholder="e-편한세상 102동" type="text">
					 <div class="checkJoin" id="address-check"></div>
				</div>			
			</div>
			
			<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
			<script>
			    function sample6_execDaumPostcode() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                var fullAddr = ''; // 최종 주소 변수
			                var extraAddr = ''; // 조합형 주소 변수
			
			                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                    fullAddr = data.roadAddress;
			
			                } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                    fullAddr = data.jibunAddress;
			                }
			
			                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			                if(data.userSelectedType === 'R'){
			                    //법정동명이 있을 경우 추가한다.
			                    if(data.bname !== ''){
			                        extraAddr += data.bname;
			                    }
			                    // 건물명이 있을 경우 추가한다.
			                    if(data.buildingName !== ''){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
			                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			                }
			
			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                document.getElementById('usersPostcode').value = data.zonecode; //5자리 새우편번호 사용
			                document.getElementById('usersAddress').value = fullAddr;
			
			                // 커서를 상세주소 필드로 이동한다.
			                document.getElementById('usersAddressDetail').focus();
			            }
			        }).open();
			    }
			</script>
			
	<!-- 사진 파일 업로드 -->
			<form enctype="multipart/form-data">
			<div class="col-sm-12 col-md-12">
	
				<div class="form-group"> 
					<label>Profile</label><br/>
					 <input id="file" type="file" name="usersPicture"/>
				</div>
			</div>
			</form>
			
	<!-- 회원가입 동의 -->
			<div class="col-sm-12 col-md-12">
				<div class="checkbox-block"> 
					<input id="register_accept_checkbox" name="register_accept_checkbox" class="checkbox" value="First Choice" type="checkbox"> 
					<label class="" for="register_accept_checkbox">By register, I read &amp; accept <a href="#">the terms</a></label>
				</div>
			</div>
			
			<div class="col-sm-12 col-md-12">
				<div class="login-box-box-action">
					Already have account? <a data-toggle="modal" href="/user?cmd=login-page">Log-in</a>
				</div>
			</div>
		</div>
	
	</div>
	
	<div class="modal-footer text-center">
		<input id="join" type="button" class="btn btn-primary" value="Register"/>
<!-- 		<button type="button" data-dismiss="modal" class="btn btn-primary btn-border">Close</button> -->
	</div>
	
<!-- </div> -->
</form>
<!-- end Register Modal -->

<!-- start footer -->
	<jsp:include page="/include/footer.jsp"></jsp:include>
<!-- end footer -->

</body>
</html>