<%@page import="pack.business.DataDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="func" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="process" class="pack.business.ProcessImpl"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>* 회원 정보 (MyBatis-annotation 의존적) *</h2>
<a href="ins.jsp">회원 추가</a>
<br>
<table border="1">
	<tr><th>id</th><th>이름</th><th>비밀번호</th><th>등록일</th></tr>
	<% ArrayList<DataDto> list = (ArrayList)process.selectDataAll(); %>
	<c:set var="list" value="<%=list%>"></c:set>
	<c:if test="${empty list}">
	<tr colspan ="4"><td>회원자료 없음</td></tr>
	</c:if>
	
	<c:forEach var="m" items="<%= list %>">
	<tr>
		<td><a href="del.jsp?id=${m.id}">${m.id}</a></td>
		<td><a href="up.jsp?id=${m.id}">${m.name}</a></td>
		<td>${m.passwd}</td>
		<td>${func:substring(m.reg_date,0, 10)}</td>
	</tr>
	</c:forEach>
</table>
id 클릭은 삭제, name 클릭은 수정
</body>
</html>