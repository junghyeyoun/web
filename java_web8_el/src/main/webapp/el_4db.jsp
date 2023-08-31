<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="conndb" class="pack.Test12Conn"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>상품자료(beans로 business logic 수행 후 전통적 방법으로 출력)</h3>
<table border="1">
	<tr><th>code</th><th>sang</th><th>su</th><th>dan</th></tr>
	<%
	ArrayList<pack.Test12SangpumDto> list = conndb.getDataAll();
		for(pack.Test12SangpumDto s:list) {
	%>
	<tr>
		<td><%= s.getCode() %></td>
		<td><%= s.getSang() %></td>
		<td><%= s.getSu() %></td>
		<td><%= s.getDan() %></td>
	</tr>
	<%
	}
	%>
</table>
<hr>
<h3>상품자료(beans로 business logic 수행 후 EL,JSTL으로 출력)</h3>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table border="1">
	<tr><th>code</th><th>sang</th><th>su</th><th>dan</th></tr>
	<% ArrayList<pack.Test12SangpumDto> list2 = conndb.getDataAll();%>
	<c:forEach var="s" items="<%=list2 %>">
	<tr>
		<td>${s.code}</td>
		<td>${s.sang}</td>
		<td>${s.su}</td>
		<td>${s.dan}</td>
	</tr>
	</c:forEach>
</table>
<hr>
<h3>EL,JSTL으로 상품자료 읽기</h3>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:catch var="err">
	<sql:setDataSource var="ds" driver="org.mariadb.jdbc.Driver" url="jdbc:mariadb://localhost:3306/test" user="root" password="seoho123"/>
	<sql:query var="rs" dataSource="${ds}">
		select * from sangdata where code >= ? and code <= ?
		<sql:param value="1"/>
		<sql:param value="3"/>
	</sql:query>
	<table border="1">
		<tr><th>code</th><th>sang</th><th>su</th><th>dan</th></tr>
		<c:forEach var="r" items="${rs.rows}">
		<tr>
			<td>${r.code}</td>
			<td>${r.sang}</td>
			<td>${r.su}</td>
			<td>${r.dan}</td>
		</tr>
		</c:forEach>
	</table>
</c:catch>
</body>
</html>