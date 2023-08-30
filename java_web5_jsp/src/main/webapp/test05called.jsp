<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>서블릿에 의해 호출된 jsp 파일입니다</h2>
<%
request.setCharacterEncoding("utf-8");

// redirect 방식으로 전송한 자료를 수신
// String data = request.getParameter("data");
// out.println("자료는 " +data);

// forward 방식으로 전송한 자료를 수신
String data = (String)request.getAttribute("mydata");
// forward와 redirect는 결과는 같지만 주소가 다름(servlet이 jsp부를때 차이)

%>


</body>
</html>