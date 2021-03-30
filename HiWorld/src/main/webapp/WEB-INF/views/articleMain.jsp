<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</head>
<body>

	<a href="basketJoin.do">장바구니</a>
	<h1>물품 최신순으로 나열</h1>
	<table>
		<c:forEach var="kinds" items="${ArticleList}">
			<tr>
				<c:set var="check" value="${kinds.articleImg}" />
				<c:if test="${fn:contains(check,'.png')}">
					<td><img src="${kinds.articleImg}" onerror="this.src='resources/images/article/music.png'" /></td>
					<td>${kinds.articleKinds}</td>
					<td>${kinds.articleName}</td>
					<td>${kinds.articlePrice}</td>
					<td><a href="#"	onclick="bay('${kinds.articleName}'+','+'${kinds.articlePrice}')">구매하기</a></td>
					<td><a href="#" onclick="basket('${kinds.articleName}')">장바구니담기</a></td>
				</c:if>
				<c:if test="${fn:contains(check,'.jsp')}">
					<td><img src="${kinds.articleImg}" onerror="this.src='resources/images/article/music.png'" /></td>
					<td>${kinds.articleKinds}</td>
					<td>${kinds.articleName}</td>
					<td>${kinds.articlePrice}</td>
					<td><a href="#"	onclick="bay('${kinds.articleName}'+','+'${kinds.articlePrice}')">구매하기</a></td>
					<td><a href="#" onclick="basket('${kinds.articleName}')">장바구니담기</a></td>
				</c:if>
				<c:if test="${fn:contains(check, '.mp3')}">
					<td><img src="${kinds.articleImg}" onerror="this.src='resources/images/article/music.png'" /></td>
					<td>${kinds.articleKinds}</td>
					<td>${kinds.articleName}</td>
					<td>${kinds.articlePrice}</td>
					<td><input type="button" value="10초 미리듣기"	onclick="PLAY('${kinds.articleImg}')" /></td>
					<td><a href="#"	onclick="bay('${kinds.articleName}'+','+'${kinds.articlePrice}')">구매하기</a></td>
					<td><a href="#" onclick="basket('${kinds.articleName}')">장바구니담기</a></td>
				</c:if>
			</tr>
		</c:forEach>
	</table>


</body>
<script>
function PLAY(mp3) {
	var audio = new Audio(mp3);
	/* 노래 시작 */
	audio.play();

	/* Timeout을 이용해서 10초후 노래 정지*/
	setTimeout(function() {
		audio.pause();
	}, 10000)
	
}

	function basket(ArticleName) {
			var UserSerial = '${sessionVO.userSerial}';
			$.ajax({
				type: "GET",
				url: "basket.do",
				data: {
					"UserSerial" : UserSerial,
					"ArticleName" : ArticleName
				},
				success : function (data) {
					if(data==1){
						alert("성공")
					}else if(data==0){
						alert("이미 구매한 상품")
					}else if(data==-1){
						alert("실패")
					}else if(data==-2){
						alert("이미 장바구니 들어감")
					}
				}
			})
	}
	
	function bay(ArticleName) {
		var UserSerial = '${sessionVO.userSerial}';
		
		/* alert 창 */
		const swalWithBootstrapButtons = Swal.mixin({
 			customClass: {
    		cancelButton: 'btn btn-danger',
    		confirmButton: 'btn btn-success'
  			},
  			buttonsStyling: false
		})

		swalWithBootstrapButtons.fire({
	  		title: '정말 구매하실껀가요??',
			text: "구매 하신 후 환불은 어렵습니다.",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonText: '구매 하지 않겠습니다.',
			cancelButtonText: '구매 하겠습니다.',
			reverseButtons: true
		}).then((result) => {
			
			if (result.isConfirmed) {
				swalWithBootstrapButtons.fire(
	 				      '취소 하였습니다.'
	 				    )
 		} else if (result.dismiss === Swal.DismissReason.cancel) {
 			$.ajax({
					type: "GET",
					url: "bay.do",
					data:{
						"UserSerial" : UserSerial,
						"ArticleName" : ArticleName
					},
					success: function (data) {
						if(data==1){
							swalWithBootstrapButtons.fire(
							     '결제 성공 하였습니다.'
			    			)
						}else if(data==0){
							swalWithBootstrapButtons.fire(
							     '밤톨이 부족합니다'
			    				)
						}else if(data==-1){
							swalWithBootstrapButtons.fire(
						    	 '이미 구매한 상품입니다.'
			    			)
						}
					}
				})
		}
		})
	}
</script>

</html>