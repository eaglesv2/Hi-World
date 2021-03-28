<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
table.type08 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  border-left: 1px solid #ccc;
  margin: 20px 10px;
}

table.type08 thead th {
  padding: 10px;
  font-weight: bold;
  border-top: 1px solid #ccc;
  border-right: 1px solid #ccc;
  background: #dcdcd1;
}
table.type08 tbody th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  background: #ececec;
}
table.type08 td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
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
<div id="main">
	<table class="type08">
		<thead>
			<tr>
		  		<th scope="cols">${board.title}</th>
				<th scope="cols">
					<input type="button" value="목록" onclick="goToFolder('${board.folderSerial}')">
					<input type="button" value="이동" onclick="showPopup('${board.boardSerial}')">
					<input type="button" value="삭제" onclick="deleteBoard('${board.boardSerial}','${board.file}','${board.folderSerial}')">
					<input type="button" value="수정" onclick="updateBoard('${board.boardSerial}')">
					<input type="hidden" id="boardSerial" value="${board.boardSerial}">
	  			</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td scope="row">작성자: ${board.userName}</td>
				<td>${board.uDate} 조회수: ${board.hit}</td>
			</tr>
			<c:if test="${board.file!=null}">
			<tr>
	  			<td scope="row">첨부파일</td>
	  			<td>
	  				<a onclick="downloadFile('${board.file}');" style="cursor:pointer;">${board.file}</a>
					<%-- <a href="download.do?fileName=${board.file}">${board.file}</a> --%>
				</td>
			</tr>
			</c:if>
			<tr>
	 			<td scope="row" colspan="2">${board.content}</td>
			</tr>
		</tbody>
		<tr>
		 	<td scope="row" colspan="2">
		 		<img alt="" src="resources/images/reply-pen.png" width="10px">
		 		댓글 [${board.replyCnt}]
		 		<input type="button" value="댓글작성" style="float: right" onclick="showReplyForm();">
			</td>
		</tr>
		<tbody id="replyForm" style="display: none;">
			<tr>
 				<td scope="row" colspan="2">
 					<textarea id="replyContent" style="resize: none; width: 390px; height: 100px;"></textarea><br>
					<input type="button" value="취소" style="float: right" onclick="showReplyForm();">
					<input type="button" value="입력" style="float: right" onclick="insertReply('${board.boardSerial}');">
				</td>
			</tr>
		</tbody>
		<c:if test="${board.replyCnt!=0}">
		<tr>
 			<td scope="row" colspan="2">
				<c:forEach items="${replyList}" var="r">
					<span id="reply-${r.replySerial}">
						${r.userName}: ${r.replyContent} (${r.cDate})
						<c:if test="${sessionVO.userSerial==r.userSerial}">
							<img src="resources/images/folder_edit.png" width="10px" class="" height="10px" onclick="updateReplyForm('${r.replySerial}');" style="cursor:pointer;">
							<img src="resources/images/folder_deleted.png" width="10px" height="10px" onclick="deleteReply('${r.replySerial}');" style="cursor:pointer;">
						</c:if>
					</span>
					<span id="replyForm-${r.replySerial}" style="display: none;">
						<input type="text" id="updateReplyContent-${r.replySerial}" value="${r.replyContent}">
						<input type="button" value="수정" onclick="updateReply('${r.replySerial}')">
						<input type="button" value="취소" onclick="updateReplyForm('${r.replySerial}');">
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