<%@page import="pack.Test12SangpumDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="test12Conn" class="pack.Test12Conn"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>* 상품 자료 *</h2>
<table border="1">
	<tr><th>코드</th><th>품명</th><th>수량</th><th>단가</th></tr>
<%
int code = Integer.parseInt(request.getParameter("code"));
Test12SangpumDto dto = test12Conn.getData(code);
%>
	<tr>
		<td><%=dto.getCode()%></td>
		<td><%=dto.getSang()%></td>
		<td><%=dto.getSu()%></td>
		<td><%=dto.getDan()%></td>
	</tr>
</table>
</body>
</html>