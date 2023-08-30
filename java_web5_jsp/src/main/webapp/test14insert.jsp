<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 출력 용이 아니기 때문에 밑에 싹 지워도 됨 --%>
<%-- insert 작업용 jsp는 저장이 목적. 저장 후 상품 목록 출력 --%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="bean" class="pack2.Test14SangpumBean"/>
<jsp:setProperty property="*" name="bean" /> <%-- 빈즈에 입력한 값 넣음 --%>
<%-- 값 들어 갔는지 확인
<%= bean.getSang() %> <%= bean.getSu() %> 
--%>
<jsp:useBean id="test" class="pack2.Test14ConnPooling"></jsp:useBean>
<%
boolean b = test.insertData(bean);
	
if(b){
	// 추가 성공시 상품 정보 페이지로 이동
	response.sendRedirect("test14sangpum.jsp");
} else {
	// 추가 실패시 에러 페이지로 이동
	response.sendRedirect("test14error.html");
}
%>