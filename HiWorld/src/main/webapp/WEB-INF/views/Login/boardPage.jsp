<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
    <h1>이웃 찾기</h1><br />
    
	검색 <input type="text" placeholder="이름을 검색하세요."/> <br />
    
	<div id="container">
	
	<table border="1">
		<c:forEach var="kinds" items="${MiniVO}">
			<tr>
				<td>${kinds.hpTitle}</td>
				<td>${kinds.userName}<a href=# onclick="MiniHp_Open('${kinds.userID}')" style="color: blue;">(${kinds.userID})</a></td>
			</tr>		
		</c:forEach>
	</table>
		
		
	</div>    
    
</body>

<script>
	function MiniHp_Open(UserID){
		var popupWidth = 880;
	    var popupHeight = 580;
	   var popupX = (window.screen.width/2)-(popupWidth/2);
	    var popupY = (window.screen.height/2)-(popupHeight/2);
	   window.open("miniHp_guestHome.do?OwnerID="+UserID,UserID,'status=no, scrollbars=no, menubar=no, toolbar=no, height='+popupHeight +',width='+popupWidth +',left='+popupX+',top='+popupY);
	}
</script>

</html>