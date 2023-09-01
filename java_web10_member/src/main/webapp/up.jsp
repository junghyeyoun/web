<%@page import="pack.business.DataDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="process" class="pack.business.ProcessImpl"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");

DataDto dto = process.selectDataPart(id); 
// out.print(dto.getName());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
* 회원 수정 *
<form action="upok.jsp" method="post">
id : <%=dto.getId() %>
<input type="hidden" name="id" value="<%=dto.getId()%>"><br>
name : <input type="text" name="name" value="<%=dto.getName() %>"><br>
pwd : <input type="text" name="passwd"><br>
<br>
<input type="submit" value="수정">
</form>
</body>
</html>