<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/userView.css?after">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
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
					<span class="few" id="few_id">${clientVO.userID}
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
				<c:choose>
					<c:when test="${clientVO.userGender == 'M'}">
						<div class="gender">
							<span class="Gender">성별 
								<span class="few" id="gender1_few">남성
								<br />
								</span>
							</span>
						</div>
					</c:when>
					<c:otherwise>
						<div class="gender">
							<span class="Gender">성별 
								<span class="few" id="gender1_few">여성
								<br />
								</span>
							</span>
						</div>
					</c:otherwise>
				</c:choose>		
					</div>
				</div>
			<div class="pw_tel_main">
				<span class="pw_label">비밀번호/연락처</span>
				<div id="pw_tel_body">
					<div class="pw_tel2">
						<span class="pw_label1">비밀번호
						</span>
						<div class="pw_few" id="pwhiden" style="display: none;">
							<span class="few" id="pw_text">
								<input type="password" name="userPW" class="Pwchc1" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" value="${clientVO.userPW}" />
								<span class="message"></span>
								<br />
								<input type="password" name="userPW1" class="Pwchc2" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" value="${clientVO.userPW}" />
								<br />
								<span class="message1"></span>
								<br />
								<input type="button" id="pwbut" style="margin-left: 50px; margin-top: 7px;" value="완료" onclick="pwUpdate()" />
								<input type="button" value="취소" onclick="cancle2()" />
							</span> 
							
								<br />
							
						</div>
						<div class="pw_few" id="hiden1">
							<span class="few" id="pw_text1">********
								<input type="button" id="pwbut" value="수정" onclick="pwUpdate1()" />
							</span> 
							<br />
						</div>
					</div>
					<div class="tel_tel1">
						<span class="tel_label1" id="Telhiden">연락처
						</span>
						<div class="Tel_few" id="hiden_tel" style="display: none;">
							<span class="few">
								<input type="text" name="userTel" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" value="${clientVO.userTel}" />
								<br />
								<span class="message2"></span>
								<br /> 
								<input type="button" id="telbut" style="margin-left: 50px; margin-top: 7px;" value="완료" onclick="telUpdate()" />
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
					<span class="few" id="Bfew" style="display: inline-block;">${clientVO.userBirth}
					</span>
					<br />
						<span class="few" id="address_few" style="display: inline-block;">
							<div class="address_hiden" style="display: none;">
								<input type="text" name="useraddress" style="position: absolute; bottom: 214px; right: 481px;" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" value="${clientVO.userAddress}"/>
								<br />
								<span class="message3" style="position: absolute;bottom: 195px; right: 500px;"></span>
								<br />
								<input type="button" id="telbut" style="margin-left: -1px; margin-top: 24px;" value="완료" onclick="addressUpdate()" />
								<input type="button" value="취소" onclick="cancle5()" />
							</div>
						</span>
						<span class="few" id="address_few" style="display: inline-block;">
							<div class="address_hiden1" >
								${clientVO.userAddress}
								<input type="button" id="telbut" value="수정" onclick="addressUpdate1()" />
							</div>
						</span>
					
				</div>
			</div>
			<div id="cash">
				<div class="cash_label">
					<span class="cash_label1" style="display: inline-block;">캐쉬
					</span>
					<span class="cash_few" style="display: inline-block;">보유 캐시
					</span>
					<span class="few"> ${clientVO.userCash}
					</span>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/client/userView.js">
 
</script>
</html>