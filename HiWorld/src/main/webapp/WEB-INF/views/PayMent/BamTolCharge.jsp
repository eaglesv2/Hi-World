<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.4.js"></script>
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/BamTolCharge.css">
<script>
	//생략가능
	var IMP = window.IMP;

	IMP.init('imp29852102');

	// 로그인한사람 정보
	var id = "${sessionVO.userID}"
	var name = "${sessionVO.userName}"
	var tel = "${sessionVO.userTel}"
	var addr = "${sessionVO.userAddress}"
	var userCash = ${sessionVO.userCash}

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
	<div id="chargeContainer">
		<div id="leftCon">
			<div id="logo">
				<div>
					<img src="resources/images/미니미.jpg" alt="이미지가 들어갑니다." />
				</div>
			</div>
			
			<div >
				
			</div>
		</div>
		<div id="rightCon">
				<div id="bamtolinfo">
					<label>밤톨을 구매하기 위한 창입니다.</label>
				</div>
				<div id="bamtolprice">
					<div id="priceinfo">
					
					</div>
					<div id="price1">
						
					</div>
					<div id="price2">
					
					</div>
					<div id="price3">
					
					</div>
					<div id="price4">
					
					</div>
				</div>
				<div id="paymentinfo">
					<div id="priceCount">
					
					</div>
					
					<div id="agreetext">
						<input type="text" id="agreeinput" />
						<div id="selectinfo">
							<input type="checkbox" id="checkbox" />
						</div>
					</div>
				</div>
				<div id="paybutton">
					<button onclick="requestPay()">결제하기</button>
				</div>
				
		</div>
	</div>

</body>
</html>