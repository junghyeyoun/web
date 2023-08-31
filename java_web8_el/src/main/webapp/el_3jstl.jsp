<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
   <%-- 
   JSTL : JSP 개발을 단순화하기 위한 표준태그 라이브러리
        : 빠른 개발, 코드 재사용성, JSP의 스크립트릿을 최소화해서 코드의 난독을 해결할 수 있다.
   --%>
   ** 변수 처리 **<br>
   <c:set var="irum" value="한국인" scope="page" /> <%-- page, request, session, application --%>
   이름1 : <c:out value="${irum}" /><br>
   
   <c:set var="ir" scope="session">김유신</c:set>
   이름2 : <c:out value="${ir}" />
   <br>
   <c:remove var="irum" scope="session" />  <%-- 세션에있는 이름이라는 변수 삭제 --%>
   이름1 : <c:out value="${irum}" />
   <c:remove var="irum" scope="page" />     <%-- 페이지에있는 이름이라는 변수 삭제 --%>  <%-- 영역 같아야 지워짐 만약 scope을 다른걸로 쓰면 안지워짐 --%>
   이름1 : <c:out value="${irum}" /><br>
   <c:set var="abc" value="${header['User-Agent']}" scope="page" /> <%--user-Agent 키워드임 --%>
   abc 값은(현재 사용 중인 브라우저 정보) <c:out value="${abc }" />
   <br>
   <c:set var="su1" value="10" />
   <c:set var="su2" value="20" />
   합은 ${su1 + su2 }
   <br><hr>
   ** 조건 판단문 if **<br>
   <c:set var="nice" value="star" /> 
   <c:if test="${nice == 'star'}">   <%-- ${nice eq 'star'}  --%> <%-- 참이어야지 블럭안에 값이 출력됨 --%>
      if 연습1 : nice 값은 <c:out value="${nice}" />
   </c:if>
   <br>
   ** 조건 판단문 choose (if ~ else ~) **<br>
   <c:choose>
      <c:when test="${nice == 'moon' }">
         달 <c:out value="${nice }" />
      </c:when>
      <c:when test="${nice == 'star' }">
         별 <c:out value="${nice }" />
      </c:when>
      <c:otherwise>어떤 조건도 만족 못한 경우</c:otherwise>
   </c:choose>
   <br>
   <c:choose>
      <c:when test="${empty param.name}">
         <form action="">
            이름 : <input type="text" name="name" />
            <input type="submit" />
         </form>
      </c:when>
      <c:when test="${param.name == 'admin' }">
         와우 관리자군요
      </c:when>
      <c:otherwise>어서오세요 회원 <c:out value="${param.name}" />님</c:otherwise>
   </c:choose>
   <hr>
   ** 반복문 forEach **<br>
   연습1 : 
   <c:forEach var="i" begin="1" end="10" step="2">
      ${i}&nbsp;
   </c:forEach><br>
   연습2(구구단) : <br>
   <c:forEach var="i" begin="1" end="9">
      3 * ${i} = ${3 * i} <br>
   </c:forEach><br>
   컬렉션 또는 배열 객체 값 출력<br>
   <%
   HashMap<String, Object> map = new HashMap();
   map.put("name", "홍길동");
   map.put("today", new Date());
   %>
   <c:set var="m" value="<%=map %>" />
   <c:forEach var="i" items="${m}">
      ${i.key }:${i.value }<br>
   </c:forEach>
   
   <br><br>
   <c:set var="arr" value="<%=new int[]{1,2,3,4,5,6,7,8} %>"></c:set>
   <c:forEach var="j" items="${arr }">
      ${j}&nbsp;
   </c:forEach>
   <br>
   <c:forEach var="j" items="${arr }" begin="2" end="7" step="2">
      ${j}&nbsp;
   </c:forEach>
   <br>
   <c:forTokens var="ani" items="개, 고양이, 사자, 호랑이, 돼지" delims=",">
      동물 : ${ani}&nbsp;
   </c:forTokens>
   <br>
   <c:forTokens var="city" items="서울, 수원, 청주*대전, 제주도" delims=",*" varStatus="num"> <%--delims 두개 가능--%>
      ${num.count}) ${city}&nbsp;
   </c:forTokens><br>
   <hr>
   * 숫자 및 날짜 서식 * <br>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   숫자 : <fmt:formatNumber value="12345.6789" type="number" /><br> <%--세자리마다 , 찍어줌 --%>
   숫자 : <fmt:formatNumber value="12345.6789" pattern="#,##0.0" /><br><%-- # : 무의미한 것은 공백처리, 0 : 무의미한 것은 0으로 --%>
   숫자 : <fmt:formatNumber value="0" pattern="#,#00.0" /><br><br>
   <c:set var="now" value="<%=new Date() %>" />
   <c:out value="${now }" /><br>
   날짜 : <fmt:formatDate value="${now }" type="date" /><br>
   시간 : <fmt:formatDate value="${now }" type="time" /><br>
   모두 : <fmt:formatDate value="${now }" type="both" /><br>
   모두 : <fmt:formatDate value="${now }" type="both" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초" /><br>
   <hr>
</body>
</html>