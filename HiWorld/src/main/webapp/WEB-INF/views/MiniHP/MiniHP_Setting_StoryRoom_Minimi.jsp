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
var boxXy="388px,183px";
$(document).ready(function(){
	<%-- $("#sendBtn").click(function(){
		var storyRoom= document.myForm.storyRoom.value;
		var minimi = document.myForm.minimi.value;
		params="storyRoom="+storyRoom+"&minimi="+minimi;
		params+="&xy="+boxXy;

		
		$.ajax({
			 type:"POST",
			 url:"<%=cp%>/cy/setting/saveStoryMinimi.action",
			 data:params,
			 success:function(args){
				 window.parent.location.href = "<%=cp%>/cy/my_main.action";
			 },
			 error:function(e){
				 window.parent.location.href = "<%=cp%>/cy/my_main.action";
			 }			 
		 });
	 }); --%>
	
	var section = document.querySelector("#section1");
	var container = section.querySelector(".storyImg");
	var box = section.querySelector(".minimiImg");
	/* var offset = {x:0,y:0}; */

	container.onclick = function(e){
		box.style.left = (e.pageX-45)+"px";
		box.style.top = (e.pageY-60)+"px";
		boxXY = box.style.left+","+box.style.top;
		console.log(boxXY);
	}
});

function changeStory(src){
	var src = document.myForm.storyRoom.value;
	var src = "url(${resourcePath}/img"+src+")";
	$("#storyImg2").css("background-image", src);
}

function changeMinimi(src){
	var src = document.myForm.minimi.value;
	var src = "url(${resourcePath}/img"+src+")";
	$("#minimiImg").css("background-image", src);
}
	
window.addEventListener("load", function(){
	
});
	
</script>
</head>
<body>
<form name="setStoryRoomMinimi">
	<table border="0" width="420" align="center" cellpadding="0" cellspacing="0">
		<tr height="5px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
	</table>	
	<div id="container" align="left">
	<section id="section1" class="section1">
	<div style="background-image: url('${pageContext.request.contextPath}/${itemList.backgroundSrc}'); width: 399px; height: 200px; display:flex; justify-content: center; align-items: center;" id="storyImg2" class="storyImg2" >
		<div border="0" id="storyImg" class="storyImg"></div>
	</div>
	<div id="minimiImg" class="minimiImg"><img src="${pageContext.request.contextPath}/${itemList.characterSrc}" width="90px" height="90px"></div>
	</section>
	<table style="width: 420px; height:150px;">
		<tr>								
			<td style="width: 210px; height: 150px;">
				<div style="overflow-y:scroll; width:210px;  height:150px; padding:0px">
					<%-- <c:if test="${storyBasic eq useStory }">
						<input type="radio" name="storyRoom" value="${storyBasic }" checked="checked"  onclick="changeStory(this.value)"><img alt="${resourcePath }/img${storyBasic } " src="${resourcePath }/img${storyBasic }" width="120px"><br/>&nbsp;&nbsp;&nbsp;기본<br/>	
					</c:if>		
			        <c:if test="${storyBasic ne useStory }">
			        	<input type="radio" name="storyRoom" value="${storyBasic }" onclick="changeStory(this.value)"><img alt="${resourcePath }/img${storyBasic } " src="${resourcePath }/img${storyBasic }" width="120px" ><br/>&nbsp;&nbsp;&nbsp;기본<br/>
			        </c:if> --%>
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
			<
			<td style="width: 210px; height: 150px;">
				<div style="overflow-y:scroll; width:210px;  height:150px; padding:0px">
					<%-- <c:if test="${minimiBasic eq useMinimiSrc }">
						<input type="radio" name="minimi" value="${minimiBasic }" checked="checked"  onclick="changeMinimi(this.value)"><img alt="${resourcePath }/img${minimiBasic} " src="${resourcePath }/img${minimiBasic }" width="80px"><br/>&nbsp;&nbsp;&nbsp;기본<br/>	
					</c:if>		
			        <c:if test="${minimiBasic ne useMinimiSrc }">
			        	<input type="radio" name="minimi" value="${minimiBasic }" onclick="changeMinimi(this.value)"><img alt="${resourcePath }/img${minimiBasic} " src="${resourcePath }/img${minimiBasic }" width="80px" ><br/>&nbsp;&nbsp;&nbsp;기본<br/>
			        </c:if> --%>
						<c:if test="${minimiSize ne 0 }">
							<c:forEach var="minimiList" items="${minimiList}">
								<c:if test="${minimiList.articleImg eq itemList.characterSrc}">
									<input type="radio" name="storyRoom" value="${minimiList.articleImg}" checked="checked" onclick="changeMinimi(this.value)"><img alt="" src="${pageContext.request.contextPath}/${minimiList.articleImg}" width="90px" height="90px"><br/>&nbsp;&nbsp;&nbsp;${minimiList.articleName}<br/>
								</c:if>
								<c:if test="${minimiList.articleImg ne itemList.characterSrc}">
									<input type="radio" name="storyRoom" value="${minimiList.articleImg}" onclick="changeMinimi(this.value)"><img alt="" src="${pageContext.request.contextPath}/${minimiList.articleImg}" width="90px" height="90px"><br/>&nbsp;&nbsp;&nbsp;${minimiList.articleName}<br/>
							</c:if>		
						</c:forEach>	
					</c:if>
				</div>
			</td>
		<tr>
	</table>		
	</div>
	<input type="button" id="sendBtn" value ="저장" onclick="saveStoryMinimi()"/>
	<table border="0" width="420" align="center" cellpadding="0" cellspacing="0">
		<tr height="5px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
	</table> 
</form>
</body>
</html>