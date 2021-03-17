<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${resourcePath }/img${fontCss}"/>
<link rel="stylesheet" href="${resourcePath }/img${fontCss}"/>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
body
{scrollbar-face-color: #FFFFFF;
 scrollbar-highlight-color: #DBDBDB;
 scrollbar-3dlight-color: #FFFFFF;
 scrollbar-shadow-color: #9C92FF;
 scrollbar-darkshadow-color: #FFFFFF;
 scrollbar-track-color: #FFFFFF;
 scrollbar-arrow-color: #9C92FF}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">


$(function(){
	url = "<%=cp%>/cy/setting/rightMenu.action";
	$.post(url,{menu:"${menu}"},function(args){
		$("#rightMenu").html(args); 
	});  
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
							<font><span style="font-size:8pt;">today <font color="red">${session.getToDay() }</font> | total ${session.getTotalDay() }</span></font>
						</td>
						<td align="center" height="40">
							<iframe frameborder="0" width="470" height="40" src="MiniHP_TopTitle.do"></iframe> 
						</td>
						<td></td>
					</tr>
					<tr>
						<td width="10"> </td>

						<td align="center" width="178" height="450" background="/root/resources/images/bg_left_rect.jpg">
							<!-- 왼쪽 내용 부분 ----------------------------------------------------------- -->
							<iframe frameborder="0" width="160" height="440" src="MiniHP_Left.do"></iframe> 
							<!-- ---------------------------------------------------------------------------- -->

						</td>
						<td align="center" width="480" height="450" background="/root/resources/images/bg_center_rect.jpg">
							<!-- 오른쪽 내용 부분 ----------------------------------------------------------- -->
							<iframe frameborder="0" width="470" height="430" src="MiniHP_Right_Guest.do"></iframe> 
							<!-- ---------------------------------------------------------------------------- -->
						</td>
						<!-- 오른쪽 메뉴 부분 ----------------------------------------------------------- -->
						<td valign="top" style="padding-top: 20px;">
						<!-- Setting menu beginning -->
							<span id="rightMenu"></span>
							<div align="center" class="selected-Menu" onclick="javaScript:location.href='my_home.action?menu=menu1';">홈</div>
							<div align="center" class="selected-Menu" onclick="javaScript:location.href='my_profile.action?menu=menu2';">프로필</div>
							<div align="center" class="selected-Menu" onclick="javaScript:location.href='my_picture.action?menu=menu3';">사진첩</div>
							<div align="center" class="selected-Menu" onclick="javaScript:location.href='my_board.action?menu=menu4';">게시판</div>
							<div align="center" class="selected-Menu" onclick="javaScript:location.href='my_video.action?menu=menu5';">동영상</div>
							<div align="center" class="selected-Menu" onclick="javaScript:location.href='MiniHP_Guest.do?menu=menu6';">방명록</div>
							<div align="center" class="selected-Menu" onclick="javaScript:location.href='my_setting.action?menu=menu7';">관&nbsp;리</div>				
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