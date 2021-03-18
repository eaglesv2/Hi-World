<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>


<script>

	//생략가능
	var IMP = window.IMP;
	IMP.init('imp49542832');
	
    function requestPay() {
      // IMP.request_pay(param, callback) 호출
      IMP.request_pay({ // param
          pg: "html5_inicis",
          pay_method: "card",
          merchant_uid: "ORD20180131-0000011",
          name: "노르웨이 회전 의자",
          amount: 100,
          buyer_email: "gildong@gmail.com",
          buyer_name: "홍길동",
          buyer_tel: "010-4242-4242",
          buyer_addr: "서울특별시 강남구 신사동",
          buyer_postcode: "01181"
      }, function (rsp) { // callback
          if (rsp.success) {
              // 결제 성공 시 로직,
              console.log("성공")
              
          } else {
              console.log("실패")
        	  // 결제 실패 시 로직,
             
          }
      });
    }
    
</script>


</head>
<body>


	 <button onclick="requestPay()">결제하기</button>


</body>
</html>