<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
 .neiWordBtn{
 	background-color: white;
	border: 1px solid gray;
	border-radius: 5px;
 }
</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
 
 /* $(document).ready(function(){
	    initSet();
	});
 
 function initSet(){
		sendRequest("my_get_MemberBoard.action",null,displayInfo,"GET");
}
 

 function displayInfo(){
 	if(httpRequest.readyState==4){
 		if(httpRequest.status==200){
 			str_i = httpRequest.responseText;
 			var memberBoard = document.getElementById("memberBoard");
 			memberBoard.innerHTML = str_i;	
 		}
 	}
 }
 
 function deleteComment(userId){
	 var params = "userId="+userId;
	 sendRequest("my_get_MemberBoard_delete.action",params,displayInfo,"GET");
 }
 
 
 function moveToUser(userId){
	 window.open("user_main.action?userId="+userId,userId,"width=1090,height=600,location=no,status=no,scrollbars=no");
 } */

 </script>

 <body>
 <div style="width: 465px; height: 430px; overflow-x: hidden;">
 <div>
	<table bgcolor="#DBDBDB" width="440" cellpadding="1" cellspacing="1">
		<tr bgcolor="#FFFFFF" >
			<td colspan="2"><font class="updateBoard" style="color: #1294AB; font-weight: 900;">Updated News</font></td>
		</tr>
		<tr bgcolor="#FFFFFF" style="font-size:9pt;">
			<td width="240" height="70">
				<c:if test="${latestPosts==null}">
					<span style="text-align: center;"><br/>등록된 게시물이 없습니다<br/>소식이 뜸한 친구에게 마음의 한마디를<br/>남겨주세요.<br/><br/><br/></span>
				</c:if>
				<c:if test="${latestPosts!=null}">
					<c:forEach items="${latestPosts}" var="p">
						<c:if test="${p.boardSerial!=0}"><img alt="not found" src="resources/images/title-board.png" width="25"></c:if>
						<c:if test="${p.pictureSerial!=0}"><img alt="not found" src="resources/images/title-picture.png" width="25"></c:if>
						<c:if test="${p.videoSerial!=0}"><img alt="not found" src="resources/images/title-video.png" width="25"></c:if>
						<span>${p.title}<br/></span>
					</c:forEach>
				</c:if>
			</td>
			<td valign="center">  
				
				<table bgcolor="#FFFFFF" width="200" align="center" cellpadding="2" cellspacing="0">
					<tr>
						<td>
							<c:if test="${miniHpUserMenuVO.menu3==1}">
								<span onclick="movePicture();" style="cursor: pointer;">사진첩</span>
								${today.pictureCntToday}/${today.pictureCnt}
								<c:if test="${today.pictureCntToday>0}">
									<img alt="new" src="resources/images/title-new.png">
								</c:if>
							</c:if>
						</td>
						<td>
							<c:if test="${miniHpUserMenuVO.menu4==1}">
								<span onclick="moveBoard();" style="cursor: pointer;">게시판</span>
								${today.boardCntToday}/${today.boardCnt}
								<c:if test="${today.boardCntToday>0}">
									<img alt="new" src="resources/images/title-new.png">
								</c:if>
							</c:if>
						</td>
					</tr>
					<tr>
						<td>
							<c:if test="${miniHpUserMenuVO.menu5==1}">
								<span onclick="moveVideo();" style="cursor: pointer;">비디오</span>
								${today.videoCntToday}/${today.videoCnt}
								<c:if test="${today.videoCntToday>0}">
									<img alt="new" src="resources/images/title-new.png">
								</c:if>
							</c:if>
						</td>
						<td>
							<c:if test="${miniHpUserMenuVO.menu6==1}">
								<span onclick="moveBook();" style="cursor: pointer;">방명록</span>
								${today.bookCntToday}/${today.bookCnt}
								<c:if test="${today.bookCntToday>0}">
									<img alt="new" src="resources/images/title-new.png">
								</c:if>
							</c:if>
						</td>
					</tr>
				</table>

			</td>
		</tr>
	</table>

	
	<img src="${pageContext.request.contextPath}/resources/images/bar.jpg" width="440" height="6" border="0" alt="라인">

	<table bgcolor="#DBDBDB" width="440" cellpadding="1" cellspacing="1">
		<tr bgcolor="#FFFFFF" >
			<td align="center"  colspan="2">  
				<font><b>나의 미니미와 스토리룸을 소개합니다.</b></font>	
			</td>
		</tr>
		<tr bgcolor="#FFFFFF">
			<td align="center" colspan="2">  
				<img <%-- src="${resourcePath}/img${useStoryRoom}" --%> src= "${pageContext.request.contextPath}/resources/images/r_myhome.gif" width="389" height="192" border="0" alt="">
				<img src="${resourcePath}/img${useMinimi.getOriginalFileName()}" alt="" style="position: absolute; top :${useMinimi.getImgY()}; left : ${useMinimi.getImgX()};"/>
			</td>
		</tr>
	</table><br/>
		
		
		<div style="background-color: #F2F2F2;">
			<div style="color: #1294AB; font-weight: bold; float: left; margin-left: 5px;">이웃평</div>
			<!-- 일촌 관계만 보이게 하기 -->
			<div style="float: none;">
				<input id="neiWordContent" type="text" style="width: 330px;" >
				<input class="neiWordBtn" type="button" value="등록" style="cursor: pointer;" onclick="insertNeiWord();">
			</div>
		</div>
		<div id="neiWord" style="width: 100%;background-color: #F2F2F2; text-align: left;">
		
		</div>
</div>
</div>
</body>
<script>
	//이웃평 불러오기
	$('#neiWord').load("MiniHP_NeiWord.do");
	//이웃평 insert
	function insertNeiWord() {
		var content = $('#neiWordContent').val();
		if(content==="")
			alert('내용을 입력하세요');
		else{
			$.ajax({
				type: 'POST',
				url: 'MiniHP_NeiWord.do/'+content,
				datatype: 'json',
				contentType:'application/json; charset=utf-8'
			}).done(function() {
				$('#neiWord').load("MiniHP_NeiWord.do");
				$('#neiWordContent').val("");
			}).fail(function(error) {
				alert(JSON.stringify(error));
			});
		}
	}
	//delete
	function deleteNeiWord(serial) {
		if(confirm("정말 삭제하시겠습니까?")){
			$.ajax({
				type: 'DELETE',
				url: 'MiniHP_NeiWord.do/'+serial,
				datatype: 'json',
				contentType:'application/json; charset=utf-8'
			}).done(function(data) {
				$('#neiWord').load("MiniHP_NeiWord.do");
			}).fail(function(error) {
				alert(JSON.stringify(error));
			});
		}
	}
	//update 칸 만들기
	function updateNeiWordForm(serial) {
		$('#reply-'+serial).toggle();
		$('#replyForm-'+serial).toggle();
	}
	function updateNeiWord(serial) {
		var content = $('#updateReplyContent-'+serial).val();
		if(content==="")
			alert('내용을 입력하세요');
		else{
			console.log(content);
			$.ajax({
				type: 'PUT',
				url: 'MiniHP_NeiWord.do/'+serial+'/'+content,
				datatype: 'json',
				contentType:'application/json; charset=utf-8'
			}).done(function() {
				$('#neiWord').load("MiniHP_NeiWord.do");
			}).fail(function(error) {
				alert(JSON.stringify(error));
			});
		}
	}
</script>