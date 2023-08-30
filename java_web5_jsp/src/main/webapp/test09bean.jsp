<%@page import="pack.Test9Gugudan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
구구단 출력<hr/>
* 방법1 : 현재 실력으로 출력 * <br/>
<%
int dan = Integer.parseInt(request.getParameter("dan"));
out.println(dan + "단 출력 <br/>");
Test9Gugudan gugudan = new Test9Gugudan(); // 클래스의 포함관계. 싱글톤 처리를 필요로 함.
int re[] = gugudan.processGugu(dan);
for(int a = 0; a <9;a++){
	out.println(dan + "*" +(a+1)+"="+re[a]+"&nbsp");
	// 메모리를 많이 사용한다는 단점이 있음.
}
%>

<br/><br/>
* 방법2 : beans를 사용해서 출력 * <br/>
<%-- 아래 소스는 Test9Gugudan gugu = new Test9Gugudan(); + 싱글톤 처리라고 볼 수 있다. --%>
<%-- 위에서 gugudan을 썼기 때문에 같은 이름 쓰면 안됨 --%>
<jsp:useBean id="gugu" class="pack.Test9Gugudan" scope="page"></jsp:useBean>
<%
int re2[] = gugudan.processGugu(dan);
for(int a = 0; a <9;a++){
	out.println(dan + "*" +(a+1)+"="+re2[a]+"&nbsp");
	// 메모리를 많이 사용한다는 단점이 있음.
}
%>


</body>
</html>