<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

function deleteNeighbor(neighborID){
	var flag = confirm("이웃을 끊겠습니까?");
	
	if(flag) {
		$.ajax({
			type : 'GET',
			url : 'miniHp_deleteNeighbor.do',
			data : { NeighborID : neighborID },
			
			success : function() {
				loacation.reload();
			}
		});
	}
}

function updateNeighbor(neighborID){
      var url    ="miniHp_updateNeighbor.do";
      var title  = "updateNeighbor";
      var status = 'width=312,height=380,location=no,status=no,scrollbars=no';
      
      window.open("",title,status);
      neighborSetting.target = title;                   
      neighborSetting.action = url;                   
      neighborSetting.method = "POST";
      neighborSetting.submit();     
}

</script>
</head>
<body>
<form name="neighborSetting">
	<h3>이웃 관리</h3>
	<table border="0" width="100%" align="center" cellpadding="0" cellspacing="0">
		<tr height="5px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
	</table>
	
	<div align ="left" valign="top" id="infoTxt" class="infoTxt">
		<c:if test="${listLength != 0}">
			<c:forEach var="neighborList" items="${neighborList}">
				<font style="margin-left: 10px;">나(${neighborList.userValue}) - <a href="#"><font color="blue">${neighborList.neighborName}</font></a>(${neighborList.neighborValue})</font>
				<input type="button" value="이웃명 변경" onclick="updateNeighbor('${neighborList.neighborID}')"/>&nbsp;<input type="button" value="이웃끊기" onclick="deleteNeighbor('${neighborList.neighborID}');"/><br/>
				<input type="hidden" name="userID" value="${neighborList.userID}">
				<input type="hidden" name="userName" value="${neighborList.userName}">
				<input type="hidden" name="userValue" value="${neighborList.userValue}">
				<input type="hidden" name="neighborID" value="${neighborList.neighborID}">
				<input type="hidden" name="neighborName" value="${neighborList.neighborName}">
				<input type="hidden" name="neighborValue" value="${neighborList.neighborValue}">
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