<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="signup.do" method="post">
	이름 <input type="text" name="name"> <br>
	아이디 <input type="text" name="id"> <br>
	비밀번호 <input type="password" name="pw"> <br>
	성별 <input type="radio" name="gender" value="F" required>여자
		<input type="radio" name="gender" value="M">남자 <br>
	생일 <input type="text" name="birth"> <br>
	주소 <input type="text" name="address"> <br>
	<input type="submit" value="가입">	
</form>
</body>
</html>