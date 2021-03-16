<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

</script>

<style type="text/css">
body
{
 scrollbar-face-color: #000000;
 scrollbar-highlight-color: #DBDBDB;
 scrollbar-3dlight-color: #FFFFFF;
 scrollbar-shadow-color: #9C92FF;
 scrollbar-darkshadow-color: #FFFFFF;
 scrollbar-track-color: #FFFFFF;
 scrollbar-arrow-color: #9C92FF
 }
 
.selected-Menu{
	border: 1px solid;
	border-left: 0px;
	background-color: white;
	width: 60px;
	height: 22px;
	padding-top: 6px;
	margin-bottom: 3px;
	border-top-right-radius: 6px;
	border-bottom-right-radius: 6px;
	font-size: 9pt;
	user-select:none;
}
</style>

<script type="text/javascript">
<%-- 
$(function(){
	url = "<%=cp%>/cy/setting/rightMenu.action";
	$.post(url,{menu:"${menu}"},function(args){
		$("#rightMenu").html(args); 
	});  
});
 --%>
</script>

</head>
<body>
	<table border="0" align="left" valign="top" width="850" height="550" cellspacing="0" cellpadding="0">
		<tr>
			<td>
				<table border="0" align="left" width="800" height="510">
					<tr>
						<td colspan="2" align="center">
							<br>
							<!-- 투데이 + 전체 방문자 수 -->
							<font><span style="font-size:8pt;">today <font color="red">1</font> | total 1</span></font>
						</td>
						<td height="40">
							<!-- 미니 홈피 제목 -->
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
							<iframe frameborder="0" width="470" height="430" src="MiniHP_Right.do"></iframe> 
							<!-- ---------------------------------------------------------------------------- -->
							
						</td>
						<!-- 오른쪽 메뉴 부분 이걸 for문 돌려서 메뉴 선택한거 다보여주게 하기 ---------------------------------------------- -->
						<td valign="top" style="padding-top: 20px;">
						<!-- Setting menu beginning -->
							<span id="rightMenu">
							</span>
							<div align="center" class="selected-Menu" onclick="javaScript:location.href='my_home.action?menu=menu1';">홈</div>
							<div align="center" class="selected-Menu" onclick="javaScript:location.href='my_profile.action?menu=menu2';">프로필</div>
							<div align="center" class="selected-Menu" onclick="javaScript:location.href='my_picture.action?menu=menu3';">사진첩</div>
							<div align="center" class="selected-Menu" onclick="javaScript:location.href='my_board.action?menu=menu4';">게시판</div>
							<div align="center" class="selected-Menu" onclick="javaScript:location.href='my_video.action?menu=menu5';">동영상</div>
							<div align="center" class="selected-Menu" onclick="javaScript:location.href='my_guest.action?menu=menu6';">방명록</div>
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
</body>
</html>