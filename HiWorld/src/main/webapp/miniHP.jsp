<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	var check = <%= request.getParameter("check") %>
	if(check=="miniHP"){
	   location.href="MiniHP_Home.do";
	}else if(check=="bamTol"){
	   location.href="BamTolCharge.do";
	   
	}
</script>
</body>
</html>