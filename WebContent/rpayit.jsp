<%@ page language="java" contentType="text/html; charset= utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
    <link href="./styles/pDesign.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"/>
    <link href="./bootstrap-4.5.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class = "containers">
<div class = "newBorder" style = "text-align:center; width: 440px; height: 482px; border:1px solid; margin-left:35%; margin-top:5%;">
       <h4>결제하기를 위해 정보를 입력해주세요.</h4>
       <div style ="width:300px; height:100px;text-align: right;margin:10%;">
            <label>이름: </label>
            <input name="name" type="text" style ="border:none; border-bottom: 1px solid;"><br>
            <label>전화번호: </label>
            <input type="tel" name="telnum" id="tlno" title="전화번호를 알맞은 형식으로 적어주세요 ' - ' 제외시켜주시기 바랍니다" pattern="[0-9]{11}" style ="border:none;  border-bottom: 1px solid;" >
     </div>
            <br>
            <p style = "font-size:24px;">요금: <%= request.getParameter("tPayment") %></p>
            <input type = "hidden" name = "tPaying" value ="<%= request.getParameter("tPayment") %>">
            
            
         
        
         <button  style ="margin-top:20%;" id = "payment" onclick="requestPay()">결제하기</button>
</div>         
         
    <script>
    
    var pathName = '<%= request.getParameter("name") %>';
    var pathNumber = '<%= request.getParameter("telnum") %>';
    var pathAmount = '<%= request.getParameter("tPayment") %>';
   
     
    
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