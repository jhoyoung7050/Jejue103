<%@ page language="java" contentType="text/html; charset= utf-8" pageEncoding="utf-8"%>
    <%@ page import = "java.sql.*" %>
    
<html>
	<head>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
    <link href="./styles/pDesign.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"/>
    <link href="./bootstrap-4.5.3/dist/css/bootstrap.min.css" rel="stylesheet">
	</head>
	<body>
	
	
	<p id = "myFrame" onload = "request();"></p>
	


<script>
window.onload =function request(){
	 document.getElementById( 'myFrame' );
	var pathAmounts = '<%= request.getParameter("tPaying") %>';
	var pathName = '<%= request.getParameter("name") %>';
	var pathNumber = '<%= request.getParameter("telnum") %>';
    
    IMP.init("imp20876214"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
 // IMP.request_pay(param, callback) 호출
    IMP.request_pay({ // param
      pg: "html5_inicis",
      pay_method: "card",
      merchant_uid: "ORD20180131-0000011",
      name: "제주에 펜션 103 결제",
      amount: pathAmounts , //변수값 이값은 펜션 예약 페이지에서 받아와야함
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

   <%
	   String strID ="46";
	   String strName =  request.getParameter("name");
	   String strPhone = request.getParameter("telnum");
	   String strSdate = "1";
	   String strDdate = "1";
	   
        Connection conn = null;
        Statement stmt;
      

   
              Class.forName("com.mysql.jdbc.Driver");
              String jdbcurl = "jdbc:mysql://localhost:3306/guest?serverTimezone=UTC";
              conn = DriverManager.getConnection(jdbcurl, "root", "Jung90500!");
              stmt = conn.createStatement();
              String sql;
              int nrows;
              sql= "insert into guest values(";
              sql +="'" + strID + "',";
              sql += "'" + strName + "',";
              sql += "'" + strPhone + "',";
              sql += "'" + strSdate + "',";
              sql += "'" + strDdate + "')";
              nrows = stmt.executeUpdate(sql);
       
     
       stmt.close();
       conn.close();
   %>

</body>
</html>
