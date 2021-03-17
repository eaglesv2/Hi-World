<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jQuery/jquery-3.4.1.min.js"></script>
</head>
<body>
	<h1>회원가입</h1>
	<hr>
	<form id="userinsert" name="userinsert" action="insertClient.do"
		method="post">
		<table>
			<tbody>
				<c:choose>
					<c:when test="${UserName!=null}">
						<tr>
							<td>이름</td>
							<td colspan="2"><input id="userName" name="userName" type="text" value="${UserName}" readonly></td>
						</tr>
						<tr>
							<td><input type="hidden" id="userID" name="userID" value="${UserID}"></td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td>이름</td>
							<td colspan="2"><input id="userName" name="userName" type="text"></td>
						</tr>
						<tr>
							<td>아이디</td>
							<td><input type="text" id="userID" name="userID"></td>
							<td><input type="button" id="check" value="중복체크"></td>
						</tr>
					</c:otherwise>
				</c:choose>
				<tr>
					<td>패스워드</td>
					<td colspan="2"><input id="userPW" name="userPW" type="password"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><select name="userGender" id="userGender">
							<option value="M">남</option>
							<option value="F">여</option>
					</select></td>
				</tr>
				<tr>
					<td>생일</td>
					<td colspan="2"><input id="userBirth" name="userBirth" type="text"></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td colspan="2">
						<input id="userTel1" name="userTel1" type="text">-
						<input id="userTel2" name="userTel2" type="text">- 
						<input id="userTel3" name="userTel3" type="text">
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td colspan="2"><input id="userAddress" name="userAddress" type="text"></td>
				</tr>
				<!-- <tr>
					<td>패스워드 확인</td>
					<td colspan="2"><input id="pwCheck" name="pwCheck" type="password"></td>
				</tr> -->

				<tr>
					<td colspan="3"><input type="submit" id="signUp" value="회원가입"></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>

<!-- <script type="text/javascript">
	$(document).ready(function(e){
		
		var idx = false;
		
		$('#signUp').click(function(){
			if($.trim($('#id').val()) == ''){
				alert("아이디 입력.");
				$('#userId').focus();
				return;
			}else if($.trim($('#pw').val()) == ''){
				alert("패스워드 입력.");
				$('#passwd').focus();
				return;
			}
			//패스워드 확인
			else if($('#pw').val() != $('#pwCheck').val()){
				alert('패스워드가 다릅니다.');
				$('#pw').focus();
				return;
			}
			
			if(idx==false){
				alert("아이디 중복체크를 해주세요.");
				return;
			}else{
				$('#userinsert').submit();
			}
		});
		
		$('#check').click(function(){
			$.ajax({
				url: "${pageContext.request.contextPath}/idCheck.do",
				type: "GET",
				data:{
					"id":$('#id').val()
				},
				success: function(data){
					if(data == 0 && $.trim($('#id').val()) != '' ){
						idx=true;
						$('#id').attr("readonly",true);
						var html="<tr><td colspan='3' style='color: green'>사용가능</td></tr>";
						$('#idCheck').empty();
						$('#idCheck').append(html);
					}else{

						var html="<tr><td colspan='3' style='color: red'>사용불가능한 아이디 입니다.</td></tr>";
						$('#idCheck').empty();
						$('#idCheck').append(html);
					}
				},
				error: function(){
					alert("서버에러");
				}
			});
			

		});
		
	});
</script> -->
</html>