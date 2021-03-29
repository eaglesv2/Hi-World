<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="${resourcePath}/img${fontCss}"/><link rel="stylesheet" href="${resourcePath }/img${fontCss}"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">

function registerSend(){
	
	var ajaxData = $("form[name=neighborRegisterForm]").serialize();
	
	$.ajax({
		type : 'POST',
		url : 'miniHp_NeighborRegister_ok.do',
		data : ajaxData,
		
		success : function(result) {
			window.close();
		},
		
		error : function(error) {
			alert("다시 한 번 시도해주세요");
		}
	});
}
</script>
 <body background="${resoucePath}/imgages/admin/member_call.jpg">
	<form action="" name="neighborRegisterForm" method="post">
		<span style="position: absolute; top:35px; left:80px;"><font color="Blue">${senderName}</font></span>
			<img alt="상대방의 미니미" src="${resoucePath}/img/${minimiPath}" style="position: absolute; top:65px; left:30px;" width="98px" height="98">
		<span style="position: absolute; top:104px; left:138px; font-size:8pt;">
			<font color="Blue">${receiverName}</font>님께 이웃을 신청합니다.
		</span>
		<span style="position: absolute; top:163px; left:30px; font-size:8pt;">
			<font color="Blue">${receiverName}</font>님을 <font color="Blue">${senderName}</font>님의 <input type="text" style="width:50px; height:10px;" name="receiverValue"/>으로
		</span>
		<span style="position: absolute; top:185px; left:30px; font-size:8pt;">
			<font color="Blue">${senderName}</font>님을 <font color="Blue">${receiverName}</font>님의 <input type="text" style="width:50px; height:10px;" name="senderValue"/>으로
		</span>
		<span style="position: absolute; top:255px; left:30px; font-size:8pt;">
			<textarea rows="3" cols="32" style="width: 240px; height: 40px;" name="userMessege"></textarea>
		</span>
		<span style="position: absolute; top:329px; left:95px; font-size:8pt;" >
			<img alt="" src="${resoucePath}/imgages/admin/sendBtn.jpg" onclick="registerSend();"/>
		</span>
		<span style="position: absolute; top:330px; left:158px; font-size:8pt;" >
			<img alt="" src="${resoucePath}/imgages/admin/cancelBtn.jpg" onclick="window.close();"/>
		</span>
		<input type="hidden" name="senderID" value="${sessionVO.userID}">
		<input type="hidden" name="senderName" value="${senderName}">
		<input type="hidden" name="receiverID" value="${ownerVO.userID}">
		<input type="hidden" name="receiverName" value="${receiverName}">
	</form>
 </body>
</html>