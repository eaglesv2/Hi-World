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
var ajaxData = $("form[name=neighborRegisterCheck]").seiralize();
function neighborRegister_ok(){
	
	$.ajax({
		type : 'POST',
		url : 'miniHp_neighborRegisterCheck_ok.do?type=1',
		data : ajaxData,
		
		success : function(result) {
			window.close();
		}
	});
	
}
function neighborRegister_next(){
	
	$.ajax({
		type : 'POST',
		url : 'miniHp_neighborRegisterCheck_ok.do?type=2',
		data : ajaxData,
		
		success : function(result) {
			window.close();
		}
	});
}
function neighborRegister_no(){
	
	$.ajax({
		type : 'POST',
		url : 'miniHp_neighborRegisterCheck_ok.do?type=0',
		data : ajaxData,
		
		success : function(result) {
			window.close();
		}
	});
}
</script>
 <body background="${pageContext.request.contextPath}/resources/imgages/admin/member_check.png">
	<form action="" name="neighborRegistorCheck" method="post">
		<span style="position: absolute; top:87px; left:85px; font-size: 9pt">
			<a href="" onclick=""><font color="Blue">${neighborListVO.senderName}</font></a>
		</span>
		
		<img alt="미니미" src="${resoucePath}/img/${minimiPath}" style="position: absolute; top:105px; left:30px;" width="98px" height="98">
		
		<span style="position: absolute; top:134px; left:138px; font-size:9pt;">
			<font color="Blue">${neighborListVO.senderName}</font>님께서 
			<font color="Blue">${neighborListVO.receiverName}</font>님과
		</span>
		
		<span style="position: absolute; top:155px; left:138px; font-size:9pt;">
			<font color="black"><b>이웃맺기</b></font>를 희망합니다.
		</span>
		
		<textarea rows="5" cols="46" style="position: absolute; top:210px; left:36px; width: 290px; height: 70px; font-size:9pt;" readonly="readonly">${neighborListVO.userMessage}</textarea>
		
		<span style="position: absolute; top:310px; left:34px; font-size:9pt;">
			<font color="blue">${neighborListVO.senderName}</font>(${neighborListVO.senderValue}) - <font color="blue">${neighborListVO.receiverName}</font>(${neighborListVO.receiverValue})
		</span>
		
		<span style="position: absolute; top:420px; left:115px; font-size:8pt;">
			<img alt="" src="${pageContext.request.contextPath}/resources/images/admin/yesBtn.jpg" onclick="neighborRegistor_ok();"/>
		</span>
		
		<span style="position: absolute; top:420px; left:155px; font-size:8pt;">
			<img alt="" src="${pageContext.request.contextPath}/resources/images/admin/nextBtn.jpg" onclick="neighborRegistor_next();"/>
		</span>
		
		<span style="position: absolute; top:420px; left:205px; font-size:8pt;">
			<img alt="" src="${pageContext.request.contextPath}/resources/images/admin/noBtn.jpg" onclick="neighborRegistor_no();"/>
		</span>	
		
		<input type="hidden" name="neighborID1" value="${neighborListVO.senderID}">
		<input type="hidden" name="neighborName1" value="${neighborListVO.senderName}">
		<input type="hidden" name="neighborValue1" value="${neighborListVO.senderValue}">
		<input type="hidden" name="neighborID2" value="${neighborListVO.receiverID}">
		<input type="hidden" name="neighborName2" value="${neighborListVO.receiverName}">
		<input type="hidden" name="neighborValue2" value="${neighborListVO.receiverValue}">
	</form>
 </body>
</html>