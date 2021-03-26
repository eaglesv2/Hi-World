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
</script>
<body style="overflow:hidden;">
	<div id="titleName" style="padding-top:12px;">
		<span style="font-weight:bold; font-size: 15px; color: #4B9687; cursor: pointer;" id="inText">${ownerintroVO.hpTitle}</span>
	</div>
</body>
</html>
