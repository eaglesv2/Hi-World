<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
$(document).ready(function() {
	console.log('1');
	$.ajax({
		type : 'post',
		url : 'miniHp_rightMenu.do',
		data : { menu : '${menu}'},
		
		success : function(result) {
			$("#rightMenu").html(result);
		}
	})
});

/* $(function(){
	url = 'miniHp_rightMenu.do';
	$.post(url,{menu:'${menu}'},function(result){
		$("#rightMenu").html(result);
	})
}); */
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

						<td align="center" width="178" height="450" background="${pageContext.request.contextPath}/resources/images/bg_left_rect.jpg">

							<!-- 왼쪽 내용 부분 ----------------------------------------------------------- -->
							<span id="sideContents">
								<iframe frameborder="0" width="160" height="440" src="MiniHP_Left.do"></iframe> 
							</span>
							<!-- ---------------------------------------------------------------------------- -->

						</td>
						<td align="center" width="480" height="450" background="${pageContext.request.contextPath}/resources/images/bg_center_rect.jpg">
										
							<!-- 오른쪽 내용 부분 ----------------------------------------------------------- -->
							<span id="bodyContents">
								<iframe frameborder="0" width="470" height="430" src="MiniHP_Right.do"></iframe> 
							</span>
							<!-- ---------------------------------------------------------------------------- -->
							
						</td>
						<!-- 오른쪽 메뉴 부분 이걸 for문 돌려서 메뉴 선택한거 다보여주게 하기 ---------------------------------------------- -->
						<td valign="top" style="padding-top: 20px;">
						<!-- Setting menu beginning -->
							<span id="rightMenu">
							</span>
							<!-- 
							<div align="center" class="selected-Menu" onclick="javaScript:location.href='MiniHP_Home.do?menu=menu1';">홈</div>
							<div align="center" class="selected-Menu" onclick="movePage('miniHpProfile.do?menu=menu2')">프로필</div>
							<div align="center" class="selected-Menu" onclick="movePicture('miniHpPicture.do?menu=menu3')">사진첩</div>
							<div align="center" class="selected-Menu" onclick="moveBoard()">게시판</div>
							<div align="center" class="selected-Menu" onclick="movePage('miniHpVideo.do?menu=menu5')">동영상</div>
							<div align="center" class="selected-Menu" onclick="movePage('miniHpGuest.do?menu=menu6')">방명록</div>
							<div align="center" class="selected-Menu" onclick="javaScript:location.href='miniHpSetting.do?menu=menu7';">관&nbsp;리</div>
							 -->
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
<!-- ajax -->
<script>
 	
 /*    function movePage(url){
        // ajax option
        var ajaxOption = {
                url : url,
                async : true,
                type : "GET",
                dataType : "html",
                cache : false
        };
        
        $.ajax(ajaxOption).done(function(data){
            // Contents 영역 삭제
            $('#bodyContents').children().remove();
            // Contents 영역 교체
            $('#bodyContents').html(data);
        });
    } */
 
</script>
<script src="resources/js/miniHP/ajaxMovePage.js?ver=2"></script>
</html>