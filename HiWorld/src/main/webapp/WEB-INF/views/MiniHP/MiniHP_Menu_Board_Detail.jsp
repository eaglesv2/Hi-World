<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
table.type08 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  margin: 20px 10px;
  width: 410px;
}

table.type08 thead th {
  border-bottom: 1px dotted #ccc;
  font-weight: normal;
}
table.type08 tbody th {
  vertical-align: top;
  border-bottom: 1px dotted #ccc;
  background: #ececec;
}
table.type08 td {
  vertical-align: top;
  border-bottom: 1px dotted #ccc;
}
#main{
	height: 420px;
	width: 450px;
	overflow-y: scroll;
	-ms-overflow-style: none;
}
#main::-webkit-scrollbar{
	display: none;
}
</style>
<body>
<input type="hidden" id="boardSerial" value="${board.boardSerial}">
<div id="main">
<table class="type08">
	<thead>
		<tr>
	  		<th>
	  			<font style="font-weight: bold;">${board.title}</font>
	  			<span style="float: right;">
	  				<span onclick="goToFolder('${board.folderSerial}');" onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='black';" style="font-size:10pt;">목록</span>
	  				<span onclick="showPopup('${board.boardSerial}');" onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='black';" style="font-size:10pt;">이동</span>
	  				<span onclick="deleteBoard('${board.boardSerial}','${board.file}','${board.folderSerial}');" onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='black';" style="font-size:10pt;">삭제</span>
	  				<span onclick="updateBoard('${board.boardSerial}');" onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='black';" style="font-size:10pt;">수정</span>
	  			</span>
	  		</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td scope="row">
				${board.userName}
				<span style="font-size: 5px; float: right; padding-top: 5px;">
				(<fmt:formatDate value="${board.uDate}" pattern="yyyy-MM-dd"/>)
				조회수: ${board.hit}
				</span>
			</td>
		</tr>
		<c:if test="${board.file!=null}">
		<tr>
  			<td style="border-bottom: none;">
  				<span style="font-size: 5px; float: right; padding-top: 5px;">
  				<font style="color: gray;">첨부파일 : </font>
  				<a onclick="downloadFile('${board.file}');" style="cursor:pointer;">${board.file}</a>
				</span>
			</td>
		</tr>
		</c:if>
		<tr>
 			<td style="height: 200px;">
 				<span style="width: 400px; text-overflow: ellipsis; overflow: hidden;">
 					${board.content}
 				</span>
			</td>
		</tr>
	</tbody>
	<tr>
	 	<td scope="row">
	 		<img alt="" src="resources/images/reply-pen.png" width="10px">
	 		<font style="font-size: 10pt;">댓글 [${board.replyCnt}]</font>
	 		<span onclick="showReplyForm();" onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='black';" style="font-size:10pt; float: right">댓글작성</span>
		</td>
	</tr>
	<tbody id="replyForm" style="display: none;">
		<tr>
			<td scope="row">
				<textarea id="replyContent" style="resize: none; width: 390px; height: 100px;"></textarea><br>
				<input type="button" value="취소" style="float: right" onclick="showReplyForm();">
				<input type="button" value="입력" style="float: right" onclick="insertReply('${board.boardSerial}');">
			</td>
		</tr>
	</tbody>
	<c:if test="${board.replyCnt!=0}">
	<tr style="background: #EBE9E9;">
			<td scope="row">
			<c:forEach items="${replyList}" var="r">
				<span id="reply-${r.replySerial}">
					${r.userName}: ${r.replyContent}
					<span style="font-size: 5px; padding-top: 5px; color: gray;">
					(<fmt:formatDate value="${r.cDate}" pattern="yyyy-MM-dd"/>)
					</span>
					<c:if test="${sessionVO.userSerial==r.userSerial}">
						<img src="resources/images/folder_edit.png" width="10px" class="" height="10px" onclick="updateReplyForm('${r.replySerial}');" style="cursor:pointer;">
						<img src="resources/images/x-delete.png" width="10px" height="10px" onclick="deleteReply('${r.replySerial}');" style="cursor:pointer;">
					</c:if>
				</span>
				<span id="replyForm-${r.replySerial}" style="display: none;">
					<input type="text" id="updateReplyContent-${r.replySerial}" value="${r.replyContent}">
					<%-- <input type="button" value="수정" onclick="updateReply('${r.replySerial}')">
					<input type="button" value="취소" onclick="updateReplyForm('${r.replySerial}');"> --%>
					<span style="font-size:9pt;font-weight: bold;color: #1294AB; cursor: pointer;" onclick="updateReply('${r.replySerial}');">
						수정
					</span>
					<span style="font-size:9pt;font-weight: bold;color: #1294AB; cursor: pointer;" onclick="updateReplyForm('${r.replySerial}');">
						취소
					</span>
				</span>
				<br>
			</c:forEach>
		</td>
	</tr>
	</c:if>
