<%@page import="pack2.Test14SangpumDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String code = request.getParameter("code"); %>

<jsp:useBean id="test" class="pack2.Test14ConnPooling"></jsp:useBean>
<%
Test14SangpumDto dto = test.getData(code);
if(dto == null){
%>
	<script>
	  alert("등록된 코드번호가 아닙니다\n 수정불가");
	  location.href="test14sangpum.jsp";
	</script>
<%
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
** 상품 수정 ** <br/>
<form action="test14updateok.jsp" method="post">
<input type="hidden" name="code" value="<%=dto.getCode()%>"> <%-- code는 pk이기 때문에 수정불가 수정하지는 않지만 값을 가져가기 위해서 작성함--%>
코드 : <%= dto.getCode() %> <br/>
품명 : <input type="text" name="sang" value="<%=dto.getSang()%>"><br>
수량 : <input type="text" name="su" value="<%=dto.getSu()%>"><br>
단가 : <input type="text" name="dan" value="<%=dto.getDan()%>"><br>
<br>
<input type="submit" value="자료 수정"/>
<input type="button" value="수정 취소" onclick="javascript:location.href='test14sangpum.jsp'"/>
</form>
</body>
</html>