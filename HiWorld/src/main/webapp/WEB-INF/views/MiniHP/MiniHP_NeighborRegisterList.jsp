<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="${resourcePath}/img${fontCss}"/><link rel="stylesheet" href="${resourcePath }/img${fontCss}"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">

</script>
 <body background="${resoucePath }/img/admin/pic/member_list.jpg">
	<form action="" name="myForm" method="post" style="position: absolute; top:50px; left: 15px; font-size: 8pt;">
		<c:if test="${registorList ne null }">
			<ul style="width: 282px; height:300px; ">				
				<c:forEach var="vo" items="${registorList}">
					<li style=" vertical-align: top;">
						<a href="" onclick="window.open('miniHp_neighborRegistorCheck.do?senderID=${vo.senderID}','${vo.senderID}memberCall','width=370,height=504,location=no,status=no,scrollbars=no');">
                            <font color="Blue">${vo.senderName}</font>
                           		 님이 일촌 신청을 하셨습니다.
                        </a>						
					</li>
				</c:forEach>
			</ul>
		</c:if>
		<c:if test="${registorList eq null }">
			<center>이웃 신청이 없습니다</center>
		</c:if>
	</form>
 </body>
</html>