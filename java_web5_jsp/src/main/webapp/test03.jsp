<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>include directive(지시어) 연습</h2>
<%@include file="test03top.jsp" %> <!-- 해당 소스가 이 영역으로 호출 -->
여러 페이지에 공통적으로 등장하는 문서 내용은 별도의 파일로 작성 후 호출
<pre>
.
.
.
.
.
.
</pre>
<!-- include action tag : 해당 파일의 실행 결과가 호출-->
<div style="font-size: 20px">
<jsp:include page="test03inc1.jsp"></jsp:include>
<br>
<jsp:include page="test03inc2.jsp">
<jsp:param value="korea" name="msg"/>
</jsp:include>
</div>





<%@include file="test03bottom.jsp" %>
</body>
</html>