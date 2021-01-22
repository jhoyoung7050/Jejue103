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
  <button onclick="requestPay()">�����ϱ�</button>
    <script>
    
    var pathName = '<%= request.getParameter("name") %>';
    var pathNumber = '<%= request.getParameter("telnum") %>';
    var pathAmount = '<%= request.getParameter("tPaying") %>';
   
     
    
    function requestPay(){
    IMP.init("imp20876214"); // "imp00000000" ��� �߱޹��� "������ �ĺ��ڵ�"�� ����մϴ�.
 // IMP.request_pay(param, callback) ȣ��
    IMP.request_pay({ // param
      pg: "html5_inicis",
      pay_method: "card",
      merchant_uid: "ORD20180131-0000011",
      name: "���ֿ� ��� 103 ����",
      amount: pathAmount , //������ �̰��� ��� ���� ���������� �޾ƿ;���
      buyer_name: pathName,
      buyer_tel: pathNumber,
      m_redirect_url: "pension.html"
    }, function (rsp) { // callback
        if (rsp.success) { // ���� ���� ��: ���� ���� �Ǵ� ������� �߱޿� ������ ���
            // jQuery�� HTTP ��û
            jQuery.ajax({
                url: "https://www.myservice.com/payments/complete", // ������ ����
                method: "POST",
                headers: { "Content-Type": "application/json" },
                data: {
                    imp_uid: rsp.imp_uid,
                    merchant_uid: rsp.merchant_uid
                }
            }).done(function (data) {
              // ������ ���� ���� API ������ ����
            })
          } else {
            alert("������ �����Ͽ����ϴ�. ���� ����: " +  rsp.error_msg);
          }
    });
    }
	    
	    
    </script>
    
    
</body>
</html>
