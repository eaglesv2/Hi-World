<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String pathUserId=(String)request.getAttribute("pathUserId");
%>
<%
%>
<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="${resourcePath }/img${fontCss}"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a:link {text-decoration: none; color: black;}
a:visited {text-decoration: none; color: black;}
a:active {text-decoration: none; color: grey;}
a:hover {text-decoration: underline; color: red;}
 	
body{
	 scrollbar-face-color: #FFFFFF;
	 scrollbar-highlight-color: #DBDBDB;
	 scrollbar-3dlight-color: #FFFFFF;
	 scrollbar-shadow-color: #9C92FF;
	 scrollbar-darkshadow-color: #FFFFFF;
	 scrollbar-track-color: #FFFFFF;
	 scrollbar-arrow-color: #9C92FF
}

.menu{
	border: 1px solid;
	border-left: 0px;
	width: 60px;
	height: 22px;
	padding-top: 6px;
	border-top-right-radius: 6px;
	border-bottom-right-radius: 6px;
	font-size: 9pt;
	user-select:none;
}
input::placeholder {
  font-style: italic;
  font-size: 8pt;
}
</style>
<script src="https://www.lgkids.co.kr/es_all/plugins/jscolor-2.0.5/jscolor.js"></script>
<script type="text/javascript">

	$(function(){	
		var menu3 = $("#menu3-${miniHpUserMenuVO.menu3}");
		menu3.checked = true;
		
		var menu4 = $("#menu4-${miniHpUserMenuVO.menu4}");
		menu4.checked = true;
		
		var menu5 = $("#menu5-${miniHpUserMenuVO.menu5}");
		menu5.checked = true;
		
		var menu6=$("#menu6-${miniHpUserMenuVO.menu6}");
		menu6.checked = true;
		
		$('.menu').css('background-color', '#'+$("#menuBackground").val());
		$('.menu').css('color', '#'+$("#menuFontColor").val());
		$('.menu').css('border-color', '#'+$("#menuBorder").val());
	});
	
	$(document).ready(function(){
		 $("#send").click(function(){
			var menu3 = $(':radio[name="menu3"]:checked').val();
			var menu4 = $(':radio[name="menu4"]:checked').val();
			var menu5 = $(':radio[name="menu5"]:checked').val();
			var menu6 = $(':radio[name="menu6"]:checked').val();
			var menuBGColor= $("#menuBackground").val();
			var menuFontColor = $("#menuFontColor").val();
			var menuBorderColor = $("#menuBorder").val();
			
			var allData = { "menu3" : menu3, "menu4" : menu4, "menu5" : menu5, "menu6" : menu6,
							"menuBGColor" : menuBGColor, "menuFontColor" : menuFontColor, "menuBorderColor" : menuBorderColor }
			$.ajax({
				type : "POST",
				url : "miniHp_menuAvailable_ok.do",
				data : allData,
				success : function(result){
					params = "menu=menu7";
					$.ajax({
						type : "POST",
						url : "miniHp_rightMenu.action",
						data : params,
						success : function(result){
							$("#rightMenu").html(result);
						},
						error:function(e){
							alert(e.responseText);
						}			 
					 });
				},
				error:function(e){
					alert(e.responseText);
				}			 
			 });		 		 
		 });
		 
		 $("#menuBackground").change(function(){
			$('.menu').css('background-color', '#'+$("#menuBackground").val());
		 });
		 $("#menuFontColor").change(function(){
			$('.menu').css('color', '#'+$("#menuFontColor").val());
		 });
		 $("#menuBorder").change(function(){
			$('.menu').css('border-color', '#'+$("#menuBorder").val());
		 });
		 $("#basicMenuColor").click(function(){
			$('#menuBackground').value="238db3";
			$('#menuBackground').style.backgroundColor="#238DB3";
			$('#menuBackground').style.color="#FFFFFF"
		    $('.menu').css('background-color', '#238db3');
				 
			$('#menuFontColor').value="000000"
			$('#menuFontColor').style.backgroundColor="#000000";
			$('#menuFontColor').style.color="#FFFFFF"
			$('.menu').css('color', '#000000');
				 
			$('#menuBorder').value="000000"
			$('#menuBorder').style.backgroundColor="#000000";
			$('#menuBorder').style.color="#FFFFFF"
			$('.menu').css('border-color', '#000000');
		 });
	});
	
	function bb(){	
		$('#menuBackground').style.backgroundColor="black";
	}
	
	
