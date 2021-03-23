<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
title{
width: 100px;
}
title1{
width: 500px;
}
</style>

</head>
<body>
	<h1>회원가입</h1>
	<hr>
	<form id="userinsert" name="userinsert" action="insertClient.do"
		method="post">
		<table>
			<tbody>
				<tr>
					<td id="title">이름</td>
					<td colspan="2" id="title1"><input id="userName" name="userName"
						type="text"></td>
				</tr>
				<tr>
					<td colspan=3 id="nameCheck"></td>
				</tr>
				<tr>
					<td id="title">아이디</td>
					<td id="title1"><input type="text" id="userID" name="userID"></td>
				</tr>
				<tr>
					<td colspan=3 id="idCheck"></td>
				</tr>
				<tr>
					<td id="title">패스워드</td>
					<td colspan="2" id="title1"><input id="userPW" name="userPW"
						type="password"></td>
				</tr>
				<tr>
					<td colspan=3 id="pwCheck1"></td>
				</tr>
				<tr>
					<td id="title">패스워드 확인</td>
					<td colspan="2" id="title1"><input id="pwCheck" name="pwCheck"
						type="password"></td>
				</tr>
				<tr>
					<td id="title">성별</td>
					<td><select name="userGender" id="userGender">
							<option>성별</option>
							<option value="M">남</option>
							<option value="F">여</option>
					</select></td>
				</tr>
				<tr>
					<td id="title">생일</td>
					<td colspan="2" id="title1"><input id="userBirth" name="userBirth"
						type="text" size="8" maxlength="8" placeholder="예)20210322"></td>
				</tr>
				<tr>
					<td colspan=3 id="birthCheck"></td>
				</tr>
				<tr>
					<td id="title">연락처</td>
					<td colspan="2" id="title2"><input id="userTel1" name="userTel1"
						type="text" required>- <input id="userTel2" name="userTel2"
						type="text" required>- <input id="userTel3" name="userTel3"
						type="text" required></td>
				</tr>
				<tr>
					<td colspan=3 id="telCheck"></td>
				</tr>
				<tr>
					<td id="title">주소</td>
					<td colspan="2" id="title1"><input id="userAddress" name="userAddress"
						type="text" required></td>
				</tr>


				<tr>
					<td colspan="3"><input type="submit" id="signUp" value="회원가입"></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/client/userInser.js"></script>
</html>