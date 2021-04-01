<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</head>
<body>

	<table>
		<tr id="tablehead">
				<td>상품</td>
				<td>종류</td>
				<td>상품명</td>
				<td>가격</td>
				<td>구매하기</td>
				<td>장바구니로가기</td>
		</tr>
		<c:forEach var="kinds" items="${ArticleList}">
			<tr>
				<th><img src="${kinds.articleImg}" /></th>
				<th>${kinds.articleKinds}화</th>
				<th>${kinds.articleName}</th>
				<th>${kinds.articlePrice}</th>
				<th><a href="#"
					onclick="bay('${kinds.articleName}'+','+'${kinds.articlePrice}')">구매하기</a></th>
				<th><a href="#" onclick="basket('${kinds.articleName}')">장바구니담기</a></th>
			</tr>
		</c:forEach>
	</table>


</body>
<script>
function basket(ArticleName) {
	var UserSerial = '${sessionVO.userSerial}';
	
	if(UserSerial!=''&&UserSerial!=null){
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
	}else{
		alert("로그인하세요");
	}
}

function bay(ArticleName) {
var UserSerial = '${sessionVO.userSerial}';

if(UserSerial==''&&UserSerial==null){
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
}else{
	alert("로그인하세요");
}

}
</script>
</html>