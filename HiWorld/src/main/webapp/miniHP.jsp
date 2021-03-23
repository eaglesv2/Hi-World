<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

.jsp?check="miniHP"
.jsp?check="bamTol"

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