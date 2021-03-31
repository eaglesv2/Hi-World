<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#main {
	width: 600px;
	margin-top: 70px;
	/* margin-left: 12%;
	margin-right: 12%; */
	border: 1px solid #999999;
	text-align: justify;
}

h2 {
	float: inherit;
}

h3 {
	color: #778899;
}

div {
	border: 1px solid #999999;
}

#text {
	
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

.Id1 {
	float: left;
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
}

#gender1_few {
	margin-left: 153px;
}

#name_hiden1 {
	
}

#name_hiden2 {
	display: none;
}
.tel_label1{
position: fixed;
top: 465px;
left: 160px;
}
.pw_label {
	float: left;
	position: static;
}

.pw_label1 {
	float: left;
	margin-left: 33px;
}
.pw_tel1{
height: 80px;
}
.pw_tel3 {
	margin-left: 342px;
}
.pw_tel2{
margin-top: 20px;
margin-left: 115px;
position: absolute;
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
					<p class="Id1">아이디</p>
					<div class="userId2">
						<p class="Id">
							User 아이디 <span class="few" id="few_id">${clientVO.userID}아이디</span>
						</p>


					</div>
				</div>
				<div class="name">
					<div class="name1">
						<span id="name_gender">이름/성별</span>
						<form action="UserUpdate.do" name="form_name" id="form_name">
							<div class="name_gender1" id="name_hiden1">
								<span class="name">User 이름 <span class="few"
									id="name_few"><input type="text" name="username"
										value="${clientVO.userName}" /> <br />
										<button type="button" onclick="updateName();"
											style="margin-left: 235px;">완료</button>
										<button type="button" onclick="cancle()">취소</button> </span>
								</span>
							</div>
						</form>
						<div class="name_gender1" id="name_hiden2">
							<span class="name">User 이름 <span class="few" id="name_few">${clientVO.userName}
							</span> <span>
									<button type="button" onclick="updateName1()">수정</button>
							</span>
							</span>
						</div>

						<div class="gender">
							<form action="">
								<span class="Gender">성별 <span class="few"
									id="gender1_few"><input type="text" name="userGender"
										value="${clientVO.userGender}" /> <br /> </span>
									<button type="button" onclick="userGender()"
										style="margin-left: 340px;">완료</button>
									<button type="button" onclick="cancle1()">취소</button></span>
							</form>
							<span class="Gender">성별 <span class="few" id="gender1_few"><input
									type="text" name="userGender" value="${clientVO.userGender}" />
									<br /> </span>
								<button type="button" onclick="userGender1()"
									style="margin-left: 340px;">수정</button>
							</span>
						</div>
					</div>



				</div>
			</div>
			<div class="pw_tel">
				<div class="pw_tel1">
					<span class="pw_label">비밀번호/연락처</span>
					<div class="pw_tel2">
						<span class="pw_label1">비밀번호</span> <span class="tel_label1">연락처</span>
					</div>
					<div class="pw_tel3">
					<span class="few"><input type="text" value="${clientVO.userPW}"/> <br />
					<input type="button" id="pwbut" value="완료" onclick="pwUpdate()"/> <input type="button" value="취소" onclick="cancle2()" /></span> <br />
					<span class="few">${clientVO.userTel}연락처</span>
				</div>
				</div>
				
			</div>
			<div class="birth_address">
				<div class="birth_address_label">생년월일/주소</div>
				<div class="birth_address_label1">
					<span class="birth_label">생년월일</span> <span class="address_label">주소</span>
				</div>
				<div class="birth_address_few">
					<span class="few">${clientVO.userBirth}생일</span> <span class="few">${clientVO.userAddress}</span>
				</div>
			</div>
			<div id="cash">
				<div class="cash_label">
					<span class="cash_label1">캐쉬</span>
				</div>
				<div class="cash_label1">
					<span class="cash_few">캐쉬라벨</span>
				</div>
				<div class="cash_few1">
					<span class="few">캐쉬${clientVO.userCash}</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>