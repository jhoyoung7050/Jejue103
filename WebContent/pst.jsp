<%@ page language="java" contentType="text/html; charset= utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post </title>

<h1> 내용확인을 위해 아래 칸을 작성해주시길 바랍니다.</h1>

</head>
<body>
<form action="http://localhost:8080/Jejue103/server.jsp" method="get"  >
            <label>이름: </label>
            <input name="name" type="text"><br>
            <label>전화번호: </label>
            <input type="tel" name="telnum" id="tlno" title="전화번호를 알맞은 형식으로 적어주세요 ' - ' 제외시켜주시기 바랍니다" pattern="[0-9]{11}" >
            <br>
            <p>요금: <%= request.getParameter("tPayment") %></p>
            <input type = "hidden" name = "tPaying" value ="<%= request.getParameter("tPayment") %>">
            
            
            <input type="submit" value="전송">
            
            </form>
            
           
</body>
</html>