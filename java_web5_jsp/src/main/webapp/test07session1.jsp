<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
    
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id"); 
session.setAttribute("idKey", id); // 세션을 가지질 때 유효
session.setMaxInactiveInterval(10); // 10초간 유효
// request.setAttribute("idKey", id); 현재 페이지에서 유효
// application.setAttribute("idKey", id); 
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>세션 연습 중</h2>

** 감명 깊게 본 영화는? **
<form action="test7session2.jsp">
<input type="radio" name="movie" value="오펜하이머" checked="checked">오펜하이머
<input type="radio" name="movie" value="밀수">밀수
<input type="radio" name="movie" value="베트맨">배트맨
<p/>
<input type="submit" value="결과 확인"> 
</form>
</body>
</html>