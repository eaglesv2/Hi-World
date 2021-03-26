<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link rel="stylesheet" href="${resourcePath}/img${fontCss}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.unselected-Menu{
	border: 1px solid;
	border-left: 0px;
	width: 60px;
	height: 22px;
	padding-top: 6px;
	margin-bottom: 3px;
	border-top-right-radius: 6px;
	border-bottom-right-radius: 6px;
	font-size: 9pt;
	user-select:none;
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.unselected-Menu').css('background-color', '#${miniHpUserMenuVO.menuBGColor}');
	$('.unselected-Menu').css('color', '#${miniHpUserMenuVO.menuFontColor}');
	$('.unselected-Menu').css('border-color', '#${miniHpUserMenuVO.menuBorderColor}');
	$('.selected-Menu').css('color', '#${miniHpUserMenuVO.menuFontColor}');
	$('.selected-Menu').css('border-color', '#${miniHpUserMenuVO.menuBorderColor}');
});
/* ajax */
function movePage(url){
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
}
 
</script>
<script src="resources/js/miniHP/ajaxMovePage.js?ver=7"></script>
<title>Insert title here</title>
</head>
<body>
	<c:if test="${miniHpUserMenuVO.menu1==1}">
		<c:if test="${menu=='menu1'}">
			<div align="center" class="selected-Menu" onclick="javaScript:location.href='MiniHP_Home.do?menu=menu1';">홈</div>
		</c:if>
		<c:if test="${menu!='menu1'}">
			<div align="center" class="unselected-Menu" onclick="javaScript:location.href='MiniHP_Home.do?menu=menu1';">홈</div>
		</c:if>
	</c:if>
	
	<c:if test="${miniHpUserMenuVO.menu2==1}">
		<c:if test="${menu=='menu2'}">
			<div align="center" class="selected-Menu" onclick="moveProfile()">프로필</div>
		</c:if>
		<c:if test="${menu!='menu2'}">
			<div align="center" class="unselected-Menu" onclick="moveProfile()">프로필</div>
		</c:if>
	</c:if>
	
	<c:if test="${miniHpUserMenuVO.menu3==1}">
		<c:if test="${menu=='menu3'}">
			<div align="center" class="selected-Menu" onclick="movePicture('miniHpPicture.do?menu=menu3')">사진첩</div>
		</c:if>
		<c:if test="${menu!='menu3'}">
			<div align="center" class="unselected-Menu" onclick="movePicture('miniHpPicture.do?menu=menu3')">사진첩</div>
		</c:if>
	</c:if>
	
	<c:if test="${miniHpUserMenuVO.menu4==1}">
		<c:if test="${menu=='menu4'}">
			<div align="center" class="selected-Menu" onclick="moveBoard()">게시판</div>
		</c:if>
		<c:if test="${menu!='menu4'}">
			<div align="center" class="unselected-Menu" onclick="moveBoard()">게시판</div>
		</c:if>
	</c:if>
	
	<c:if test="${miniHpUserMenuVO.menu5==1}">
		<c:if test="${menu=='menu5'}">
			<div align="center" class="selected-Menu" onclick="movePage('miniHpVideo.do?menu=menu5')">동영상</div>
		</c:if>
		<c:if test="${menu!='menu5'}">
			<div align="center" class="unselected-Menu" onclick="movePage('miniHpVideo.do?menu=menu5')">동영상</div>
		</c:if>
	</c:if>
	
	<c:if test="${miniHpUserMenuVO.menu6==1}">
		<c:if test="${menu=='menu6'}">
			<div align="center" class="selected-Menu" onclick="movePage('miniHpGuest.do?menu=menu6')">방명록</div>
		</c:if>
		<c:if test="${menu!='menu6'}">
			<div align="center" class="unselected-Menu" onclick="movePage('miniHpGuest.do?menu=menu6')">방명록</div>
		</c:if>
	</c:if>
	
	<c:if test="${miniHpUserMenuVO.menu7==1}">
		<c:if test="${menu=='menu7'}">
			<div align="center" class="selected-Menu" onclick="moveSetting()">관&nbsp;리</div>
		</c:if>
		<c:if test="${menu!='menu7'}">
			<div align="center" class="unselected-Menu" onclick="moveSetting()">관&nbsp;리</div>
		</c:if>
	</c:if>
</body>
</html>