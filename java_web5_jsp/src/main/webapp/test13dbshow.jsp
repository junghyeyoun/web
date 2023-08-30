<%@page import="java.util.ArrayList"%>
<%@page import="pack.Test13Conn"%>
<%@page import="pack.Test13Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="test13conn" class="pack.Test13Conn"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr><th>사번</th><th>이름</th><th>직급</th><th>성별</th></tr>
<%
String buser = (String)request.getParameter("buser");
ArrayList<Test13Dto> list = test13conn.getDataAll(buser);
for(Test13Dto s:list) {
%>
<tr>
		<td><%=s.getJiwkon_no()%></td>
		<td><%=s.getJikwon_name()%></td>
		<td><%=s.getJikwon_jik()%></td>
		<td><%=s.getJikwon_gen()%></td>
</tr>
<%
}
%>	
</table>
건수 : <%= list.size() %>

</body>
</html>