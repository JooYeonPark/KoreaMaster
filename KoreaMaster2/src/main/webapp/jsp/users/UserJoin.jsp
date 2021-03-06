<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Title Of Site -->
	<title>한뽀 - 한반도뽀개기</title>
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
	<link href="/css/ksj-style.css" rel="stylesheet">
	<link href="/css/plugin.css" rel="stylesheet">

	<!-- CSS Custom -->
	<link href="/css/style.css" rel="stylesheet">
	
	
	<!-- Add your style -->
	<link href="/css/your-style.css" rel="stylesheet">
	
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		// 비밀번호 확인
		$("#usersPassword2").keyup(function() {
			var passwd = $("#usersPassword").val();
			var passwd2 = $("#usersPassword2").val();
			
			if (passwd2 == "") {
				document.getElementById("passwordCheckText").innerHTML = "";
			} else if (passwd != passwd2) {
				document.getElementById("passwordCheckText").innerHTML = "<font color=#DF3F32 size=3pt> 비밀번호가 맞지 않습니다. </font>"
				$('#pwChk').val('N');		
			} else {
				document.getElementById("passwordCheckText").innerHTML = "<font color=#4F84C4 size=3pt> 비밀번호가 올바르게 입력 되었습니다. </font>"
				$('#pwChk').val('Y');	
			}
		});
		
		$("#id-confirm").click(function(){
			var id = $("#usersId").val();
			
			if (id == "") {
				$("#idResult").innerHTML ="<font color=#DF3F32 size=3pt> 아이디를 입력해주세요. </font>";
				return;
			}
			
			$.ajax({
				type : 'POST',
				data : "usersId=" + id,
				dataType : "text",
				url : '/checkId.do',
				success : function(data) {
					var chkRst = data;
					if (chkRst == "Y") {
						document.getElementById("idResult").innerHTML ="<font color=#4F84C4 size=3pt>사용가능한 아이디 입니다.</font>";
						$("#idChk").val('Y');
					} else{
						document.getElementById("idResult").innerHTML ="<font color=#DF3F32 size=3pt>이미 등록된 아이디입니다.</font>";
						$("#idChk").val('N');
					}
				},
				error : function(xhr, status, e) {
					alert(e);
				}
			}); 
		});
		
		$("#register").click(function(event) {
			event.preventDefault();
			
			if($("#idChk").val() =='N'){
				alert("아이디 중복을 확인해주세요");
				return;
			}
				 
			if($("#pwChk").val() =='N'){
				alert("비밀번호가 일치하지 않습니다");
				return;
			}
			
			$('#UserForm').submit();
		});
	});
	</script>
	
</head>
<body>
		

