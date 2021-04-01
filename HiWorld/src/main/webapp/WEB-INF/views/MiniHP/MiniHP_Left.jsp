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


function change_i(){
	var info = $("#infoTxt").val();
	$("#profile_info").hide();
	$("#profile_info_ok").show();
	$("#infoTxt_ok").val(info);
}

function change_i_ok(){
	$("#profile_info").show();
	$("#profile_info_ok").hide();
	var newInfo = $("#infoTxt_ok").val();
	console.log(newInfo);
	
	$.ajax({
		type : 'GET',
		url : 'miniHp_updateIntroInfo.do',
		data : { UserID : '${sessionVO.userID}', hpInfo : newInfo },
		
		success : function(result) {
			console.log('ajax success');
			displayInfo();
		},
		error : function(error) {
			console.log('수정에러');
		}
	})
}

function displayInfo(){
	console.log('display info');
	
	$.ajax({
		type : 'GET',
		url : 'miniHp_getIntroInfo.do',
		data : { UserID : '${sessionVO.userID}'},
		
		success : function(result) {
			console.log('ajax success2');
			console.log(result);
			$("#infoTxt").html(result);
		}
	});
}

/* function random(){
	sendRequest("random.action",null,sendRandom,"GET");
}

function sendRandom(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			var userId = httpRequest.responseText;
			window.open("user_main.action?userId="+userId,userId,"width=1090,height=600,location=no,status=no,scrollbars=no");
		}
	}
}
*/

function moveToUser() {
	
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
	padding :0px
}
#infoTxt{
	font-size:13px;
}
#info_editBtn{
	position: absolute; 
	top: 235pt; 
	left: 5pt;
}
#info_editOkBtn{
	position: absolute; 
	top: 235pt; 
	left: 5pt;
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
#randomBtn{
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
						<c:if test="${empty introVO.hpPicture}">
							<c:if test="${sessionVO.userGender eq 'M'}">
								<img id="profileImage" src="${pageContext.request.contextPath}/resources/images/admin/basic_man.jpg" width="128" height="128" border="0" alt=""/>
							</c:if>
							<c:if test="${sessionVO.userGender eq 'F'}">
								<img id="profileImage" src="${pageContext.request.contextPath}/resources/images/admin/basic_girl.jpg" width="128" height="128" border="0" alt=""/>
							</c:if>
						</c:if>
						<c:if test ="${!empty introVO.hpPicture}">
							<img id="profileImage" src="miniHp_getIntroPicture.do?UserID=${sessionVO.userID}" width="128" height="128" border="0" alt=""/>
						</c:if>
						</td>
					</tr>
					<tr bgcolor="#FFFFFF">
						<td>
							<img src="${pageContext.request.contextPath}/resources/images/admin/editBtn.jpg" onclick="window.open('miniHp_uploadIntroPicture.do','','width=400,height=200,location=no,status=no,scrollbars=no');">
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
					<img id="info_editBtn" src="${pageContext.request.contextPath}/resources/images/admin/editBtn.jpg" onclick="change_i();"/>
				</div>
				<div id="profile_info_ok">
					<textarea rows="7" cols="20" id="infoTxt_ok" style="font-size:8pt; resize: none;"></textarea>
					<img id="info_editOkBtn" src="${pageContext.request.contextPath}/resources/images/admin/editOkBtn.jpg" onclick="change_i_ok();"/>
				</div>
				<img id="info_bar" src="${pageContext.request.contextPath}/resources/images/admin/bar.jpg" alt=""/>

				
				<!-- 미니홈피 주인 이름 -->
				<span id="userName" style=""><b>${sessionVO.userName}</b>
				
				<!-- 성별에 따름 성별표시 마크 --> 
				<c:if test="${sessionVO.userGender eq 'M'}">
					<img src="${pageContext.request.contextPath}/resources/images/admin/male.jpg">
				</c:if>
				<c:if test="${sessionVO.userGender eq 'F'}">
					<img src="${pageContext.request.contextPath}/resources/images/admin/female.jpg">
				</c:if>
				
				<!-- 유저 생일 표시 -->
				<span id="userBirth">${sessionVO.userBirth}</span>
					<br/>
					<img src="${pageContext.request.contextPath}/resources/images/admin/member_check_btn.jpg" onclick="window.open('miniHp_neighborRegisterList.do','${sessionVO.userID}memberCheck','width=312,height=380,location=no,status=no,scrollbars=no');" />
				</span>
				
				<select id="neighborSelect" onchange="moveToUser()">
					<option value="">★이웃 바람타기</option>
					<!-- 이웃 목록 -->
					<c:if test="${listLength != 0}">
						<c:forEach var="neighborList" items="${neighborList}">
							<option value="${neighborList.neighborID}">${neighborList.neighborName} (${neighborList.neighborValue})</option>
						</c:forEach>
					</c:if>
					<c:if test="${listLength == 0}">
						<option value="">이웃이 없습니다</option>
					</c:if>
				</select>
				<img id="randomBtn" src="${pageContext.request.contextPath}/resources/images/admin/randomBtn.jpg" onclick="random()"/>
			</td>
		</tr>
	</table>	
</body>
</html>