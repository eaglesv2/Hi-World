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
<meta charset="UTF-8">
<title>Insert title here</title>

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
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
//넘어올때 로그인한 유저 vo와 미니홈피 주인 id + miniHp VO 다 가져오기
$(document).ready(function() {
	console.log('1');
	$.ajax({
		type : 'post',
		url : 'miniHp_rightGuestMenu.do',
		data : { UserID : '${sessionVO.userID}', OwnerID : '${OwnerID}'},
		
		success : function(result) {
			$("#rightMenu").html(result);
		}
	})
});
</script>
 </head>

<form name="main">

<body topmargin="0" leftmargin="0">
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
							<iframe frameborder="0" width="470" height="40" src="miniHp_topGuest.do"></iframe> 
						</td>
						<td></td>
					</tr>
					<tr>
						<td width="10"> </td>

						<td align="center" width="178" height="450" background="${pageContext.request.contextPath}/resources/images/bg_left_rect.jpg">
							<!-- 왼쪽 내용 부분 ----------------------------------------------------------- -->
							<iframe frameborder="0" width="160" height="440" src="miniHp_leftGuest.do"></iframe> 
							<!-- ---------------------------------------------------------------------------- -->

						</td>
						<td align="center" width="480" height="450" background="${pageContext.request.contextPath}/resources/images/bg_center_rect.jpg">
							<!-- 오른쪽 내용 부분 ----------------------------------------------------------- -->
							<iframe frameborder="0" width="470" height="430" src="miniHp_rightGuest.do"></iframe> 
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
 </body>

 </form>
</html>