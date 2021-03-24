	$(document).ready(function() {
		var idx = false;
		var id = false;
		var pw = false;
		var pwc = false;
		var name = false;
		var birth = false;
		$('#signUp').click(function() {
			//아이디가 잘못 된 입력인지 확인
			if (id != true) {
				$("input[name=userID]").focus()
				return false;
				
			//패스워드가 잘못 된 입력인지 확인	
			} else if (pw != true) {
				$("input[name=userPW]").focus()
				return false;
				
			//이름이 잘못 된 입력인지 확인
			}else if (name != true){
				$("input[name=userName]").focus()
				return false;
			}
			
			// 패스워드 확인
			else if (pwc!= true) {
				$('#pwCheck').focus()
				return false;
			}
			// 성별확인
			else if ($('#userGender').val() == "") {
				var html = "<tr><td colspan='3' style='color: red'>성별을 선택하시오</td></tr>";
				$('#error_next_box4').empty();
				$('#error_next_box4').append(html);
				$('#userGender').focus()
				return false;
			}
			// 생일 확인
			else if (birth != true) {
				$("input[name=userBirth]").focus()
				return false;
			}
			 else {
				$('#userinsert').submit();
			}

		});


		// 아이디 중복 확이 ajax
		$("input[name=userID]").blur(function() {
			var userid = $("input[name=userID]").val();
			var idReg = /^[A-Za-z0-9_\-]{5,20}$/;
			if (userid.search(/\s/) != -1) {
				$("input[name=userID]").focus();
				id = false;
				var html = "<tr><td colspan='3' style='color: red'>아이디를 공백없이 입력해 주세요</td></tr>";
				$('#error_next_box').empty();
				$('#error_next_box').append(html);
			} else if (!idReg.test(userid)) {
				$("input[name=userID]").focus();
				id = false;
				var html = "<tr><td colspan='3' style='color: red'>아이디는 영문대.소문자, 숫자_,-만 입력가능하고5에서 20자리이하로 입력 바랍니다.</td></tr>";
				$('#error_next_box').empty();
				$('#error_next_box').append(html);
			}else{
			$.ajax({
				url : "idCheck.do",
				type : "POST",
				data : { userID : userid },
				success : function(data) {
					 if (data == 0 && $.trim($('#userID').val()) != '') {
						idx = true;
						id = true;
						var html = "<tr><td colspan='3' style='color: green'>사용 가능한 아이디입니다.</td></tr>";
						$('#error_next_box').empty();
						$('#error_next_box').append(html);
					}else {
						$("input[name=userID]").focus();
						idx = false;
						id = false;
						var html = "<tr><td colspan='3' style='color: red'>사용불가능한 아이디 입니다.</td></tr>";
						$('#error_next_box').empty();
						$('#error_next_box').append(html);
					}
				},
				error : function() {
					alert("서버에러");
				}
			});
			}
		});
		// 이름 정규표현문 체크
		$("input[name=userName]").blur(
			function() {
			var username = $("input[name=userName]").val();
			var nameCheck = /^[가-힣]{3,6}$/;
			if (username.search(/\s/) != -1) {
				name = false;
				var html = "<tr><td colspan='3' style='color: red'>이름을 공백없이 입력하시오</td></tr>";
				$('#error_next_box3').empty();
				$('#error_next_box3').append(html);
				$("input[name=userName]").focus();
			} else if (username == "") {
				name = false;
				var html = "<tr><td colspan='3' style='color: red'>이름을 공백없이 입력하시오</td></tr>";
				$('#error_next_box3').empty();
				$('#error_next_box3').append(html);
				$("input[name=userName]").focus();
			} else if (!nameCheck.test(username)) {
				name = false;
				var html = "<tr><td colspan='3' style='color: red'>이름은 한글과 영어, 숫자만 사용하며 2자리 ~ 6자리 사이로 적으시오</td></tr>";
				$('#error_next_box3').empty();
				$('#error_next_box3').append(html);
				$("input[name=userName]").focus();
			} else {
				var html = "<tr><td colspan='3' style='color: green'>사용가능한 이름입니다.</td></tr>";
				name = true;
				$('#error_next_box3').empty();
				$('#error_next_box3').append(html);
			}
		});
		
		//패스워드 정규표현식 구현
		$("input[name=userPW]").blur(function() {
			var userpw = $("input[name=userPW]").val();
			var pwCheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
			if (userpw.search(/\s/) != -1) {
				pw = false;
				var html = "<tr><td colspan='3' style='color: red'>비번을 공백없이 입력하시오</td></tr>";
				$('#error_next_box1').empty();
				$('#error_next_box1').append(html);
				$("input[name=userPW]").focus();
			} else if (userpw == "") {
				pw = false;
				var html = "<tr><td colspan='3' style='color: red'>비번을 공백없이 입력하시오</td></tr>";
				$('#error_next_box1').empty();
				$('#error_next_box1').append(html);
				$('#userPW').focus();
			} else if (!pwCheck.test(userpw)) {
				pw = false;
				var html = "<tr><td colspan='3' style='color: red'>패스워드는 영문 대문자 소문자, 숫자, 특수문자 하나 이상 포함하여 8자에서 16자 안으로 적으시오</td></tr>";
				$('#error_next_box1').empty();
				$('#error_next_box1').append(html);
				$('#userPW').focus();
			} else {
				pw = true;
				var html = "<tr><td colspan='3' style='color: green'>사용가능한 패스워드입니다.</td></tr>";
				$('#error_next_box1').empty();
				$('#error_next_box1').append(html);
			}
		});
		//패스워드 확인
		$("input[name=pwCheck]").blur(function() {
			if ($('#userPW').val() != $('#pwCheck').val()) {
				pwc = false;
				var html = "<tr><td colspan='3' style='color: red'>패스워드가 다릅니다.</td></tr>";
				$('#error_next_box2').empty();
				$('#error_next_box2').append(html);
				$("input[name=pwCheck]").focus();
			}
			//같을 경우
			else{
				pwc = true;
				var html = "<tr><td colspan='3' style='color: green'>패스워드 확인되었습니다.</td></tr>";
				$('#error_next_box2').empty();
				$('#error_next_box2').append(html);
				}
		});
		$("input[name=userGender").blur(function() {
			
		});
		// 생일 정규표현 구현
		$("input[name=userBirth]").blur(function() {
			var userbirth = $("input[name=userBirth]").val();
			var birthCheck = RegExp(/^(19|20)[0-9]{2}(.)(0[1-9]|1[0-2])(.)(0[1-9]|[1-2][0-9]|3[0-1])$/);
			if (userbirth.search(/\s/) != -1 && userbirth == "") {
				birth = false;
				var html = "<tr><td colspan='3' style='color: red'>생일을 공백없이 입력해 주세용</td></tr>";
				$('#error_next_box5').empty();
				$('#error_next_box5').append(html);
				$("input[name=userBirth]").focus();
			} else if (!birthCheck.test(userbirth)) {
				birth = false;
				var html = "<tr><td colspan='3' style='color: red'>생년월일을 예)2021.08.15 이런식으로 적어주세용</td></tr>";
				$('#error_next_box5').empty();
				$('#error_next_box5').append(html);
				$("input[name=userBirth]").focus()
			} else {
				birth = true;
				var html = "<tr><td colspan='3' style='color: green'>옳바른 입력입니다.</td></tr>";
				$('#error_next_box5').empty();
				$('#error_next_box5').append(html);
			}
		});
	});