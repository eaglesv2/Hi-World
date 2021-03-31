<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<h1>장바구니 목록</h1>
	<c:choose>
		<c:when test="${ArticleList != '[]'}">
			<table>
				<tbody id="tbody">
					<c:forEach var="kinds" items="${ArticleList}">
						<tr class="${kinds.articleSerial}">
							<c:set var="check" value="${kinds.articleImg}" />
							<c:if test="${fn:contains(check,'.png')}">
								<th style="width: 27%"><img src="${kinds.articleImg}" onerror="this.src='resources/images/article/music.png'" /></th>
								<th>${kinds.articleKinds}</th>
								<th>${kinds.articleName}</th>
								<th id="${kinds.articleSerial}">${kinds.articlePrice}</th>
								<th onclick="deleteArticle('${kinds.articleSerial}')">삭제</th>
							</c:if>
							<c:if test="${fn:contains(check,'.jsp')}">
								<th><img src="${kinds.articleImg}" onerror="this.src='resources/images/article/music.png'" /></th>
								<th>${kinds.articleKinds}</th>
								<th>${kinds.articleName}</th>
								<th id="${kinds.articleSerial}">${kinds.articlePrice}</th>
								<th onclick="deleteArticle('${kinds.articleSerial}')">삭제</th>
							</c:if>
							<c:if test="${fn:contains(check, '.mp3')}">
								<th><img src="${kinds.articleImg}" onerror="this.src='resources/images/article/music.png'" /></th>
								<th>${kinds.articleKinds}</th>
								<th>${kinds.articleName}</th>
								<th id="${kinds.articleSerial}">${kinds.articlePrice}</th>
								<th onclick="deleteArticle('${kinds.articleSerial}')">삭제</th>
								<%-- <td><input type="button" value="10초 미리듣기"	onclick="PLAY('${kinds.articleImg}')" /></td> --%>
							</c:if>
							<c:set var="total" value="${total+kinds.articlePrice}" />
						</tr>
					</c:forEach>
					<tr class="total">
						<td>총금액 : <b id="totalPrice"></b>원 입니다.
						</td>
					</tr>
					<tr class="total">
						<td><a href="#" onclick="totalBay()">결제하기</a></td>
					</tr>
				</tbody>
			</table>




			
		</c:when>


		<c:otherwise>
			장바구니에 담은 목록이 아무것도 없습니다.
		</c:otherwise>


	</c:choose>

</body>

<script>
	$().ready(function() {
		var total = ${total}
		;
		$("#totalPrice").html(total);
	})
	function deleteArticle(articleSerial) {
		var tr = document.getElementsByClassName(articleSerial);
		var totalTr = $(".total");
		var price = $("#" + articleSerial).text();
		var total = $("#totalPrice").text();
		console.log(price);
		console.log(total);
		$
				.ajax({
					type : "GET",
					url : "delArticle.do",
					data : {
						"ArticleSerial" : articleSerial
					},
					success : function(data) {
						total = total - price;
						if (total === 0) {
							$(tr).remove();
							$(totalTr).remove();
							var innerHtml = "<tr><td>장바구니에 담은 목록이 아무것도 없습니다.</td></tr>";
							$('#tbody').append(innerHtml);
						} else {
							$("#totalPrice").html(total);
							$(tr).remove();
						}
					}
				})

	}

	function totalBay() {
		var total = $("#total").text();
		$.ajax({
			type : "GET",
			url : "totalBay.do",
			data : {
				"total" : total
			},
			success : function(data) {
				if (data === 1) {
					/* 결제 성공 */
					alert("성공")
				} else {
					/* 밤톨부족 결제 실패 */
					alert("실패")
				}
			}
		})
	}
</script>

</html>