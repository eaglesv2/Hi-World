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

ul{
    display: inline-block;
    vertical-align: middle;
    padding: 0px 0px 0px 30px;
	font-size : 9pt;

}

body
	{scrollbar-face-color: #FFFFFF;
	 scrollbar-highlight-color: #DBDBDB;
	 scrollbar-3dlight-color: #FFFFFF;
	 scrollbar-shadow-color: #9C92FF;
	 scrollbar-darkshadow-color: #FFFFFF;
	 scrollbar-track-color: #FFFFFF;
	 scrollbar-arrow-color: #9C92FF}
	 
 a{ 
 color: black; text-decoration: none;
 }
 
</style>
</head>
<script type="text/javascript" src="/cyworld/resources/js/ajaxUtil2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
 $(document).ready(function(){
		$("#change_ok").style.display="none";	
		/* sendRequest("my_get_profile.action",null,displayInfo,"GET"); */
	});
/*  $(document).ready(function(){
	    initSet();
	}); */
 
 
 </script>

 <body leftmargin="5" topmargin="0">
		<table border="0" width="420" cellpadding="0" cellspacing="0">
		<tr>
			<td>&nbsp;&nbsp;<font><b>프로필</b></font></td>
		</tr>
		<tr>
			<td align="center">
				<div id="change">
					<div align="right">
						<input type="button" value="수정하기" onclick="change();">
					</div>
				
					<img src="/root/resources/images/bar.jpg" width="420" height="6" border="0" alt="">
				
					<font>
						<span id="appendContent" align="center"></span>
					</font>
				
					<img src="/root/resources/images/bar.jpg" width="420" height="6" border="0" alt="">
				</div>
				
				<div id="change_ok">
					<div align="right">
						<input type="button" value="수정완료" onclick="change_ok();">
					</div>
					
					<img src="/root/resources/images/bar.jpg" width="420" height="6" border="0" alt="">
					
					<font>
						<textarea rows="50" cols="30" style="width: 400px; height: 300px; resize: none;" id="textContent">
							내 눈을 바라바
						
							넌 행복해지고
						</textarea>
					</font>
				
					<img src="/root/resources/images/bar.jpg" width="420" height="6" border="0" alt="">
				</div>
			</td>
		</tr>

	</table>
 </body>
</html>