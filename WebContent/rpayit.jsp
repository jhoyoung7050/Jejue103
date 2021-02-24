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
      <form name = "frm" action="http://localhost:8080/Jejue103/DBpension.jsp" method="get" onsubmit ="return requestPay()">
       <div style ="width:300px; height:100px;text-align: right;margin:10%;">
            <label>이름: </label>
            <input name="name" type="text" id ="nameT" oninput="this.value=this.value.replace(/[^ㄱ-힣]/g,'');" style ="border:none; border-bottom: 1px solid;" ><br>
            <label>전화번호: </label>
            <input type="tel" name="telnum" id="tlno" title="전화번호를 알맞은 형식으로 적어주세요 ' - ' 제외시켜주시기 바랍니다"  maxlength="11" oninput="this.value=this.value.replace(/[^0-9]/g,'');" style ="border:none;  border-bottom: 1px solid;" >
     </div>
            <br>
            <p style = "font-size:24px;">요금: <%= request.getParameter("tPayment") %></p>
            <input type = "hidden" name = "tPaying" value ="<%= request.getParameter("tPayment") %>">
         <input type = "hidden" name = "fDate" value = "<%= request.getParameter("dStart") %>">
         <input type = "hidden" name = "lDate" value = "<%= request.getParameter("dEnd") %>">
        
         <button  style ="margin-top:20%;" id = "payment"  onclick ="requestPay()"> 결제하기</button>
        </form>
        
        
        
</div>  

   
         
    <script>
    
    function requestPay(){
    	
        var pathName =   document.getElementById("nameT").value;
        
        var pathNumber = document.getElementById("tlno").value;
       
        var pathAmount = '<%= request.getParameter("tPayment") %>';
        
     
        
        if(pathName === ""&& pathNumber !== String){
        	alert("이름을 입력해주세요");
        	return false;
        	}
        else if(pathNumber === "" ){
        	alert("전화번호를 입력해주세요");
        	return false;
        }
       
       
      
    }
    
  
    	  

    
  


    </script>

        
        
</body>
</html>