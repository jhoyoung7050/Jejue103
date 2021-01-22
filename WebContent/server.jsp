<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
</head>
<body>
  <button onclick="requestPay()">결제하기</button>
    <script>
    
    var pathName = '<%= request.getParameter("name") %>';
    var pathNumber = '<%= request.getParameter("telnum") %>';
    var pathAmount = '<%= request.getParameter("tPaying") %>';
   
     
    
    function requestPay(){
    IMP.init("imp20876214"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
 // IMP.request_pay(param, callback) 호출
    IMP.request_pay({ // param
      pg: "html5_inicis",
      pay_method: "card",
      merchant_uid: "ORD20180131-0000011",
      name: "제주에 펜션 103 결제",
      amount: pathAmount , //변수값 이값은 펜션 예약 페이지에서 받아와야함
      buyer_name: pathName,
      buyer_tel: pathNumber,
      m_redirect_url: "pension.html"
    }, function (rsp) { // callback
        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
            // jQuery로 HTTP 요청
            jQuery.ajax({
                url: "https://www.myservice.com/payments/complete", // 가맹점 서버
                method: "POST",
                headers: { "Content-Type": "application/json" },
                data: {
                    imp_uid: rsp.imp_uid,
                    merchant_uid: rsp.merchant_uid
                }
            }).done(function (data) {
              // 가맹점 서버 결제 API 성공시 로직
            })
          } else {
            alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
          }
    });
    }
	    
	    
    </script>
    
    
</body>
</html>
