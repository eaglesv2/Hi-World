<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.4.js"></script>


<script>
	//생략가능
	var IMP = window.IMP;

	IMP.init('imp29852102');

	// 로그인한사람 정보
	var id = "${vo.userID}"
	var name = "${vo.userName}"
	var tel = "${vo.userTel}"
	var addr = "${vo.userAddress}"
	var userCash = ${vo.userCash}

	// 결제 시스템
	function requestPay() {

		// 체크박스 체크여부
		var check = $('input[name=check]:checked').val()
		var bamTol
		var sell
		var count

		if (check == '10000') {
			bamTol = '밤톨10개'
			sell = 10000;
			count = 10
		} else if (check == '28000') {
			bamTol = '밤톨30개'
			sell = 29900;
			count = 30
		} else if (check == '45000') {
			bamTol = '밤톨50개'
			sell = 48900;
			count = 50
		} else if (check == '90000') {
			bamTol = '밤톨100개'
			sell = 90000;
			count = 100
		} else {
			sell = 0;
		}

		if (sell != 0) {
			// IMP.request_pay(param, callback) 호출
			IMP.request_pay({ // param
				pg : "html5_inicis",
				pay_method : "card",
				merchant_uid : "ORD20180131-0000011",
				name : bamTol,
				amount : sell,
				buyer_name : name,
				buyer_tel : tel,
				buyer_addr : addr
			}, function(rsp) { // callback
				if (rsp.success) {
					// 결제 성공 시 로직,
					$.ajax({
						type : "GET",
						url : "userCash.do",
						dataType : "int",
						data : {
							"count" : count,
							"UserCash" : userCash
						},
						error : function(data) {
							alert("실패")
						},
						success : function(data) {
							alert("결제 성공")
						}
					})

				} else {
					alert("결제 실패")
					// 결제 실패 시 로직,
					$.ajax({
						type : "GET",
						url : "userCash.do",
						dataType : "int",
						data : {
							"count" : count,
							"UserCash" : userCash
						},
						error : function(data) {
							alert("실패")
						},
						success : function(data) {
							alert("결제 성공")
						}
					})

				}
			});
		}

	}

</script>


</head>
<body>

	<input type="radio" name="check" value="10000" />밤톨 10개 구매 10000원
	<br />
	<input type="radio" name="check" value="28000" />밤톨 30개 구매 28000원
	<br />
	<input type="radio" name="check" value="45000" />밤톨 50개 구매 45000원
	<br />
	<input type="radio" name="check" value="90000" />밤톨 100개 구매 90000원
	<br />

	<button onclick="requestPay()">결제하기</button>


</body>
</html>