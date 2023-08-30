<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 내장 객체
// request, response, out, session, application, pageContext, page, confing, exception
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");  // 입출력 관련 내장 객체 
String pwd = request.getParameter("pwd");

if(!(id.equals("god")&&pwd.equals("123"))){
	response.sendRedirect("test4main.html");  // 입출력 관련 내장 객체  / 비밀번호 아이디가 god, 123이 아니면 다시 요청(새로고침 깜빡이면 클라이언트가 서버에게 전체문서 다시 요청)
}

String[] names = request.getParameterValues("name"); // 동일한 이름일 때 배열. getParameterValues로 받음. / 값 하나 일때는 getParameter
String job = request.getParameter("job");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
jsp 내장객체 경험<br>
아이디 : <% out.println(id + "<br>"); %> <!-- 출력용 내장객체 -->
이름 : <% out.println(names[0] + ", 별명은 "+ names[1]+"<br>"); %>
직업 : <%= job %>
<hr/>
client ip : <%= request.getRemoteAddr() %> <br/>
client domain : <%= request.getRemoteHost() %> <br/>
protocol : <%= request.getProtocol() %> <br/>
method : <%= request.getMethod() %> <br/>
<br/>
Server buffer size : <%= response.getBufferSize() %> <br/>

context path : <%= application.getContextPath() %> <br/>
session : <%= pageContext.getSession() %>
</body>
</html>