<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bean" class="pack2.Test14SangpumBean"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="test" class="pack2.Test14ConnPooling"></jsp:useBean>

<%
if(test.updateData(bean)) 
	response.sendRedirect("test14sangpum.jsp"); // 수정 완료 후 상품정보 보기
else 
	response.sendRedirect("test14error.html"); // 수정 실패하면 에러 페이지로 이동
%>