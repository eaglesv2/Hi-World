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
<html><link rel="stylesheet" href="${resourcePath }/img${fontCss}"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
var str;

$(document).ready(function(){
	$("#titleName_alter").hide();
	displayTitle();
});

function change(){
	$("#titleName").hide();
	$("#titleName_alter").show();
	/* $("#title_Txt").val(str); */
}

function change_ok(){
	console.log('change_ok');
	$("#titleName").show();
	$("#titleName_alter").hide();
	var newTitle = $("#title_Txt").val();
	console.log(newTitle);
	
	$.ajax({
		type : 'GET',
		url : 'miniHp_updateIntroTitle.do',
		data : { UserID : '${sessionVO.userID}', hpTitle : newTitle },
		
		success : function(result) {
			console.log('ajax success3');
			displayTitle();
		}
	})
}

function displayTitle(){
	console.log('display title');
	
	$.ajax({
		type : 'GET',
		url : 'miniHp_getIntroTitle.do',
		data : { UserID : '${sessionVO.userID}'},
		
		success : function(result) {
			console.log('ajax success4');
			console.log(result);
			$("#inText").html(result);
		}
	})
}

</script>
<body style="overflow:hidden;">
	<div id="titleName" style="padding-top:12px;">
		<span style="font-weight:bold; font-size: 15px; color: #4B9687; cursor: pointer;" id="inText" onclick="change()"></span>
	</div>
	<div id="titleName_alter">
		<input type="text" id="title_Txt" />
		<img src="${pageContext.request.contextPath}/resources/images/admin/editOkBtn.jpg" onclick="change_ok()"/>
	</div>
</body>
</html>
