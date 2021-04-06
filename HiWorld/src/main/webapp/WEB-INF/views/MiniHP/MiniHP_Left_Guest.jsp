<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${resourcePath}/img${fontCss}"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#profile_info_ok").hide();
	displayInfo();
})

function displayInfo(){
	console.log('display info');
	
	$.ajax({
		type : 'GET',
		url : 'miniHp_getIntroInfo.do',
		data : { UserID : '${ownerVO.userID}'},
		
		success : function(result) {
			console.log('ajax success2');
			console.log(result);
			$("#infoTxt").html(result);
		}
	});
}

function moveToUser(){
	var OwnerID = $("#neighborSelect option:selected").val();
	console.log(OwnerID);
	
	var popupWidth = 880;
    var popupHeight = 580;
	var popupX = (window.screen.width/2)-(popupWidth/2);
    var popupY = (window.screen.height/2)-(popupHeight/2);
	window.open("miniHp_guestHome.do?OwnerID="+OwnerID,OwnerID,'status=no, scrollbars=no, menubar=no, toolbar=no, height='+popupHeight +',width='+popupWidth +',left='+popupX+',top='+popupY);
	parent.window.close();
} 

</script>
<style>
#profile_info {
	overflow-y: scroll; 
	width: 140px;  
	height: 100px;
	padding: 0px
}
#infoTxt{
	font-size:13px;
}
#info_bar{
	position: absolute; 
	top:250pt; 
	left:5pt;
}
#userName{
	font-size: 10pt; 
	position: absolute; 
	top: 270pt; 
	left: 5pt;
	color: #0f3073;
}
#userBirth{
	font-size: 7pt;
}
#neighborSelect{
	background-color: #9cbde7; 
	width:140px; 
	heigt:5px; 
	position: absolute; 
	top:300pt; 
	left:5pt;
}
#meBtn{
	position: absolute; 
	top:315pt; 
	left:20pt;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<body bgcolor="#FFFFFF">	
	<table border="0" width="130" bgcolor="#FFFFFF">
		<tr >
			<td bgcolor="#FFFFFF" align="center">
				<font><div id="profile_status"></div></font>
			</td>
		</tr>
		<tr >
			<td>
				<table bgcolor="#FFFFFF" width="130" cellpadding="1" cellspacing="1">
					<tr bgcolor="#FFFFFF">
						<td>
						<c:if test="${empty ownerintroVO.hpPicture}">
							<c:if test="${ownerVO.userGender eq 'M'}">
								<img id="profileImage" src="${pageContext.request.contextPath}/resources/images/admin/basic_man.jpg" width="128" height="128" border="0" alt=""/>
							</c:if>
							<c:if test="${ownerVO.userGender eq 'F'}">
								<img id="profileImage" src="${pageContext.request.contextPath}/resources/images/admin/basic_girl.jpg" width="128" height="128" border="0" alt=""/>
							</c:if>
						</c:if>
						<c:if test ="${!empty ownerintroVO.hpPicture}">
							<img id="profileImage" src="miniHp_getIntroPicture.do?UserID=${ownerVO.userID}" width="128" height="128" border="0" alt=""/>
						</c:if>
						</td>
					</tr>
					<tr bgcolor="#FFFFFF">
						<td>						
						</td>
					</tr>
				</table>
			</td>

		</tr>
		<tr>
			<td> 
				<!-- 미니홈피 소개글 -->
				
				<div id="profile_info">
					<span id="infoTxt"></span>
				</div>
				
				<img id="info_bar" src="${pageContext.request.contextPath}/resources/images/admin/bar.jpg" alt="" style="position: absolute; top:250pt; left:5pt;" />
				
				<!-- 미니홈피 주인 이름 -->
				<span id="userName"><b>${ownerVO.userName}</b>
				
				<!-- 성별에 따름 성별표시 마크 --> 
				<c:if test="${ownerVO.userGender eq 'M'}">
					<img src="${pageContext.request.contextPath}/resources/images/admin/male.jpg">
				</c:if>
				<c:if test="${ownerVO.userGender eq 'F'}">
					<img src="${pageContext.request.contextPath}/resources/images/admin/female.jpg">
				</c:if>
				
				<!-- 유저 생일 표시 -->
				<span id="userBirth">${ownerVO.userBirth}</span>
					<br/>
				<!-- 일촌 신청 버튼 -->
				<img src="${pageContext.request.contextPath}/resources/images/admin/member_btn.jpg" onclick="window.open('miniHp_neighborRegister.do?OwnerSerial=${ownerVO.userSerial}&OwnerName=${ownerVO.userName}','${ownerVO.userID}memberCall','width=312,height=380,location=no,status=no,scrollbars=no')" />
				</span>
				
				<select id="neighborSelect" onchange="moveToUser()">
					<option value="">★이웃 바람타기</option>
					<!-- 일촌 목록 -->
					<c:if test="${neighborList.size() != 0}">
						<c:forEach var="neighborList" items="${neighborList}">
							<option value="${neighborList.neighborSerial}">${neighborList.neighborName} (${neighborList.neighborValue})</option>
						</c:forEach>
					</c:if>
					<c:if test="${neighborList.size() == 0}">
						<option value="">이웃이 없습니다</option>
					</c:if>
				</select>
				
				<!-- 내 미니홈피로 이동 -->
				<img id="meBtn" src="${pageContext.request.contextPath}/resources/images/admin/meBtn.jpg" onclick="window.open('MiniHP_Home.do','${sessionVO.userID}','width=1090,height=600,location=no,status=no,scrollbars=no')"/>
			</td>
		</tr>
	</table>	
</body>
</html>