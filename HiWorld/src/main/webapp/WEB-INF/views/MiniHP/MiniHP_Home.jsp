<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hi-World</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/Favicon.png" type="image/x-icon">
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/Favicon.png" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
</script>

<style type="text/css">
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
background-image: url("resources/images/basic.jpg");
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
/* body
{
 scrollbar-face-color: #000000;
 scrollbar-highlight-color: #DBDBDB;
 scrollbar-3dlight-color: #FFFFFF;
 scrollbar-shadow-color: #9C92FF;
 scrollbar-darkshadow-color: #FFFFFF;
 scrollbar-track-color: #FFFFFF;
 scrollbar-arrow-color: #9C92FF
 } */
</style>

<script type="text/javascript">
$(document).ready(function() {
	console.log('1');
	$.ajax({
		type : 'post',
		url : 'miniHp_rightMenu.do',
		
		success : function(result) {
			$("#rightMenu").html(result);
		}
	})
	//right 불러오기
	$.ajax({
		type : 'get',
		url : 'MiniHP_Right.do',
		success : function(result) {
			$("#bodyContents").html(result);
		}
	})
});
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
							<font><span style="font-size:8pt;">today <font color="red">${introVO.hpToday}</font> | total ${introVO.hpTotal}</span></font>
						</td>
						<td height="40">
							<!-- 미니 홈피 제목 -->
							<iframe frameborder="0" width="470" height="40" src="MiniHP_TopTitle.do"></iframe> 
						</td>
						<td></td>
					</tr>
					<tr>
						<td width="10"> </td>

						<td align="center" width="178" height="448" background="${pageContext.request.contextPath}/resources/images/bg_left_rect.jpg">

							<!-- 왼쪽 내용 부분 ----------------------------------------------------------- -->
							<span id="sideContents">
								<iframe name="left" frameborder="0" width="160" height="440" src="MiniHP_Left.do"></iframe> 
							</span>
							<!-- ---------------------------------------------------------------------------- -->

						</td>
						<td align="center" width="476" height="448" background="${pageContext.request.contextPath}/resources/images/bg_center_rect.jpg">
										
							<!-- 오른쪽 내용 부분 ----------------------------------------------------------- -->
							<span id="bodyContents">
								<!-- <iframe frameborder="0" width="100%" height="100%" src="MiniHP_Right.do"></iframe> -->
							</span>
							<!-- ---------------------------------------------------------------------------- -->
							
						</td>
						<!-- 오른쪽 메뉴 부분 이걸 for문 돌려서 메뉴 선택한거 다보여주게 하기 ---------------------------------------------- -->
						<td valign="top" style="padding-top: 20px; bor">
						<!-- Setting menu beginning -->
							<span id="rightMenu">
							</span>
						
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