</script>
</head>
<body>
<form name="myForm">
	<table border="0" width="420" align="center" cellpadding="0" cellspacing="0" valine="top">
		<tr height="5px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
	</table>
	
	<div align="left" style="width: 420px; height:210px; padding-top: 6px;font: 굴림;font-size: 10pt;border: 0px solid black;background-color: #F6F6F6;">
		<div style="border: 0px solid black;width: 200px;height:150px;float: left;margin-top: 8px;">
			<div style="float: left;border: 0px solid black;padding-top: 5px;">
				<div align="center" class="menu">사진첩</div>
			</div>
			<div style="border: 0px solid black;height: 28px;padding-top: 10px;padding-left: 70px;">
				<input type="radio" name="menu3" id="menu3-1" value="1"> 공개 <input type="radio" name="menu3" id="menu3-0" value="0"> 비공개
			</div>
			<div style="float: left;border: 0px solid black;padding-top: 8px;">
				<div align="center" class="menu">게시판</div>
			</div>
			<div style="border: 0px solid black;height: 28px;padding-top: 13px;padding-left: 70px;">
				<input type="radio" name="menu4" id="menu4-1" value="1"> 공개 <input type="radio" name="menu4" id="menu4-0" value="0"> 비공개
			</div>
			<div style="float: left;border: 0px solid black;padding-top: 8px;">
				<div align="center" class="menu">비디오</div>
			</div>
			<div style="border: 0px solid black;height: 28px;padding-top: 13px;padding-left: 70px;">
				<input type="radio" name="menu5" id="menu5-1" value="1"> 공개 <input type="radio" name="menu5" id="menu5-0" value="0"> 비공개
			</div>
			<div style="float: left;border: 0px solid black;padding-top: 8px;">
				<div align="center" class="menu">방명록</div>
			</div>
			<div style="border: 0px solid black;height: 28px;padding-top: 13px;padding-left: 70px;">
				<input type="radio" name="menu6" id="menu6-1" value="1"> 공개 <input type="radio" name="menu6" id="menu6-0" value="0"> 비공개
			</div>
		</div>
		<div align="center" style="border: 0px solid black;height: 165px;padding-top: 5px;">
			<div align="left" style="padding-left: 228px;">
				바탕 색상
			</div>
			<div style="padding-top: 5px;padding-bottom: 10px;padding-right: 42px; border: 0px solid black;">
				<input class="form-control jscolor" id="menuBackground" value="${cyMenuDTO.menuBGColor}" placeholder="바탕 색상" 
					style="width: 30%;">
			</div>
			<div align="left" style="padding-left: 228px;">
				글씨 색상
			</div>
			<div style="padding-top: 5px;padding-bottom: 10px;padding-right: 42px; border: 0px solid black;">
				<input class="form-control jscolor" id="menuFontColor" value="${cyMenuDTO.menuFontColor}" placeholder="글씨 색상"
					style="width: 30%;">
			</div>
			<div align="left" style="padding-left: 228px;">
				테두리 색상
			</div>
			<div style="padding-top: 5px;padding-bottom: 10px;padding-right: 42px; border: 0px solid black;">
				<input class="form-control jscolor" id="menuBorder" value="${cyMenuDTO.menuBorderColor}" placeholder="테두리 색상"
					style="width: 30%;">
			</div>
		</div>
		<div align="right" style="border: 0px solid black;height: 28px;padding-top: 5px;padding-left: 75px;padding-right: 27px;">
			<font  style="font-size:8pt;color: #1294AB;font-weight: bold;">
				<span id="basicMenuColor" onmouseover="this.style.color='#FF5E00';" onmouseout="this.style.color='#1294AB';"
					style="padding-right: 61px;">
						■ 기본 색상
				</span>
			</font>
			<input type="button" id="send" value="저장">
		</div>
	</div>

	<table border="0" width="420" align="center" cellpadding="0" cellspacing="0">
		<tr height="5px"></tr>
		<tr height="2">
			<td align="right" colspan="3" bgcolor="#EBEBEB"></td>
		</tr>
		<tr height="10px"></tr>
	</table>
	
	<div style="height: 200px;"></div>
	
</form>
</body>
</html>