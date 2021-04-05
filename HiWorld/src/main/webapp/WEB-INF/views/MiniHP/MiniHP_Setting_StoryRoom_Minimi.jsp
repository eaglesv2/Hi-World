<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type>
a:link {text-decoration: none; color: black;}
a:visited {text-decoration: none; color: black;}
a:active {text-decoration: none; color: grey;}
a:hover {text-decoration: underline; color: red;}
 	
input[type="radio"] {
	margin-top: -1px;
	vertical-align: middle;
}
 	
body{
	scrollbar-face-color: #FFFFFF;
	scrollbar-highlight-color: #DBDBDB;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: #9C92FF;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #9C92FF
}

#container{
	width: 420px; 
	height:370px; 
	padding-left: 5px;
	font: 굴림;
	font-size: 10pt;
	border: 0px solid black;
}
#storyImg{
	width: 349px; 
	height: 142px;
}
.minimiImg {
	position: absolute;
	top: 185px; 
	left: 390px;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script type="text/javascript">
var boxXY = "390px, 195px"

var section = document.querySelector("#section1");
var container = section.querySelector(".storyImg");
var box = section.querySelector(".minimiImg");


container.onclick = function(e){
	box.style.left = (e.pageX-35)+"px";
	box.style.top = (e.pageY-40)+"px";
	boxXY = box.style.left+","+box.style.top;
	console.log(boxXY);
}


function changeStory(src){
	var src = document.setStoryRoomMinimi.storyRoom.value;
	var src = "url(${pageContext.request.contextPath}/"+src+")";
	$("#storyImg2").css("background-image", src);
}

function changeMinimi(src){
	var src = document.setStoryRoomMinimi.minimi.value;
	var src = "url(${pageContext.request.contextPath}/"+src+")";
	$("#minimiImg").css("background-image", src);
}

function saveStoryMinimi() {
	var storyRoom = $(":input:radio[name=storyRoom]:checked").val();
	var minimi = $(":input:radio[name=minimi]:checked").val();
	
	$.ajax({
		 type: "POST",
		 url: 'miniHp_saveStoryRoomMinimi.do' ,
		 data: { storyRoom : storyRoom, minimi : minimi, xy : boxXY},
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
<form name="setStoryRoomMinimi">
	<table border="0" width="420" align="center" cellpadding="0" cellspacing="0">
		<tr height="5px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
	</table>	
	<div id="container" align="left">
	<section id="section1" class="section1">
	<div style="background-image: url('${pageContext.request.contextPath}/${itemList.backgroundSrc}'); background-size: 400px 200px; width: 400px; height: 200px; display:flex; justify-content: center; align-items: center;" id="storyImg2" class="storyImg2" >
		<div border="0" id="storyImg" class="storyImg"></div>
	</div>
	<div style="background-image:url('${pageContext.request.contextPath}/${itemList.characterSrc}'); background-size: 70px 60px; width:70px; height: 60px; top: ${itemList.minimiY}; left: ${itemList.minimiX}" id="minimiImg" class="minimiImg"></div>
	</section>
	<table style="width: 420px; height:150px;">
		<tr>								
			<td style="width: 210px; height: 150px;">
				<div style="overflow-y:scroll; width:210px;  height:150px; padding:0px">
					<c:if test="${storySize ne 0 }">
						<c:forEach var="storyList" items="${storyList}">
							<c:if test="${storyList.articleImg eq itemList.backgroundSrc}">
								<input type="radio" name="storyRoom" value="${storyList.articleImg}" checked="checked" onclick="changeStory(this.value)"><img alt="" src="${pageContext.request.contextPath}/${storyList.articleImg}" width="120px" ><br/>&nbsp;&nbsp;&nbsp;${storyList.articleName}<br/>
							</c:if>
							<c:if test="${storyList.articleImg ne itemList.backgroundSrc}">
								<input type="radio" name="storyRoom" value="${storyList.articleImg}" onclick="changeStory(this.value)"><img alt="" src="${pageContext.request.contextPath}/${storyList.articleImg}" width="120px" ><br/>&nbsp;&nbsp;&nbsp;${storyList.articleName}<br/>
							</c:if>		
						</c:forEach>	
					</c:if>
				</div>
			</td>
			
			<td style="width: 210px; height: 150px;">
				<div style="overflow-y:scroll; width:210px;  height:150px; padding:0px">
					<c:if test="${minimiSize ne 0 }">
						<c:forEach var="minimiList" items="${minimiList}">
							<c:if test="${minimiList.articleImg eq itemList.characterSrc}">
								<input type="radio" name="minimi" value="${minimiList.articleImg}" checked="checked" onclick="changeMinimi(this.value)"><img alt="" src="${pageContext.request.contextPath}/${minimiList.articleImg}" width="70px" height="60px"><br/>&nbsp;&nbsp;&nbsp;${minimiList.articleName}<br/>
							</c:if>
							<c:if test="${minimiList.articleImg ne itemList.characterSrc}">
								<input type="radio" name="minimi" value="${minimiList.articleImg}" onclick="changeMinimi(this.value)"><img alt="" src="${pageContext.request.contextPath}/${minimiList.articleImg}" width="70px" height="60px"><br/>&nbsp;&nbsp;&nbsp;${minimiList.articleName}<br/>
							</c:if>		
						</c:forEach>	
					</c:if>
				</div>
			</td>
		<tr>
	</table>		
	</div>
	<input type="button" id="sendBtn" value="저장" onclick="saveStoryMinimi()"/>
	<table border="0" width="420" align="center" cellpadding="0" cellspacing="0">
		<tr height="5px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
	</table> 
</form>
</body>
</html>