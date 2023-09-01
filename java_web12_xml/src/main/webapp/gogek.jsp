<%@page import="pack.business.DataDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="process" class="pack.business.ProcessImpl"/>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
request.setCharacterEncoding("utf-8");
String jikwon_no = request.getParameter("jikwon_no");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h3>고객 정보 </h3>
   <table border="1">
      <tr><th>고객번호</th><th>고객명</th><th>고객전화</th><th>성별</th></tr>
      <% ArrayList<DataDto> list = (ArrayList<DataDto>)process.selectDataPart(jikwon_no); %>
      <c:set var="list" value="<%=list %>" />
      <c:if test="${empty list }">
      <tr><td colspan="4">회원자료가 없습니다.</td></tr>
      </c:if>
      
      <c:forEach var="m" items="<%=list %>">
      <c:set var="jumin" value="${m.gogek_jumin }"></c:set>
      <tr>
         <td>${m.gogek_no}</td>
         <td>${m.gogek_name}</td>
         <td>${m.gogek_tel}</td>
         <td>
         <c:set var="jumin2" value="${fn:substring(jumin,7,8)}"></c:set>
         <c:choose>
         	<c:when test="${jumin2 == '1'}">
         	 남
         	</c:when>
         	<c:otherwise>
         	 여
         	</c:otherwise>
         </c:choose>
         </td> 
         
      </tr>
      </c:forEach>
   </table>
</body>
</html>
</html>