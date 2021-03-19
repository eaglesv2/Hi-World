<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<h1>회원가입</h1>
	<hr>
	<form id="userinsert" name="userinsert" action="insertClient.do"
		method="post">
		<table>
			<tbody>
				<tr>
					<td>이름</td>
					<td colspan="2"><input id="userName" name="userName"
						type="text"></td>
				</tr>
				<tr>
					<td colspan=3 id="nameCheck"></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" id="userID" name="userID"></td>
					<td><input type="button" id="check" value="중복체크"></td>
				</tr>
				<tr>
					<td colspan=3 id="idCheck"></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td colspan="2"><input id="userPW" name="userPW"
						type="password"></td>
				</tr>
				<tr>
					<td colspan=3 id="pwCheck"></td>
				</tr>
				<tr>
					<td>패스워드 확인</td>
					<td colspan="2"><input id="pwCheck" name="pwCheck"
						type="password"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><select name="userGender" id="userGender">
							<option>성별</option>
							<option value="M">남</option>
							<option value="F">여</option>
					</select></td>
				</tr>
				<tr>
					<td>생일</td>
					<td colspan="2"><input id="userBirth" name="userBirth"
						type="text"></td>
				</tr>
				<tr>
					<td colspan=3 id="birthCheck"></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td colspan="2"><input id="userTel1" name="userTel1"
						type="text">- <input id="userTel2" name="userTel2"
						type="text">- <input id="userTel3" name="userTel3"
						type="text"></td>
				</tr>
				<tr>
					<td colspan=3 id="telCheck"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td colspan="2"><input id="userAddress" name="userAddress"
						type="text"></td>
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