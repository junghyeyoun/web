<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>jsp가 넘겨준 자료를 출력</h2>
<%
// redirext 
// String data = request.getParameter("data");
// out.println("data : "+data);

// forward 
String data = (String)request.getAttribute("data");
out.println("data : "+data);

out.println("<br/>");
ArrayList<String> mylist = (ArrayList<String>)request.getAttribute("friend");
for(String f:mylist) {
	out.println("친구 : "+f + "<br/>");
}
%>
</body>
</html>