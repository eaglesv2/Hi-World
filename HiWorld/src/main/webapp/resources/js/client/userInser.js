$(document)
		.ready(
				function(e) {
					var idx = false;
					$('#signUp').click(function() {
						if ($.trim($('#userID').val()) == '') {
							alert("아이디 입력.");
							$('#userID').focus();
							return false;
						} else if ($.trim($('#userPW').val()) == '') {
							alert("패스워드 입력.");
							$('#userPW').focus();
							return false;
						}
						// 패스워드 확인
						else if ($('#userPW').val() != $('#pwCheck').val()) {
							alert('패스워드가 다릅니다.');
							$('#userPW').focus();
							return false;
						}
						// 성별확인
						else if ($('#userGender').val() == null) {
							alert('성별을 선택해주세요')
							$('#userGender').focus()
							return false;
						}
						// 생일 확인
						else if ($.trim($('#userBirth').val()) == '') {
							alert('생일을 적어부세요')
							$('#userBirth').focus();
							return false;
						}
						// 아이디 중복체크 확인
						if (idx == false) {
							alert("아이디 중복체크를 해주세요.");
							return false;
						} else {
							$('#userinsert').submit();
						}

					});

					$("input[name=userID]")
							.blur(
									function() {
										var userid = $("input[name=userID]")
												.val();
										var idReg = RegExp(/^[A-Za-z0-9_\-]{2,20}$/);
										if (userid.search(/\s/) != -1) {
											var html = "<tr><td colspan='3' style='color: red'>아이디를 공백없이 입력해 주세용</td></tr>";
											$('#idCheck').empty();
											$('#idCheck').append(html);
										} else if (userid.length < 1
												|| userid.length > 20) {
											var html = "<tr><td colspan='3' style='color: red'>아이디는 5자에서 20자 이하로 입력 해주세요</td></tr>";
											$('#idCheck').empty();
											$('#idCheck').append(html);
										} else if (!idReg.test(userid)) {
											var html = "<tr><td colspan='3' style='color: red'>아이디는 영문대.소문자, 숫자_,-만 입력가능하고 20자리이하로 입력 바랍니다.</td></tr>";
											$('#idCheck').empty();
											$('#idCheck').append(html);
										} else {
											var html = "<tr><td colspan='3' style='color: red'>사용가능한 아이디입니다.</td></tr>";
											$('#idCheck').empty();
											$('#idCheck').append(html);
										}
									});

					// 아이디 중복 확이 ajax
					$('#check')
							.click(
									function() {
										var userid = $('#userID').val();
										$
												.ajax({
													url : "idCheck.do",
													type : "POST",
													data : {
														userID : userid
													},
													success : function(data) {
														if (data == 0
																&& $
																		.trim($(
																				'#userID')
																				.val()) != '') {
															idx = true;
															$('#userID').attr(
																	"readonly",
																	true);
															var html = "<tr><td colspan='3' style='color: green'>사용가능</td></tr>";
															$('#idCheck')
																	.empty();
															$('#idCheck')
																	.append(
																			html);
															alert("들어는 왔니?")
														} else {

															var html = "<tr><td colspan='3' style='color: red'>사용불가능한 아이디 입니다.</td></tr>";
															$('#idCheck')
																	.empty();
															$('#idCheck')
																	.append(
																			html);
														}
													},
													error : function() {
														alert("서버에러");
													}
												});

									});
					// 이름 지향문자 체크
					$("input[name=userName]")
							.blur(
									function() {
										var username = $("input[name=userName]")
												.val();
										var nameCheck = /^[가-힣]{3,6}$/;
										if (username.search(/\s/) != -1) {
											var html = "<tr><td colspan='3' style='color: red'>이름을 공백없이 입력해 주세용</td></tr>";
											$('#nameCheck').empty();
											$('#nameCheck').append(html);
										} else if (username == "") {
											var html = "<tr><td colspan='3' style='color: red'>이름을 공백없이 입력해 주세용</td></tr>";
											$('#nameCheck').empty();
											$('#nameCheck').append(html);
										} else if (!nameCheck.test(username)) {
											var html = "<tr><td colspan='3' style='color: red'>이름은 한글과 영어, 숫자만 사용하며 2자리 ~ 6자리 사이로 적어주세요</td></tr>";
											$('#nameCheck').empty();
											$('#nameCheck').append(html);
										} else {
											var html = "<tr><td colspan='3' style='color: red'>사용가능한 아이디입니다.</td></tr>";
											$('#nameCheck').empty();
											$('#nameCheck').append(html);
										}
									});

					$("input[name=userPW]")
							.blur(
									function() {
										var userpw = $("input[name=userPW]")
												.val();
										var pwCheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
										if (userpw.search(/\s/) != -1) {
											var html = "<tr><td colspan='3' style='color: red'>비번을 공백없이 입력해 주세용</td></tr>";
											$('#pwCheck').empty();
											$('#pwCheck').append(html);
										} else if (userpw == "") {
											var html = "<tr><td colspan='3' style='color: red'>비번을 공백없이 입력해 주세용</td></tr>";
											$('#pwCheck').empty();
											$('#pwCheck').append(html);
										} else if (!pwCheck.test(userpw)) {
											var html = "<tr><td colspan='3' style='color: red'>패스워드는 영문 대문자 소문자, 숫자, 특수문자 하나 이상 포함하여 8자에서 16자 안으로 적어주세용</td></tr>";
											$('#pwCheck').empty();
											$('#pwCheck').append(html);
										} else {
											var html = "<tr><td colspan='3' style='color: red'>사용가능한 아이디입니다.</td></tr>";
											$('#pwCheck').empty();
											$('#pwCheck').append(html);
										}
									});

					$("input[name=userBirth]")
							.blur(
									function() {
										var userbirth = $(
												"input[name=userBirth]").val();
										var birthCheck = RegExp(/^(19|20)[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/);
										if (userbirth.search(/\s/) != -1
												&& userbirth == "") {
											var html = "<tr><td colspan='3' style='color: red'>생일을 공백없이 입력해 주세용</td></tr>";
											$('#birthCheck').empty();
											$('#birthCheck').append(html);
										} else if (!birthCheck.test(userbirth)) {
											var html = "<tr><td colspan='3' style='color: red'>생년월일을 예)20210815 이런식으로 적어주세용</td></tr>";
											$('#birthCheck').empty();
											$('#birthCheck').append(html);
										} else {
											var html = "<tr><td colspan='3' style='color: red'>사용가능한 생일입니다.</td></tr>";
											$('#birthCheck').empty();
											$('#birthCheck').append(html);
										}

									});

				});