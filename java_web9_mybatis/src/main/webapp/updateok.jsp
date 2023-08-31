<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="sbean" class="pack.business.SangpumBean"></jsp:useBean>
<jsp:setProperty property="*" name="sbean" />
<jsp:useBean id="sDao" class="pack.business.ServiceDao"></jsp:useBean>

<%
sDao.upData(sbean);
response.sendRedirect("list.jsp");
%>