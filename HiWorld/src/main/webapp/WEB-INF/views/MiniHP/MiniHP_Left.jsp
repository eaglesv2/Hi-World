<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${resourcePath}/img${fontCss}"/>
<link rel="stylesheet" href="${resourcePath}/img${fontCss}"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#profile_info_ok").hide();
	displayInfo();
});


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

/* function displayProfile(){
	console.log('display profile');
	
	var xhr= new XMLHttpRequest();
	var UserID = '${sessionVO.userID}';
	console.log(UserID);
	xhr.onreadystatechange = function() {
		if(xhr.readyState === xhr.DONE) {
			if(xhr.status === 200) {
				console.log(xhr.response, typeof xhr.response);
				document.getElementById("profileImage").src = xhr.responsetText;
			}	
		}
	};
	xhr.open('GET','miniHp_getIntroPicture.do?UserID='+UserID);
	xhr.responseType = 'text';
	xhr.send(null); */
	
	/* $.ajax({
		type : 'POST',
		url : 'miniHp_getIntroPicture.do',
		data : { UserID : '${sessionVO.userID}'},
	
		success : function(result) {
			console.log('image ajax success');
			console.log(result);
			$("#profileImage").attr("src",result);
		}
	}) 
}*/ //file은 ajax로 안불러와짐;;;;;;;;;;;;;;;;;;

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
	})
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

function moveToUser(){
	var userId = document.getElementById("mySelect").value;
	if(userId == "") return;
	document.getElementById("mySelect")[0].selected;
	window.open("user_main.action?userId="+userId,userId,"width=1090,height=600,location=no,status=no,scrollbars=no");
} */

</script>
<style type="text/css">
</style>
<style>

#profile_info {
overflow-y:scroll; 
width:140px;  
height:100px;
 padding:0px
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
				<font>
					<div id="profile_info">
						<span id="infoTxt" style="font-size:13px;"></span>
						<img src="${pageContext.request.contextPath}/resources/images/admin/editBtn.jpg" style="position: absolute; top:235pt; left:5pt;"onclick="change_i();"/>
					</div>
					<div id="profile_info_ok">
						<textarea rows="7" cols="20" id="infoTxt_ok" style="font-size:8pt; resize: none;"></textarea>
						<img src="${pageContext.request.contextPath}/resources/images/admin/editOkBtn.jpg" style="position: absolute; top:235pt; left:5pt;"onclick="change_i_ok();"/>
					</div>
					<img src="${pageContext.request.contextPath}/resources/images/admin/bar.jpg" alt="" style="position: absolute; top:250pt; left:5pt;" />
				</font>
				<font style="font-size:10pt; position: absolute; top:270pt; left:5pt;" color="#0f3073"><b>${sessionVO.userName}</b>
				
				<!-- 성별에 따름 성별표시 마크 --> 
				<c:if test="${sessionVO.userGender eq 'M'}">
					<img src="${pageContext.request.contextPath}/resources/images/admin/male.jpg">
				</c:if>
				<c:if test="${sessionVO.userGender eq 'F'}">
					<img src="${pageContext.request.contextPath}/resources/images/admin/female.jpg">
				</c:if>
				<!-- 유저 생일 표시 -->
				<font style="font-size: 7pt;">${sessionVO.userBirth}</font>
					<br/>
					<img src="${pageContext.request.contextPath}/resources/images/admin/member_check_btn.jpg" <%-- onclick="window.open('my_member_list.action','${sessionVO.userID}memberCheck','width=312,height=380,location=no,status=no,scrollbars=no');" --%>/>
				</font>
				<select id="mySelect" style="background-color: #9cbde7; width:140px; heigt:5px; position: absolute; top:300pt; left:5pt;" onchange="moveToUser();">
					<option value="">★이웃 바람타기</option>
					<!-- 일촌 목록 -->
					<%-- <c:if test="${length != 0}">
					<c:forEach var="i" begin="0" end="${length-1}" step="1">
						<option value="${userId[i]}">${userName[i]} (${userValue[i]})</option>
					</c:forEach>
					</c:if> --%>
				</select>
				<img src="${pageContext.request.contextPath}/resources/images/admin/randomBtn.jpg" style="position: absolute; top:315pt; left:20pt;" onclick="random();"/>
			</td>
		</tr>
	</table>	
 </body>
</html>