<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기 폼</title>
<script type="text/javascript">
function findId() {
	var check = 1;
	var UserName = $('input[name=username]').val();
	var UserTel = $('input[name=userTel]').val();
	$.ajax({
		type:"post",
		url:"find_id_pw.do",
		data:{'check' : check, 'UserName' : UserName,'UserTel' : UserTel},
		success: function (find) {
			console.log(find);
		$('.main').hide();
		$('.main2').show();
		$('.findIdview').html(find);
		},
		error: function() {
			
		}
	});
}


</script>
<style type="text/css">
body div{
border: 1px solid #999999;
}
.main2{
display: none;
}
</style>

</head>
<body>
	<div class="main">
		<div class="">
			<div class="">
				<div class="">
					<h3>아이디/비밀번호 찾기</h3>
					<p>인증된 이메일만 정보 찾기가 가능합니다 :)</p>
				</div>
				<div style="margin-bottom: 10px;"
					class="">
					<input type="radio" class="" id="" name="" onclick="" checked="checked">
					<label class=""	for="search_1">아이디 찾기</label>
				</div>
				<div class="">
					<input type="radio" class="" id="" name="" onclick=""> 
					<label class="" for="search_2">비밀번호 찾기</label>
				</div>
				<div id="">
					<div class="">
						<label class="" for="inputName_1">이름</label>
						<div>
							<input type="text" class="" id="" name="username" placeholder="ex) 갓형배">
						</div>
					</div>
					<div class="">
						<label class="" for="inputPhone_1">휴대폰번호</label>
						<div>
							<input type="text" class="" id="" name="userTel" placeholder="ex) 010-7777-9999">
						</div>
					</div>
					<div class="">
						<button id="" type="button" onclick="findId()" class="">확인</button>
					<a class=""	href="">취소</a>
					</div>
				</div>
				<div id="" style="display: ">
					<div class="">
						<label class="" for="inputId">아이디</label>
						<div>
							<input type="text" class="" id="" name="" placeholder="ex) ccangse">
						</div>
					</div>
					<div class="">
						<label class="" for="inputEmail_2">이메일</label>
						<div>
							<input type="email" class="" id=""	name="" placeholder="ex) E-mail@gmail.com">
						</div>
					</div>
					<div class="">
						<button id="" type="button" class="">확인</button>
					<a class=""	href="">취소</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="main2">
		<div class="findview">
			<div class="view">
				<span class="findIdview"></span>
			</div>
		</div>
	</div>
</body>
</html>