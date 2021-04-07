<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hi-World</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/파비콘.png" type="image/x-icon">
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/파비콘.png" type="image/x-icon">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.4.js"></script>
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/BamTolCharge.css">
<script type="text/javascript">
	//생략가능
	var IMP = window.IMP;

	IMP.init('imp19609949');

	// 로그인한사람 정보
	var id = "${sessionVO.userID}"
	var name = "${sessionVO.userName}"
	var tel = "${sessionVO.userTel}"
	var addr = "${sessionVO.userAddress}"
	var userCash = ${sessionVO.userCash}

	// 결제 시스템
	function requestPay() {
	
		// 체크박스 체크여부
		if($('#checkbox').is(':checked')==true){
			var bamTol
			var sell
			var count
			console.log(check);
			if (check == '충전 예정금액 : 10000원') {
				bamTol = '밤톨10개'
				sell = 10000;
				count = 10
			} else if (check == '충전 예정금액 : 28000원') {
				bamTol = '밤톨30개'
				sell = 29900;
				count = 30
			} else if (check == '충전 예정금액 : 45000원') {
				bamTol = '밤톨50개'
				sell = 48900;
				count = 50
			} else if (check == '충전 예정금액 : 90000원') {
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
							data : {
								"count" : count,
								"UserCash" : userCash
							},
							success : function(data) {
								alert("결제 성공")
								opener.document.location.reload();
								self.close();
							}
						})

					} else {
						alert("결제 실패")
						// 결제 실패 시 로직,
						$.ajax({
							type : "GET",
							url : "userCash.do",
							data : {
								"count" : count,
								"UserCash" : userCash
							},
							success : function(data) {
								alert("결제 성공")
								opener.document.location.reload();
								self.close();
							}
						})

					}
				});
			}
		}else if ($('#checkbox').is(':checked')==false) {
			alert('동의에 수락하세요')
		}
		

	}
	
	function focus(){
		$('.price1').css({'border':'1px solid red'});
		console.log('dddd')
	}
	
	function blur(){
// 		$('.price1').css({'border':'1px solid #b5b5b5'});
	}
	function price1(){
		$('#chargeEX').val('충전 예정금액 : 10000원');
		$('.price1').css({'border':'1px solid red'});
		$('.price2').css({'border':'1px solid #b5b5b5'});
		$('.price3').css({'border':'1px solid #b5b5b5'});
		$('.price4').css({'border':'1px solid #b5b5b5'});	
		$("#imgID").attr("src", "resources/images/admin/밤톨.png");
	}
	function price2(){
		$('#chargeEX').val('충전 예정금액 : 28000원')
		$('.price1').css({'border':'1px solid #b5b5b5'});
		$('.price2').css({'border':'1px solid red'});
		$('.price3').css({'border':'1px solid #b5b5b5'});
		$('.price4').css({'border':'1px solid #b5b5b5'});	
		$("#imgID").attr("src", "resources/images/admin/밤톨3.png");
	}
	function price3(){
		$('#chargeEX').val('충전 예정금액 : 45000원');
		$('.price1').css({'border':'1px solid #b5b5b5'});
		$('.price2').css({'border':'1px solid #b5b5b5'});
		$('.price3').css({'border':'1px solid red'});
		$('.price4').css({'border':'1px solid #b5b5b5'});	
		$("#imgID").attr("src", "resources/images/admin/밤톨5.png");
	}
	function price4(){
		$('#chargeEX').val('충전 예정금액 : 90000원')
		$('.price1').css({'border':'1px solid #b5b5b5'});
		$('.price2').css({'border':'1px solid #b5b5b5'});
		$('.price3').css({'border':'1px solid #b5b5b5'});
		$('.price4').css({'border':'1px solid red'});	
		$("#imgID").attr("src", "resources/images/admin/밤톨10.png");
	}
	


</script>


</head>
<body>
	<div id="chargeContainer">
		<div id="leftCon">
			<div id="logo">
				<div>
					<img id="imgID" src="resources/images/admin/밤톨메인.png" alt="이미지가 들어갑니다." />
				</div>
			</div>
			
			<div class="chargeEX" >
				<input type="text" id="chargeEX" readonly disabled/>
			</div>
		</div>
		<div id="rightCon">
				<div id="bamtolinfo">
					<label>밤톨을 구매하기 위한 창입니다.</label>
				</div>
				<div id="bamtolprice">
					<div id="priceinfo">
						<label> 결제 금액</label>
					</div>
					<div class="price1" onclick="price1()" onfocus="focus()" onblur="blur()">
						<div id="price1_1">
							밤톨 10개
						</div>
						<div id="price1_2">
							10,000원
						</div>
					</div>
					<div class="price2" onclick="price2()">
						<div id="price2_1">
							밤톨 30개
						</div>
						<div id="price2_2">
							28,000원
						</div>
					</div>
					<div class="price3" onclick="price3()">
						<div id="price3_1">
							밤톨 50개
						</div>
						<div id="price3_2">
							45,000원
						</div>
					</div>
					<div class="price4" onclick="price4()">
						<div id="price4_1">
							밤톨 100개
						</div>
						<div id="price4_2">
							90,000원
						</div>
					</div>
				</div>
				<div id="paymentinfo">
					<div id="priceagree">
						<label>
							약관 동의
						</label>
						
					</div>
					
					<div >
						<div id="agreetext">
							<input type="text" id="agreeinput" value="안녕하세요 회원 약관입니다. 문진이형은 20만원을 가져오시오" readonly disabled="disabled"/>
						</div>
						<div id="selectinfo">
							<input type="text" id="checkinput" value="상품 가격을 확인하였으며 , 계약 관련 고지사항 및 BT정책 및 결제 진행에 동의합니다."/>
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