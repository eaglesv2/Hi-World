<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#feedback { font-size: 1.4em; }
/* 
[id*='selectable'] .ui-selecting { background: #FECA40; }
[id*='selectable'] .ui-selected { background: #FF6600; color: white; }
[id*='selectable'] { list-style-type: none; margin: 0; padding: 0; width: 100%; }
[id*='selectable'] li { margin: 3px; padding: 0.4em; font-size: 1.4em; height: 13px; font-size: 10px; font: 굴림; overflow: hidden;}
*/
#selectableNotUsingSong .ui-selecting { background: #FECA40; }
#selectableNotUsingSong .ui-selected { background: #FF6600; color: white; }
#selectableNotUsingSong { list-style-type: none; margin: 0; padding: 0; width: 100%; }
#selectableNotUsingSong li { margin: 3px; padding: 0.4em; font-size: 1.4em; height: 13px; font-size: 10px; font: 굴림; overflow: hidden;}

</style>
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(function() {
		/* document.addEventListener("contextmenu",function(e) { 
			if (e.target.nodeName === "IMG") { 
				e.preventDefault(); 
			} 
		}, false); */
	
		$('#buttonToUsing').attr('draggable', false);	
		$('#buttonToNotUsing').attr('draggable', false);	
		
		$("#selectableNotUsingSong").selectable({
			stop: function() {
				var notUsingSong = "";
				$(".ui-selected", this).each(function() {
					var index = $("#selectableNotUsingSong li").index(this);
					notUsingSong += $("#selectableNotUsingSong li:eq("+index+")").text()+"!sep!";
				});
			}
		});
		$("#selectableUsingSong").selectable({
			stop: function() {
				usingSong="";
				$(".ui-selected", this).each(function() {
					var index = $("#selectableUsingSong li").index(this);
					usingSong += $("#selectableUsingSong li:eq("+index+")").text()+"!sep!";
				});
			}
		});
	});
	
	$("#buttonToUsing").click(function(){
		array = notUsingSong.substring(0,notUsingSong.lastIndexOf("!sep!")).split("!sep!");
		
		for(var i=0;i<array.length;i++){
			$("#selectableUsingSong").append("<li class=\"ui-widget-content\">"+array[i]+"</li>");
			$("#selectableNotUsingSong li:contains('"+array[i]+"')").remove();
		}
		notUsingSong = null;
	 });
	
	$("#buttonToNotUsing").click(function(){
		array = usingSong.substring(0,usingSong.lastIndexOf("!sep!")).split("!sep!");
		
		for(var i=0;i<array.length;i++){
			$("#selectableNotUsingSong").append("<li class=\"ui-widget-content\">"+array[i]+"</li>");
			$("#selectableUsingSong li:contains('"+array[i]+"')").remove();
		}
		usingSong = null;
	 });
})
	<%-- 
	
		$("#sendChangedSetting").click(function(){
			var usingSongToSend="";
			
			for(var i=0;i<$("#selectableUsingSong li").length;i++){
				usingSongToSend+=$( "#selectableUsingSong li:eq("+i+")" ).text()+"!sep!";
			}
			
			params="usingSongToSend="+usingSongToSend;
			
			$.ajax({
				 type:"POST",
				 url:"<%=cp%>/cy/setting/changeUsingSong_ok.action",
				 data:params,
				 success:function(args){
					 window.parent.location.href = "<%=cp%>/cy/my_main.action";
				 },
				 error:function(e){
					 window.parent.location.href = "<%=cp%>/cy/my_main.action";
				 }			 
			 });
		 });
	}); --%>
</script>
</head>
<body>
<div align="center" style="border: 0px solid black;width: 95%;height: 85%;background-color: #F6F6F6;border-top: 2px solid #BDBDBD;
	border-bottom: 2px solid #BDBDBD;">
	<div align="left" style="border: 0px solid black;width: 30%;height: 20px;float: left;margin-left: 72px;font-size: 9pt;font: 굴림;font-weight: bold;margin-top: 10px;">
		구입한 음악
	</div>
	<div align="right" style="border: 0px solid black;width: 30%;height: 20px;float: right;margin-right: 65px;font-size: 9pt;font: 굴림;font-weight: bold;margin-top: 10px;">
		사용 중인 음악
	</div>
	<div style="border: 2px solid #BDBDBD;width: 159px;float: left;height: 300px;overflow:auto;word-wrap:break-word;background-color: white;
		margin-left: 17px;">
		<ol id="selectableNotUsingSong">
			<c:forEach var="notUsingSong" items="${notUsingSongList}">
				<li class="ui-widget-content">${notUsingSong.musicTitle}</li>
			</c:forEach>
		</ol>
	</div>
	<div style="border: 0px solid #BDBDBD;width: 20%;height: 300px;float: left;">
		<img id="buttonToUsing" alt="no found" src="${pageContext.request.contextPath}/resources/images/admin/changeSong_right.png" height="50px" width="50px" style="padding-top: 90px;"
			onmousedown="this.src='${pageContext.request.contextPath}/resources/images/admin/changeSong_pressedRight.png'"
			onmouseup="this.src='${pageContext.request.contextPath}/resources/images/admin/changeSong_right.png'"><br/>
		<img id="buttonToNotUsing" alt="no found" src="${pageContext.request.contextPath}/resources/images/admin/changeSong_left.png" height="50px" width="50px"
			onmousedown="this.src='${pageContext.request.contextPath}/resources/images/admin/changeSong_pressedLeft.png'"
			onmouseup="this.src='${pageContext.request.contextPath}/resources/images/admin/changeSong_left.png'">
	</div>
	<div style="border: 2px solid #BDBDBD;width: 159px;float: left;height: 300px;overflow:auto;word-wrap:break-word;background-color: white;">
		<ol id="selectableUsingSong">
			<c:forEach var="playList" items="${playList}">
				<li class="ui-widget-content">${playList.musicTitle}</li>
			</c:forEach>
		</ol>
	</div>
	<br>
	<div align="right" style="border: 0px solid black;width: 100%;height: 30px;">
		<input type="button" id="sendChangedSetting" value="저장" style="margin-right: 8px;margin-top: 6px;">
	</div>
</div>
</body>
</html>