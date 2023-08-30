<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true"
 %>
    <!-- isErrorPage 기본값 true -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
허걱 에러 발생 <br>
<%= exception.getMessage() %> <!-- error 정보보고 싶을때 / exception은 내장객체 -->
</body>
</html>