<!-- 회원가입 완료 / 추가할 부분 이메일 인증번호 보내고 확인받기 -->
<!-- start Register Modal -->
<!-- <form method="post" action="/user?cmd=join-db" enctype="multipart/form-data"> -->
<form method="post" action="/userjoin.do" id="UserForm" enctype="multipart/form-data">
<!-- <div id="registerModal" class="modal fade login-box-wrapper" tabindex="-1" data-backdrop="static" data-keyboard="false" data-replace="true"> -->

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h4 class="modal-title text-center">Create your account</h4>
	</div>
	
	<div class="modal-body joinBody">
	
		<div class="row gap-20">
			<div class="col-sm-12 col-md-12 joinBotyInputMargin">
				<div class="col-sm-5 col-md-5"> 
					<label>이름</label>
					<input id="usersName" name="usersName" class="form-control" placeholder="" type="text" required> 
				</div>
			</div>
			
			<div class="col-sm-12 col-md-12 joinBotyInputMargin">
				<div class="col-sm-4 col-md-4"> 
					<label>아이디</label> <br/>
					<input id="usersId" name="usersId" class="form-control" placeholder="Enter your ID" type="text" required>
				</div>
				<div class="col-sm-2 col-md-2">
					<input id="id-confirm"class="idcheckMargin form-control btnJoin" value="ID Check" type="button" > 
				</div>
				<div class="col-sm-6 col-md-6 divMargin">
					<b id="idResult"></b>
					<input type="hidden" id="idChk" value="N">
				</div>
			</div>
			
			<div class="col-sm-12 col-md-12 joinBotyInputMargin">
				<div class="col-sm-6 col-md-6"> 
					<label>Password</label>
					<input id="usersPassword" name="usersPassword" class="form-control" placeholder="Min 4 and Max 20 characters" type="password" required> 
				</div>
			</div>
			
			<div class="col-sm-12 col-md-12 joinBotyInputMargin">
				<div class="col-sm-6 col-md-6"> 
					<label>Password Confirmation</label>
					<input class="form-control"  id="usersPassword2" placeholder="Re-type password again" type="password" required> 
				</div>
				<div class="col-sm-6 col-md-6 divMargin"> 
					<b id="passwordCheckText"></b> 
					<input type="hidden" id="pwChk" value="N">
				</div>
			</div>
			
			<div class="col-sm-12 col-md-12 joinBotyInputMargin">
				<div class="col-sm-6 col-md-6"> 
					<label>Email Address</label>
					<input id="usersEmail" name="usersEmail" class="form-control" placeholder="Enter your email address" type="text" required> 
				</div>
			</div>
			
			<div class="col-sm-12 col-md-12 joinBotyInputMargin">
				<div class="col-sm-8 col-md-8"> 
					<label>Tel</label> <br/>
					<select class="form-control tel" name="tel1">
						<option>010</option>
						<option>011</option>
						<option>017</option>						
					</select> -
					<input class="form-control tel " name="tel2" placeholder="1234" type="text" required> -
					<input class="form-control tel " name="tel3" placeholder="5678" type="text" required>
				</div>
			</div>			
	
			<!-- 우편번호 API 연결하기 -->
			<div class="col-sm-12 col-md-12">
				<div class="col-sm-8 col-md-8 "> 
					<label>Address</label><br/>
					<input id="usersPostcode" name="usersPostcode" class="form-control joinBotyInputMargin" placeholder="12345" type="text">
					<input onclick="sample6_execDaumPostcode()" id="searchPostcode"class="form-control joinPostBtn joinBotyInputMargin" value="search" type="button">
					<input id="usersAddress" name="usersAddress" class="form-control joinBotyInputMargin" placeholder="충남 계룡시 두마면 두계리" type="text" required>
					<input id="usersAddressDetail" name="usersAddressDetail" class="form-control joinBotyInputMargin" placeholder="e-편한세상 102동" type="text" > 
				</div>
			</div>

			<!-- 사진 파일 업로드 -->
			<div class="col-sm-12 col-md-12">
				<div class="col-sm-5 col-md-5"> 
					<label>Profile</label><br/>
					<input type="file" class="joinBotyInputMargin" name="usersPicture" required>
				</div>
			</div>
			
			<div class="col-sm-12 col-md-12">
				<div class="checkbox-block joinBotyInputMargin"> 
					<input id="register_accept_checkbox" name="register_accept_checkbox" class="checkbox" value="First Choice" type="checkbox"> 
					<label class="" for="register_accept_checkbox">By register, I read &amp; accept <a href="#">the terms</a></label>
				</div>
			</div>
			
			<div class="col-sm-12 col-md-12">
				<div class="login-box-box-action joinBotyInputMargin">
<!-- 					Already have account? <a data-toggle="modal" href="#loginModal">Log-in</a> -->
					Already have account? <a data-toggle="modal" href="#loginModal">Log-in</a>
				</div>
			</div>
			
		</div>
	
	</div>
	
	<div class="modal-footer text-center">
		<input type="submit" class="btn btn-primary"  id="register" value="Register"/>
		<button type="button" data-dismiss="modal" class="btn btn-primary btn-border joinBotyInputMargin">Close</button>
	</div>
	
<!-- </div> -->
</form>
<!-- end Register Modal -->

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

</body>
</html>