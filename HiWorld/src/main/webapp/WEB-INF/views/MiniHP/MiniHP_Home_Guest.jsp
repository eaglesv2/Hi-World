<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${resourcePath}/img${fontCss}"/>
<meta charset="UTF-8">
<title>Hi-World</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/Favicon.png" type="image/x-icon">
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/Favicon.png" type="image/x-icon">
<style type="text/css">
body {
	scrollbar-face-color: #FFFFFF;
	scrollbar-highlight-color: #DBDBDB;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: #9C92FF;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #9C92FF
}
@font-face {
	font-family: 'BMHANNAPro';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.0/BMHANNAPro.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}
@font-face {
    font-family: 'SDSamliphopangche_Outline';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Outline.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body{
	font-family:'SDSamliphopangche_Outline';
	font-weight: 0;
	margin-left: 35px;
}
button{
	font-family:'SDSamliphopangche_Outline';
}
input{
	font-family:'BMHANNAPro';
}
textarea{
	font-family:'BMHANNAPro';
}
.secondFont{
	font-family:'BMHANNAPro';
}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//배경화면 설정
	var skin = $("#skin").val();
	$("body").css({"background":"url("+skin+")"});
	
	console.log('1');
	/* $.ajax({
		type : 'GET',
		url: 'miniHp_todayCheck.do',
		data : { OwnerID : '${OwnerID}', GuestID : '${sessionVO.userID}'},
		
		success : function() {
			console.log('방문자체크 성공')
		}
	}); */
	
	console.log('2222');
	$.ajax({
		type : 'GET',
		url : 'miniHp_rightGuestMenu.do',
		data : { OwnerSerial : '${OwnerSerial}'},
		
		success : function(result) {
			$("#rightMenu").html(result);
		}
	});
	//right 불러오기
	$.ajax({
		type : 'GET',
		url : 'miniHp_rightGuest.do?OwnerSerial=${OwnerSerial}',
		success : function(result) {
			$("#bodyContents").html(result);
		}
	})
});
</script>
 </head>
<body topmargin="0" leftmargin="0">
<input type="hidden" id="skin" value="${skin}">
<form name="guestHome">
	<table border="0" align="left" valign="top" width="850" height="550" cellspacing="0" cellpadding="0">
		<tr>
			<td>
				<table border="0" align="left" width="800" height="510">
					<tr>
						<td colspan="2" align="center">
							<br>
							<font><span style="font-size:8pt;">today <font color="red">${ownerintroVO.hpToday}</font> | total ${ownerintroVO.hpTotal}</span></font>
						</td>
						<td align="center" height="40">
							<iframe frameborder="0" width="470" height="40" src="miniHp_topGuest.do?OwnerSerial=${OwnerSerial}"></iframe> 
						</td>
						<td></td>
					</tr>
					<tr>
						<td width="10"> </td>

						<td align="center" width="178" height="448" background="${pageContext.request.contextPath}/resources/images/bg_left_rect.jpg">
							<!-- 왼쪽 내용 부분 ----------------------------------------------------------- -->
							<span id="sideContents">
								<iframe frameborder="0" width="160" height="440" src="miniHp_leftGuest.do?OwnerSerial=${OwnerSerial}"></iframe> 
							</span>
							<!-- ---------------------------------------------------------------------------- -->

						</td>
						<td align="center" width="476" height="448" background="${pageContext.request.contextPath}/resources/images/bg_center_rect.jpg">
							<!-- 오른쪽 내용 부분 ----------------------------------------------------------- -->
							<span id="bodyContents">
								<%-- <iframe frameborder="0" width="470" height="430" src="miniHp_rightGuest.do?OwnerID=${OwnerID}"></iframe> --%> 
							</span>
							<!-- ---------------------------------------------------------------------------- -->
						</td>
						<!-- 오른쪽 메뉴 부분 ----------------------------------------------------------- -->
						<td valign="top" style="padding-top: 20px;">
						<!-- Setting menu beginning -->
							<span id="rightMenu"></span>
									
						<!-- Setting menu ending -->	
						</td>
						<!-- 오른쪽 메뉴 부분 ----------------------------------------------------------- -->
					</tr>

					<tr>
						<td ></td>
					</tr>
				</table>
				<!-- ------------------------ -->
			</td>
		</tr>
	</table>
	<!-- ------------------------ -->
</form>
</body>
</html>