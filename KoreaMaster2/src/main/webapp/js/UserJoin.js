/**
 * 
 */

	$(function() {
		var id;

		// 아이디 중복 체크
		$('#usersId').keyup(function() {
			id = $(this).val();
			$.ajax({
				type:"post",
				url:"/jsp/users/IdCheck.jsp",
				data : {'usersId' : id},
				dataType : 'text',
				success : function(data) {
					if(data.trim() == 'YES') {
						$("#id-check").addClass("red");
						$("#id-check").removeClass("gray");
						$("#id-check").html("이미 사용중인 아이디입니다.");
						$("#id-check").show();
						id = false;
					} else if( id != "" && data.trim()=="NO") {
						$("#id-check").addClass("gray");
						$("#id-check").removeClass("red");
						$("#id-check").html("사용 가능한 아이디입니다.");
						$("#id-check").show();
						id = true;
					} else {
						$("#id-check").addClass("red");
						$("#id-check").removeClass("gray");
						$("#id-check").html("아이디를 입력하세요");
						$("#id-check").show();
					}
				},
				error : function(error) {
					alert("예외발생 : " + error);
				}
			});
		});


		// 회원가입 버튼 눌렀을 때
		$("#join").click(function() {
			
			var pass = $("#usersPassword").val();
			var email = $("#usersEmail").val();
			var lo = email.indexOf("@");
			var cation = email.indexOf(".");
			var last = email.lastIndexOf("@");
			var tel1reg = /\d{3,4}/g;
			var tel2reg = /\d{4}/g;
			
			
			if($("#usersName").val() == "") { // 이름 입력 안했을 시
				$("#name-check").html("이름을 입력하세요");
				$("#id-check").html("");
				$("#pass-check").html("");
				$("#word-check").html("");
				$("#email-check").html("");
				$("#tel-check").html("");
				$("#address-check").html("");
				// 포커스 이동
				$("#usersName").focus();
			} else if($("#usersId").val() == "") { // 아이디 입력 안했을 시
				$("#name-check").html("");
				$("#id-check").html("아이디를 입력하세요");
				$("#pass-check").html("");
				$("#word-check").html("");
				$("#email-check").html("");
				$("#tel-check").html("");
				$("#address-check").html("");
				// 포커스 이동
				$("#usersId").focus();
			} else if(!id) { // 아이디 이미 존재할 때
				$("#name-check").html("");
				$("#pass-check").html("");
				$("#word-check").html("");
				$("#email-check").html("");
				$("#tel-check").html("");
				$("#address-check").html("");
				// 포커스 이동
				$("#usersId").focus();
			} else if($("#usersPassword").val() == "") { // 비밀번호 입력 안했을 시
				$("#name-check").html("");
				$("#id-check").html("");
				$("#pass-check").html("비밀번호를 입력하세요");
				$("#word-check").html("");
				$("#email-check").html("");
				$("#tel-check").html("");
				$("#address-check").html("");
				// 포커스 이동
				$("#usersPassword").focus();
			} else if( pass.length < 4 || pass.length > 20 ) { // 비밀번호 자릿수 만족시키지 못했을 때
				$("#name-check").html("");
				$("#id-check").html("");
				$("#pass-check").html("비밀번호를 4~20자로 입력해주세요. 현재 " + pass.length + "자 입니다.");
				$("#word-check").html("");
				$("#email-check").html("");
				$("#tel-check").html("");
				$("#address-check").html("");
				// 포커스 이동
				$("#usersPassword").focus();
			} else if($("#usersPassword").val() != $("#passwordConfirmation").val()) { // 비밀번호 일치하지 않을 시
				$("#name-check").html("");
				$("#id-check").html("");
				$("#pass-check").html("");
				$("#word-check").html("비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
				$("#email-check").html("");
				$("#tel-check").html("");
				$("#address-check").html("");
				// 포커스 이동
				$("#passwordConfirmation").focus();
			} else if($("#usersEmail").val() == "") { // 이메일 입력 안했을 시
				$("#name-check").html("");
				$("#id-check").html("");
				$("#pass-check").html("");
				$("#word-check").html("");
				$("#email-check").html("이메일을 입력하세요");
				$("#tel-check").html("");
				$("#address-check").html("");
				// 포커스 이동
				$("#usersEmail").focus();
			} else if( lo == -1 ) { // 이메일에 @ 입력 안했을 시
				$("#name-check").html("");
				$("#id-check").html("");
				$("#pass-check").html("");
				$("#word-check").html("");
				$("#email-check").html("이메일 주소에 '@'를 포함해 주세요 '" + email + "'에 @가 없습니다.");
				$("#tel-check").html("");
				$("#address-check").html("");
				// 포커스 이동
				$("#usersEmail").focus();
			} else if( lo == 0 ) { // @ 앞에 이메일 형태가 없을 경우
				$("#name-check").html("");
				$("#id-check").html("");
				$("#pass-check").html("");
				$("#word-check").html("");
				$("#email-check").html("'@' 앞 부분을 입력해 주세요 '" + email + "'는 완전하지 않습니다.");
				$("#tel-check").html("");
				$("#address-check").html("");
				// 포커스 이동
				$("#usersEmail").focus();
			} else if( email.length - lo == 1 ) { // @ 뒤에 이메일 형태가 완전하지 않을 경우
				$("#name-check").html("");
				$("#id-check").html("");
				$("#pass-check").html("");
				$("#word-check").html("");
				$("#email-check").html("'@' 뒷 부분을 입력해 주세요 '" + email + "'는 완전하지 않습니다.");
				$("#tel-check").html("");
				$("#address-check").html("");
				// 포커스 이동
				$("#usersEmail").focus();
			} else if(lo != last) { // @를 두번 이상 입력했을 때
				$("#name-check").html("");
				$("#id-check").html("");
				$("#pass-check").html("");
				$("#word-check").html("");
				$("#email-check").html("'@' 다음 부분에 '@' 기호가 포함되면 안됩니다.");
				$("#tel-check").html("");
				$("#address-check").html("");
				// 포커스 이동
				$("#usersEmail").focus();
			} else if($("#tel1").val() == "") { // 전화번호1 입력 안했을 시
				$("#name-check").html("");
				$("#id-check").html("");
				$("#pass-check").html("");
				$("#word-check").html("");
				$("#email-check").html("");
				$("#tel-check").html("전화번호를 입력하세요");
				$("#address-check").html("");
				// 포커스 이동
				$("#tel1").focus();
			} else if(!tel1reg.test($("#tel1").val())) { // 전화번호1 정규화
				$("#name-check").html("");
				$("#id-check").html("");
				$("#pass-check").html("");
				$("#word-check").html("");
				$("#email-check").html("");
				$("#tel-check").html("숫자로 3~4자리로 입력하세요");
				$("#address-check").html("");
				// 포커스 이동
				$("#tel1").focus();
			} else if($("#tel2").val() == "") { // 전화번호2 입력 안했을 시
				$("#name-check").html("");
				$("#id-check").html("");
				$("#pass-check").html("");
				$("#word-check").html("");
				$("#email-check").html("");
				$("#tel-check").html("전화번호를 입력하세요");
				$("#address-check").html("");
				// 포커스 이동
				$("#tel2").focus();
			} else if(!tel2reg.test($("#tel2").val())) { // 전화번호2 정규화
				$("#name-check").html("");
				$("#id-check").html("");
				$("#pass-check").html("");
				$("#word-check").html("");
				$("#email-check").html("");
				$("#tel-check").html("숫자로 4자리로 입력하세요");
				$("#address-check").html("");
				// 포커스 이동
				$("#tel2").focus();
			} else if($("#usersPostcode").val() == "" || $("#usersAddress").val() == "" || $("#usersAddressDetail").val() == "" ) {
				// 주소 입력 안했을 때
				$("#name-check").html("");
				$("#id-check").html("");
				$("#pass-check").html("");
				$("#word-check").html("");
				$("#email-check").html("");
				$("#tel-check").html("");
				$("#address-check").html("주소를 입력하세요");
				
			} else if(!$("#register_accept_checkbox").prop("checked")) { // 회원가입 동의 체크 안했을 시
				$("#name-check").html("");
				$("#id-check").html("");
				$("#pass-check").html("");
				$("#word-check").html("");
				$("#email-check").html("");
				$("#tel-check").html("");
				$("#address-check").html("");
				alert("회원가입 동의에 체크해주세요");
			} else $("#joinForm").submit();
			
		});

	});