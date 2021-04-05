<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var idx = false;
		var pw = false;
		var pwc = false;
		var tel = false;
		var address = false;
	/* 패스워드 정규규현식과 더불어 패스워드가 같은지 질문*/
	  
	 $("input[class=Pwchc1]").blur(function() {
				var userpw = $("input[name=userPW]").val();
				var pwCheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
				if (userpw.search(/\s/) != -1) {
					pw = false;
					var html = "<tr><td colspan='3' style='color: red'>공백없이 작성 하세요</td></tr>";
					$('.message').empty();
					$('.message').html(html);
					$("input[class=Pwchc1]").focus();
				} else if (userpw == "") {
					pw = false;
					var html = "<tr><td colspan='3' style='color: red'>필수 사항 입니다.</td></tr>";
					$('.message').empty();
					$('.message').html(html);
					$("input[class=Pwchc1]").focus();
				} else if (!pwCheck.test(userpw)) {
					pw = false;
					var html = "<tr><td colspan='3' style='color: red'>사용 불가능한 비밀번호 입니다.</td></tr>";
					$('.message').empty();
					$('.message').html(html);
					$("input[class=Pwchc1]").focus();
				} else {
					pw = true;
					var html = "<tr><td colspan='3' style='color: green'>사용가능한 비밀번호입니다.</td></tr>";
					$('.message').empty();
					$('.message').append(html);
				}
			});
			//패스워드 확인
			$("input[name=userPW1]").blur(function() {
				if ($("input[name=userPW1]").val() != $("input[class=Pwchc1]").val()) {
					pwc = false;
					var html = "<tr><td colspan='3' style='color: red'>비밀번호가 다릅니다.</td></tr>";
					$('.message1').empty();
					$('.message1').append(html);
					$("input[name=userPW1]").focus();
				}
				//같을 경우
				else{
					pwc = true;
					$('.message1').empty();
					}
			});
	      
	      
	      
	      
	      
	      
	/* +++++++++++++++++++++++++++++++++++++++++++++  */




/*  여기부터 userview Update */

			function pwUpdate() {
				alert("비밀번호 버튼 눌렀니?")
				if (pw != true) {
				$("input[name=userPW]").focus()
				return false;
				}
				else{
				var ajaxPW = $('input[name=userPW]').val();
				var upDatech = 1;
				alert("비밀번호 여기까지 왔니?")
				$.ajax({
					url : "UserUpdate.do",
					type:"POST",
					data : {"userDate" : ajaxPW, "upDatech":upDatech},
					success: function(data) {
						
						if($('#hiden1').css('display') == 'none'){
							$('#hiden1').html(ajaxPW).html('<input type="button" id="pwbut" value="수정" onclick="pwUpdate()1" />');
							$('#hiden1').show();
							$('#pwhiden').hide();
							}
						},
					   			error : function () {
									alert("error")
					}
				});
			}
		}
		function telUpdate() {
			alert("연락처 버튼 눌렀니?")
			var ajaxTel = $('input[name=userTel]').val();
			var upDatech = 3;
			alert("연락처 여기까지 왔니?")
			$.ajax({
				url : "UserUpdate.do",
				type:"POST",
				data : {"userDate" : ajaxTel, "upDatech":upDatech},
				success: function(data) {
					
					if($('#hiden2').css('display') == 'none'){
						$('#hiden2').html(ajaxTel).html('<input type="button" id="telbut" value="수정" onclick="telUpdate1()" />');
						$('#hiden2').show();
						$('#Telhiden').hide();
						}
					},
				   			error : function () {
								alert("error")
				}
			});
		}
	});
/* =================여기까지 입니다.=============================  */
</script>

<style type="text/css">
#main div{
border: 1px solid #999999;
}

#main {
	width: 100%;
	margin-top: 70px;
	height: 100%;
	border: 1px solid #999999;
	text-align: justify;
}

.fontsize{
	float: inherit;
}

h3 {
	color: #778899;
}

div {
	border: 1px solid #999999;
}

#text {
	margin-top: 60px;
}

.fontsize {
	font-family: sans-serif;
}

.fontcolor {
	color: #00ced1;
}

.few {
	color: red;
}

.userId1{
float: left;
width: 100px;
}

.userId2 {
	margin-left: 150px;
}

#name_gender {
	float: left;
}

#few_id {
	margin-left: 100px;
}

.Gender {
	margin-left: 100px;
}

.name_gender1 {
	margin-top: 20px;
	margin-left: 150px;
}

#name_few {
	margin-left: 115px;
}

.gender {
	margin-left: 48px;
	margin-top: 31px;
	margin-bottom: 30px;

}

#gender1_few {
	margin-left: 153px;
}

#hiden {
	display: none;
}
#hiden1 {
	display: none;
}
#hiden2{
display: none;
}
.pw_tel_main{
height: 180px;
}
.pw_label{
float: left;
}
#pw_tel_body{
float: left;
margin-top: 19px;
margin-left: 30px;
width: 562px;
}

