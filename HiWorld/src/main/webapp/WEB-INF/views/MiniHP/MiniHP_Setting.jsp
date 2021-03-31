<%@page import="java.net.URLEncoder"%>
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
<head><link rel="stylesheet" href="${resourcePath }/img${fontCss}"/>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="resources/js/miniHP/ajaxMovePage.js?ver=2"></script>
<script type="text/javascript">
	
	$(document).ready(function() {
		console.log('1');
		$.ajax({
			type : 'post',
			url : 'miniHp_menuList.do',
			
			success : function(result) {
				$("#sideContents").html(result);
			}
		});
		
		$.ajax({
			type : 'post',
			url : 'miniHp_rightMenu.do',
			data : { menu : '${menu}'},
			
			success : function(result) {
				$("#rightMenu").html(result);
			}
		});
		
		if("${currentFlag}" == "2") {
			$.ajax({
				type : 'post',
				url : 'miniHp_menuAvailable.do',
				
				success : function(result) {
					$("#bodyContents").html(result); 
				}
			})
		} else {
			$.ajax({
				type : 'post',
				url : 'miniHp_setBasicInformation_pw.do',
				
				success : function(result) {
					$("#bodyContents").html(result); 
				}
			})
		}
	});

</script>
</head>
 <body topmargin="0" leftmargin="0">
 <form action="main">
	<table border="0" align="left" valign="top" width="850" height="550"  cellspacing="0" cellpadding="0" style="table-layout: fixed;">
		<tr>
			<td>
				<table border="0" align="left" width="800" height="510">
					<tr>
						<td colspan="2" align="center">
							<br>
							<font ><span style="font-size:8pt;">today <font color="red">${session.getToDay() }</font> | total ${session.getTotalDay() }</span></font>
						</td>
						<td  height="40">
								<iframe frameborder="0" width="470" height="40" src="MiniHP_TopTitle.do"></iframe> 
						</td>
						<td></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="178" height="440" align="center" valign="top" background="${pageContext.request.contextPath}/resources/images/bg_left_rect.jpg" style="padding-top: 10px;">
						<!-- Setting menu beginning -->
							<span id="sideContents"></span>
						<!-- Setting menu ending -->								
						</td>
						<td width="480" height="440" align="center" background="${pageContext.request.contextPath}/resources/images/bg_center_rect.jpg">
						<!-- Setting menu beginning -->
							<span id="bodyContents" ></span>
						
						<!-- Setting menu ending -->							
						</td>
						<td valign="top" style="padding-top: 20px;">
						<!-- Setting menu beginning -->
							<span id="rightMenu"></span>
						<!-- Setting menu ending -->	
						</td>
					</tr>
					<tr>
						<td ></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
 </form>
 </body>



</html>