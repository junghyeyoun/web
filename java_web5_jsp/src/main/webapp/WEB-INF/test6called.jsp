<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String data = request.getParameter("data");

// jsp는 비지니스 로직, 출력을 담당하는 역할을 함.(근본 목적은 출력용) 
// Servlet 대신 비지니스 로직을 담당 할 수도 있음.
// Business Logic이 있는 상태로 뭔가를 처리했다고 가정
String msg = "Mr. " + data;

// 1. redirect
// response.sendRedirect("test6called2.jsp?data=" + msg);

// 2. forward
request.setAttribute("data", msg);

ArrayList<String> list = new ArrayList<String>();
list.add("준수");
list.add("준호");
list.add("준");
request.setAttribute("friend", list); // forward만 가능

// RequestDispatcher dispatcher = request.getRequestDispatcher("test6called2.jsp");
// dispatcher.forward(request, response);
%>
<!-- 위와 같은 뜻 -->
<%-- 
<jsp:forward page="test6called2.jsp"/>
--%>
<!-- 이 영억은 sendredirect는 안되고 forward로만 가능 -->
<jsp:forward page="WEB-INF/test6called2.jsp"/>