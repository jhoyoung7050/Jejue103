<%@ page language="java" contentType="text/html; charset= utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
        <h1>전달받은 데이터</h1>
        <ul>
            <li>이 름: <%= request.getParameter("name") %></li>
            <li>전화번호: <%= request.getParameter("telnum") %></li>
             <li>요금: <%= request.getParameter("tPaying") %></li>
            
        </ul>
    </body>
</html>