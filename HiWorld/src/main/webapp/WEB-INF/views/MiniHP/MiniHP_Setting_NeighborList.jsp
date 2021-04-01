<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${resourcePath}/img${fontCss}"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a:link {text-decoration: none; color: black;}
a:visited {text-decoration: none; color: black;}
a:active {text-decoration: none; color: grey;}
a:hover {text-decoration: underline; color: red;}
 	
 input[type="radio"] {
  margin-top: -1px;
  vertical-align: middle;
}
 	
body{
	align-items:top;
	 scrollbar-face-color: #FFFFFF;
	 scrollbar-highlight-color: #DBDBDB;
	 scrollbar-3dlight-color: #FFFFFF;
	 scrollbar-shadow-color: #9C92FF;
	 scrollbar-darkshadow-color: #FFFFFF;
	 scrollbar-track-color: #FFFFFF;
	 scrollbar-arrow-color: #9C92FF
}
</style>
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
var str_i ="";
/* 
$(document).ready(function(){
	sendRequest("/cy/setting/getMemberList.action",null,displayInfo,"GET");
});

function displayInfo(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			str_i = httpRequest.responseText;
			var infoTxt = document.getElementById("infoTxt");
			infoTxt.innerHTML = str_i;	
		}
	}
}

function deleteMember(userId){
	var flag = confirm("일촌을 끊겠습니까?");
	if(flag) {
		var params = "userId="+userId;
		sendRequest("/cy/setting/deleteMemberList.action",params,displayInfo,"GET");
	}
}

function updateMember(userId){
    window.open('my_member_update.action?userId='+userId,'${userId }memberCall','width=312,height=380,location=no,status=no,scrollbars=no');
}
 */
</script>
</head>
<body>
<form name="myForm">
	<h3>일촌 관리</h3>
	<table border="0" width="100%" align="center" cellpadding="0" cellspacing="0">
		<tr height="5px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
	</table>
	
	<div align ="left" valign="top" id="infoTxt" class="infoTxt">
		<c:if test="${listLength != 0}">
			<c:forEach var="neighborList" items="${neighborList}">
				<font style="margin-left: 10px;">나(${memberValue[i] }) - <a href="#"><font color="blue">${neighborList.userName}</font></a>(${neighborList.userValue})</font>
			</c:forEach>
		</c:if>
		<c:if test="${listLength == 0}">
			<option value="">이웃이 없습니다</option>
		</c:if>
	</div>
	<table border="0" width="100%" align="center" cellpadding="0" cellspacing="0">
		<tr height="5px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
	</table>
</form>
</body>
</html>