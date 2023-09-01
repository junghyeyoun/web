
<%@page import="pack.business.SqlMapConfig"%>
<%@page import="pack.business.DataDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="process" class="pack.business.ProcessImpl"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<h2>* 직원 정보 (MyBatis-xml 의존적) *</h2>
<table border="1">
	<tr><th>사번</th><th>이름</th><th>직급</th><th>성별</th><th>연봉</th></tr>
	<% ArrayList<DataDto> list = (ArrayList)process.selectDataAll(); %>
	<c:set var="list" value="<%=list%>"></c:set>
	<c:if test="${empty list}">
	<tr colspan ="5"><td>회원자료 없음</td></tr>
	</c:if>
	
	<c:forEach var="m" items="<%= list %>">
	<tr>
		<td>${m.jikwon_no}</td>
		<td><a href="gogek.jsp?jikwon_no=${m.jikwon_no}">${m.jikwon_name}</a></td>
		<td>${m.jikwon_jik}</td>
		<td>${m.jikwon_gen}</td>
		<td><fmt:formatNumber>${m.jikwon_pay}</fmt:formatNumber> </td>
	</tr>
	</c:forEach>
</table>
<div id="show"></div>
</body>
</html>