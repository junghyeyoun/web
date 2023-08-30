<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String message = request.getParameter("message");
%>
<jsp:useBean id="my" class="pack.Test10"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
* 클라이언트에서 전달된 메세지 사용 * <br/>
<%
// 지금까지의 기술만 사용
my.setMessage(message);
out.println(my.getMessage());
%>
<br/>
<%-- jsp 액션태그를 사용 --%>
<%-- 위의 내용과 동일 --%>
<%-- <jsp:setProperty property="mes" name="my"/> property는 setMes의 mes를 뜻함 --%>
<jsp:setProperty property="message" name="my"/>
<jsp:getProperty property="message" name="my"/> 
</body>
</html>