.pw_tel2{
height: 60px;
}
.pw_few{
width: 340px;
float: right;
margin-right: 25px;
}
.tel_tel1{
height: 61px;
}
.tel_label1{
 
}
.Tel_few{
margin-left: 146px;
float: right;
}
.tel_tel1{
float: left;
}
.birth_address_label1{
float: left;
margin-right: 119px;
}
.birth_address_label{
float: left;
margin-right: 45px;
}
.birth_address{
height: 141px;
}
.birth_label{
margin-top: 17px;
}
#Bfew{
margin-top: 10px;
}
.address_label{
margin-top: 55px;

}
#address_few{
margin-top: 28px;
}
#few{
margin-top: 13px;
}
.cash{
height: 56px;
}
.cash_label{
float: left;
margin-right: 115px;
}
.cash_label1{
margin-right: 115;
}
.cash_few{
float: left;
margin-right: 123px;
margin-top: 20px;
}
.cash_few1{
height: 50px;
margin-top: 20px;
}
#cashbut{

}
</style>
</head>
<body>

	<div id="main">
		<div id="top">
			<div class="Myinformation">
				<h2 class="fontsize">
					내정보를
					<spen class="fontcolor">최신 정보로 관리</spen>
					해 주세요
				</h2>
			</div>
			<div class="Information">
					<h3>아이디/비밀번호 분실 및 보호조치 해제를 위해 최신 정보로 내정보를 관리 하세요</h3>
			</div>
		</div>
		<div id="text">
			<div class="userId">
				<div class="userId1">
					아이디
				</div>
				<div class="userId2">
					User 아이디 
					<span class="few" id="few_id">${clientVO.userID}아이디
					</span>
				</div>
			</div>	
				<div class="name">
					<div class="name1">
						<span id="name_gender">이름/성별</span>

						<div class="name_gender1" >
							<span class="name">User 이름 
								<span class="few" id="name_few">${clientVO.userName}
								</span>
							</span>
						</div>

						<div class="gender">
								<span class="Gender">성별 
									<span class="few" id="gender1_few">${clientVO.userGender}성별
									<br />
									</span>
								</span>
						</div>
					</div>
				</div>
			

			<div class="pw_tel_main">
				<span class="pw_label">비밀번호/연락처</span>
				<div id="pw_tel_body">
					<div class="pw_tel2">
						<span class="pw_label1">비밀번호
						</span>
						<div class="pw_few" id="pwhiden">
							<span class="few" id="pw_text">
								<input type="text" name="userPW" class="Pwchc1" value="${clientVO.userPW}" />
								<span class="message"></span>
								<br />
								<input type="text" name="userPW1" class="Pwchc2" value="${clientVO.userPW}" />
								<span class="message1"></span>
								<br />
								<input type="button" id="pwbut" style="margin-left: 50px;" value="완료" onclick="pwUpdate()" />
								<input type="button" value="취소" onclick="cancle2()" />
							</span> 
							
								<br />
							
						</div>
						<div class="pw_few" id="hiden1">
							<span class="few">${clientVO.userPW}
								<input type="button" id="pwbut" value="수정" onclick="pwUpdate()1" />
							</span> 
							<br />
						</div>
					</div>
					<div class="tel_tel1">
						<span class="tel_label1" id="Telhiden">연락처</span>
						<div class="Tel_few">
							<span class="few">
								<input type="text" name="userTel" value="${clientVO.userTel}" />
								<br /> 
								<input type="button" id="telbut" style="margin-left: 50px;" value="완료" onclick="telUpdate()" />
								<input type="button" value="취소" onclick="cancle3()" /> 
							</span>
						</div>
						<div class="Tel_few" id="hiden2">
							<span class="few">${clientVO.userTel}
							<input type="button" id="telbut" value="수정" onclick="telUpdate1()" />
							</span>
						</div>
					</div>
				</div>
				</div>
				
			</div>
			<div class="birth_address">
				<div class="birth_address_label">생년월일/주소
				</div>
				<div class="birth_address_label1">
					<span class="birth_label" style="display: inline-block;">생년월일
					</span>
					<br /> 
					<span class="address_label" style="display: inline-block;">주소
					</span>
				</div>
				<div class="birth_address_few">
					<span class="few" id="Bfew" style="display: inline-block;">${clientVO.userBirth}생일
					</span>
					<br />
					<span class="few" id="address_few" style="display: inline-block;">
						<input type="text" value="${clientVO.userAddress}"/>
						<br />
						<input type="button" id="telbut" style="margin-left: 50px;" value="완료" onclick="addressUpdate()" />
						<input type="button" value="취소" onclick="cancle5()" />
					</span>
				</div>
			</div>
			<div id="cash">
				<div class="cash_label">
					<span class="cash_label1">캐쉬
					</span>
				</div>
				<div class="cash_label1">
					<span class="cash_few">캐쉬라벨
					</span>
				</div>
				<div class="cash_few1">보유 캐시
					<span class="few"> ${clientVO.userCash}
					</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>