<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#menuUpdateBoard {
  border-collapse: collapse;
  line-height: 1.5;
  border-left: 1px solid #ccc;
  margin: 20px 10px;
  height: 400px;
}

#menuUpdateBoard thead th {
  padding: 10px;
  font-weight: bold;
  border-top: 1px solid #ccc;
  border-right: 1px solid #ccc;
  background: #dcdcd1;
}
#menuUpdateBoard tbody th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  background: #ececec;
}
#menuUpdateBoard td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}
#content{
	resize: none;
	width: 430px;
	height: 150px;
}
</style>
<body>
	<form id="updateForm" name="updateForm" enctype="multipart/form-data">
		<table id="menuUpdateBoard">
			<thead height="5">
				<tr>
					<th scope="cols" colspan="2">게시물 수정</th>
				</tr>
			</thead>
			<tbody>
				<tr height="5">
					<th scope="row">제목</th>
					<td><input type="text" name="title" id="title" value="${board.title}"></td>
				</tr>
				<tr>
					<td colspan="2">
					내용<br>
						<textarea name="content" id="content">${board.content}</textarea>
					</td>
				</tr>
				<tr>
					<!-- 파일 업로드 -->
					<th scope="row">파일</th>
					<td>
						<div id="fileArea">
						<c:choose>
							<c:when test="${board.file!=null}">
								${board.file}
								<input type="button" value="삭제" onclick="deleteFile();">
							</c:when>
							<c:otherwise>
								<input type="file" name="file1" id="file">
							</c:otherwise>
						</c:choose>
						</div>
					</td>
				</tr>
				<tr style="text-align: right">
					<td colspan="2">
						<input type="hidden" value="${board.boardSerial}" name="boardSerial">
						<input type="hidden" value="${board.file}" name="file">
						<input type="button" value="수정" onclick="updateBoard();">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
<script>
function updateBoard(){
	
	 var form = $("form")[0];       
     var formData = new FormData(form);

     $.ajax({
         cache : false,
         url : "MiniHpBoardUpdate.do", // 요기에
         processData: false,
         contentType: false,
         type : 'POST', 
         data : formData, 
         success : function(data) {
        	 $('#bodyContents').children().remove();
	        $('#bodyContents').html(data);
         }, 
         error : function(xhr, status) {
             alert(xhr + " : " + status);
         }
     });
}
function deleteFile() {
	if(confirm("정말 파일을 삭제하시겠습니까?"))
		$('#fileArea').html('<input type="file" name="file1" id="file">');
}
</script>