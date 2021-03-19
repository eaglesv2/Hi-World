<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#menuBoardInsert {
  border-collapse: collapse;
  line-height: 1.5;
  border-left: 1px solid #ccc;
  margin: 20px 10px;
  height: 400px;
}

#menuBoardInsert thead th {
  padding: 10px;
  font-weight: bold;
  border-top: 1px solid #ccc;
  border-right: 1px solid #ccc;
  background: #dcdcd1;
}
#menuBoardInsert tbody th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  background: #ececec;
}
#menuBoardInsert td {
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
	<form id="insertForm" action="MiniHpBoardInsert.do" method="post">
		<table id="menuBoardInsert">
			<thead height="5">
				<tr>
					<th scope="cols" colspan="2">게시물 업로드</th>
				</tr>
			</thead>
			<tbody>
				<tr height="5">
					<th scope="row">제목</th>
					<td><input type="text" name="title" id="title"></td>
				</tr>
				<tr>
					<td colspan="2">
					내용<br>
						<textarea name="content" id="content"></textarea>
					</td>
				</tr>
				<tr>
					<!-- 파일 업로드 -->
					<td colspan="2">
					</td>
				</tr>
				<tr style="text-align: right">
					<td colspan="2">
						<input type="button" value="ajax메소드" onclick="insertBoard();">
						<input type="submit" value="form태그submit">
						<input type="reset" value="취소">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
<script>
function insertBoard(){
	var data = {
		title : $('#title').val(),
		content : $('#content').val()
	}
	console.log(JSON.stringify(data));
	$.ajax({
		type: 'POST',
		url: 'MiniHpBoardInsert.do',
		datatype: 'json',
		contentType:'application/json; charset=utf-8',
		data: JSON.stringify(data)
	}).done(function() {
		alert('글이 등록되었습니다.');
		moveBoard('miniHpBoard.do?menu=menu4');
	}).fail(function(error) {
		alert(JSON.stringify(error));
	});
}
</script>