</table>
</div>
</body>
<script>
function downloadFile(file) {
	location.href="download.do?fileName="+file;
}
function showPopup(serial) {
	window.open("updateBoardFolder.do?serial="+serial, "게시글 폴더 이동", "width=400, height=300, left=100, top=50");
}
function goToFolder(folderSerial) {
	var ajaxMain = {
            url : 'miniHpBoard.do?folderSerial='+folderSerial,
            async : true,
            type : "GET",
            dataType : "html",
            cache : false
    };
    
    $.ajax(ajaxMain).done(function(data){
        // Contents 영역 삭제
        $('#bodyContents').children().remove();
        // Contents 영역 교체
        $('#bodyContents').html(data);
    });
}
function deleteBoard(boardSerial,file,folderSerial) {
	if(confirm("정말 삭제하시겠습니까?")){
		$.ajax({
			type: 'DELETE',
			url: 'miniHpBoard.do?boardSerial='+boardSerial+"&fileName="+file,
			datatype: 'html'
		}).done(function(data) {
			goToFolder(folderSerial);
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
}
function updateBoard(boardSerial) {
	var ajaxMain = {
            url : 'MiniHpBoardUpdate.do?serial='+boardSerial,
            async : true,
            type : "GET",
            dataType : "html",
            cache : false
    };
    
    $.ajax(ajaxMain).done(function(data){
        // Contents 영역 삭제
        $('#bodyContents').children().remove();
        // Contents 영역 교체
        $('#bodyContents').html(data);
    });
}
//댓글 작성 화면 펼치기
function showReplyForm() {
	$('#replyForm').toggle();
}
//detail 페이지 다시 불러옴
function refresh(boardSerial) {
	var ajaxOption = {
            url : "MiniHpBoardDetail.do?serial="+boardSerial,
            async : true,
            type : "GET",
            dataType : "html",
            cache : false
    };
    
    $.ajax(ajaxOption).done(function(data){
        $('#bodyContents').children().remove();
        $('#bodyContents').html(data);
    });
}
function insertReply(boardSerial) {
	var replyContent = $('#replyContent').val();
	if(replyContent==="")
		alert('내용을 입력하세요');
	else{
		var data = {
			replyContent : replyContent,
			boardSerial : boardSerial
		}
		console.log(JSON.stringify(data));
		$.ajax({
			type: 'POST',
			url: 'MiniHpBoardReply.do',
			datatype: 'json',
			contentType:'application/json; charset=utf-8',
			data: JSON.stringify(data)
		}).done(function() {
			refresh(boardSerial);
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
}
function deleteReply(serial) {
	if(confirm("정말 삭제하시겠습니까?")){
		$.ajax({
			type: 'DELETE',
			url: 'MiniHpBoardReply.do/'+serial,
			datatype: 'json',
			contentType:'application/json; charset=utf-8'
		}).done(function(data) {
			var boardSerial = $('#boardSerial').val();
			refresh(boardSerial);
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
}
//update 칸 만들기
function updateReplyForm(serial) {
	$('#reply-'+serial).toggle();
	$('#replyForm-'+serial).toggle();
}
function updateReply(serial) {
	var content = $('#updateReplyContent-'+serial).val();
	if(content==="")
		alert('내용을 입력하세요');
	else{
		console.log(content);
		$.ajax({
			type: 'PUT',
			url: 'MiniHpBoardReply.do/'+serial+'/'+content,
			datatype: 'json',
			contentType:'application/json; charset=utf-8'
		}).done(function() {
			var boardSerial = $('#boardSerial').val();
			refresh(boardSerial);
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
}
</script>