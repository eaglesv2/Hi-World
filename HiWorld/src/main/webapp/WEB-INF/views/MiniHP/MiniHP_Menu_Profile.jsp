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
<%-- <link rel="stylesheet" href="${resourcePath}/img${fontCss}"/>
<link rel="stylesheet" href="${resourcePath}/img${fontCss}"/> --%>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

ul {
    display: inline-block;
    vertical-align: middle;
    padding: 0px 0px 0px 30px;
	font-size : 9pt;

}

body {
	 scrollbar-face-color: #FFFFFF;
	 scrollbar-highlight-color: #DBDBDB;
	 scrollbar-3dlight-color: #FFFFFF;
	 scrollbar-shadow-color: #9C92FF;
	 scrollbar-darkshadow-color: #FFFFFF;
	 scrollbar-track-color: #FFFFFF;
	 scrollbar-arrow-color: #9C92FF}
	 
 a { 
 color: black; text-decoration: none;
 }
 
</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
var content = "";
$(document).ready(function(){
	console.log('page load');
	checkProfile();
});
function checkProfile() {
	console.log('checkProfile');
	$.ajax({
		type : 'GET',
		url : 'miniHp_check_profile.do',
		/* userId session 받기 */
		data : { UserID : '${sessionVO.userID}' },
		
		success : function(result) {
			if(result == 1) { //프로필 존재 시
				console.log('ajax 1');
				$("#insert").hide();
				$("#insert_ok").hide();
				$("#change").show();
				$("#change_ok").hide();
				displayProfile();
			} else { //프로필 존재 x
				$("#insert").show();
				$("#insert_ok").hide();
				$("#change").hide();
				$("#change_ok").hide();
				console.log('ajax 0');
			}
		}
	});
}
function displayProfile() {
	console.log('display profile');
	$.ajax({
		type : 'GET',
		url : 'miniHp_get_profile.do',
		/* userId session 받기 */
		data : { UserID : '${sessionVO.userID}' },
		
		success : function(result) {
			console.log('ajax success');
			console.log(result);
			content = result;
			$("#appendContent").html(content);
		}
	});
}

function insert() {
	$("#insert").hide();
	$("#insert_ok").show();
}

function insert_ok() {
	$("#insert_ok").hide();
	$("#change").show();
	content = $("#insertContent").val();
	
	$.ajax({
		type : 'GET',
		url : 'miniHp_insert_profile.do',
		/* user serial userId session 받기 */
		data : { UserSerial : '${sessionVO.userSerial}', UserID : '${sessionVO.userID}', ProfileContent : content },
		
		success : function(result) {
			if(result == success) {
				/* $("#appendContent").innerHTML = content; */
				displayProfile();
			} else {
				alert("다시 한 번 시도해주세요");
			}
		},
		error : function(){
			alert("다시 한 번 시도해주세요");
		}
	});
}

function change() {
	$("#change").hide();
	$("#change_ok").show();
}

function change_ok() {
	$("#change").show();
	$("#change_ok").hide();
	content = $("#textContent").val();
	
	$.ajax({
		type : 'GET',
		url : 'miniHp_update_profile.do',
		/* user serial userId session 받기 */
		data : { UserSerial : '${sessionVO.userSerial}', UserID : '${sessionVO.userID}', ProfileContent : content },
		
		success : function(result) {
			if(result == 'success') {
				displayProfile();
				/* $("#appendContent").innerHTML = content; */
			} else {
				alert("다시 한 번 시도해주세요");
			}
		},
		error : function(){
			alert("다시 한 번 시도해주세요");
		}
	});
}
 
</script>

 <body leftmargin="5" topmargin="0">
		<table border="0" width="420" cellpadding="0" cellspacing="0">
		<tr>
			<td>&nbsp;&nbsp;<font><b>프로필</b></font></td>
		</tr>
		<tr>
			<td align="center">
				<div id="insert">
					<div align="right">
						<input type="button" value="작성하기" onclick="insert();">
					</div>
				
					<img src="/root/resources/images/bar.jpg" width="420" height="6" border="0" alt="">
				
					<font>
						<span id="noContent" align="center">작성된 프로필이 없습니다</span>
					</font>
				
					<img src="/root/resources/images/bar.jpg" width="420" height="6" border="0" alt="">
				</div>
				
				<div id="insert_ok">
					<div align="right">
						<input type="button" value="작성완료" onclick="insert_ok();">
					</div>
				
					<img src="/root/resources/images/bar.jpg" width="420" height="6" border="0" alt="">
				
					<font>
						<textarea rows="50" cols="30" style="width: 400px; height: 300px; resize: none;" id="insertContent">
						</textarea>
					</font>
				
					<img src="/root/resources/images/bar.jpg" width="420" height="6" border="0" alt="">
				</div>
				
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

						</textarea>
					</font>
				
					<img src="/root/resources/images/bar.jpg" width="420" height="6" border="0" alt="">
				</div>
			</td>
		</tr>

	</table>
 </body>
</html>