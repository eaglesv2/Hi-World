<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input[type="radio"] {
	margin-top: -1px;
	vertical-align: middle;
}

.wrap {
	height: 25px;
	display: flex;
	align-items: center;
	justify-content: center;
	margin-bottom: 20px;
}

#sendBtn {
	width: 100px;
	height: 30px;
	font-family: 'Roboto', sans-serif;
	font-size: 11px;
	text-transform: uppercase;
	letter-spacing: 2.5px;
	font-weight: 500;
	color: #000;
	background-color: #e9e9e9;
	border: none;
	border-radius: 45px;
	box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease 0s;
	cursor: pointer;
	outline: none;
}

#sendBtn:hover {
	background-color: #2EE59D;
	box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
	color: #fff;
	transform: translateY(-7px);
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script>
function changeMousePointer(src){
	var src = document.setMousePointer.mouse.value;
	var src = "url(${pageContext.request.contextPath}/"+src+")";
	$("#changeImg").attr("src", src);
}

function saveMousePointer() {
	var mousePointer = $(":input:radio[name=mouse]:checked").val();
	
	$.ajax({
		 type: "POST",
		 url: 'miniHp_saveMousePointer.do' ,
		 data: { mousePointer : mousePointer },
		 success:function(result){
			 console.log('1234');
			 window.parent.location.href = "MiniHP_Home.do";
		 },
		 error:function(e){
			 console.log('6789');
		 }			 
	 });
}
</script>
</head>
<body>
<form name="setMousePointer">
	<table border="0" width="420" align="center" cellpadding="0" cellspacing="0">
		<tr height="2px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
	</table>	
	<div style="width: 420px; height:370px; font-size: 10pt; border: 0px solid black;">	
		<table width="420px" height="100" align="center" cellpadding="10" style="text-align:center;">
			<tr>
				<td width="210px">
					<b>현재 사용 중</b>
				</td>
				<td width="210px">
					<b>바꿀 예정</b>
				</td>
			</tr>
			<tr>
				<c:if test="${itemList.mouseSrc eq null}">
					<td>
						<img src="${pageContext.request.contextPath}/resources/images/article/basicMouse.png" border="0" alt="사용중인 마우스" id="mouseImg" width="100px" height="80px">
					</td>
					<td>
						<img src="${pageContext.request.contextPath}/resources/images/article/basicMouse.png" border="0" alt="바꿀 마우스" id="changeImg" width="100px" height="80px">
					</td>
				</c:if>
				<c:if test="${itemList.mouseSrc ne null}">
					<td>
						<img src="${pageContext.request.contextPath}/${itemList.mouseSrc}" border="0" alt="사용중인 마우스" id="mouseImg">	
					</td>
					<td>
						<img src="${pageContext.request.contextPath}/${itemList.mouseSrc}" border="0" alt="바꿀 마우스" id="changeImg">
					</td>
				</c:if>
			</tr>
		</table>
		<div style="overflow-y:scroll; width:440px; height:175px; padding:0px">
			<b>사용하실 마우스 커서를 선택해 주세요</b><br>
			<table style="width: 420px; overflow-x: scroll; height:150px; text-align:center;">
				<tr>
					<!-- 구매한 마우스 커서가 없는 경우 -->
					<c:if test="${mouseSize eq 0}">
						<td width="110px">
							<input type="radio" name="mouse" value="기본" checked="checked" onclick="changePonter(this.value)"> <br />
							<img id="1" alt="" src="${pageContext.request.contextPath}/resources/images/article/basicMouse.png" width="100px" height="80px"> <br />
							기본 <br />
						</td>
					</c:if>			
					<!-- 구매한 마우스 커서가 있는 경우 -->
					<c:if test="${mouseSize ne 0 }">
						<!-- 기본 마우스 커서 사용하는 경우 -->
						<c:if test="${empty itemList.mouseSrc}">
							<td width="110px">
								<input type="radio" name="mouse" value="기본" checked="checked" onclick="changePonter(this.value)"> <br />
								<img id="2" alt="" src="${pageContext.request.contextPath}/resources/images/article/basicMouse.png" width="100px" height="80px"> <br />
								기본 <br />
							</td>
							<c:forEach var="mouseList" items="${mouseList}">
								<td width="110px">
									<c:if test="${mouseList.articleImg eq itemList.mouseSrc}">
										<input type="radio" name="mouse" value="${mouseList.articleImg}" checked="checked" onclick="changePonter(this.value)"> <br/>
										<img alt="" src="${pageContext.request.contextPath}/${mouseList.articleImg}" width="100px" height="80px"> <br/>
										${mouseList.articleName} <br />
									</c:if>
									<c:if test="${mouseList.articleImg ne itemList.mouseSrc}">
										<input type="radio" name="mouse" value="${mouseList.articleImg}" onclick="changePonter(this.value)"> <br />
										<img alt="" src="${pageContext.request.contextPath}/${mouseList.articleImg}" width="100px" height="80px"><br/>
										${mouseList.articleName} <br />
									</c:if>
								</td>
							</c:forEach>
						</c:if>
						<!-- 기분마우스커서 사용 안하는 경우 -->
						<c:if test="${not empty itemList.mouseSrc}">
							<c:forEach var="mouseList" items="${mouseList}">
								<td width=110px">
									<input type="radio" name="mouse" value="기본" checked="checked" onclick="changePonter(this.value)"> <br />
									<img id="3"alt="" src="${pageContext.request.contextPath}/resources/images/article/basicMouse.png" width="100px" height="80px"> <br />
									기본 <br />
								</td>
								<td width="110px">
									<c:if test="${mouseList.articleImg eq itemList.mouseSrc}">
										<input type="radio" name="mouse" value="${mouseList.articleImg}" checked="checked" onclick="changePonter(this.value)"> <br/>
										<img alt="" src="${pageContext.request.contextPath}/${mouseList.articleImg}" width="100px" height="80px"> <br/>
										${mouseList.articleName} <br />
									</c:if>
									<c:if test="${mouseList.articleImg ne itemList.mouseSrc}">
										<input type="radio" name="mouse" value="${mouseList.articleImg}" onclick="changePonter(this.value)"> <br />
										<img alt="" src="${pageContext.request.contextPath}/${mouseList.articleImg}" width="100px" height="80px"><br/>
										${mouseList.articleName} <br />
									</c:if>
								</td>
							</c:forEach>
						</c:if>
					</c:if>
				</tr>
			</table>
		</div>
		<div class="wrap">
 			<button id="sendBtn" onclick="saveMousePointer()">저장</button>
		</div>
		<table border="0" width="420" align="center" cellpadding="0" cellspacing="0">
			<tr height="5px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
		</table>
	</div>
</form>
</body>
</html>