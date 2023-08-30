<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- test3에서 Parameter받아 줘야 함.-->
<%
String msg = request.getParameter("msg");
out.println("넘어온 값은 "+msg);

%>
</body>
</html>