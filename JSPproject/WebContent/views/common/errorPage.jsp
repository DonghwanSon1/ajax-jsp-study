<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String errorMsg = (String)request.getAttribute("errorMsg"); // : Object
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지 입니다!</title>
</head>
<body>

    <h1 align="center" style="color: red;"><%= errorMsg %></h1>











</body>
</html>