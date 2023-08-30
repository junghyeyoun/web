<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>JSP(html+java) 연습</h2>
<%
// scriptlet : 이 영역에서는 자바 코드를 자유롭게 기술
String irum = "홍길동";
// 내장객체 out을 이용해 java를 클라이언트 브라우저에 출력
// servlet에서는 PrintWriter out = response.getWriter();
out.println(irum + "의 홈페이지입니다");   

// for문으로 h태그 만들어보기
for(int i=1;i<7;i++){
	out.print("<h"+i+">");
	out.print("h태그 출력");
	out.println("<h"+i+"/>");
}
%>
<hr>
<%
int kor = 90;
out.println("kor : "+kor);
out.println(new java.util.Date());
%>
<br>
<!-- Expression(표현식) : java의 내용을 출력하는데 딱하나만 출력, 세미콜론(;) 쓰면 안됨 -->
<%= "kor : "+kor %> <%-- jsp 주석 --%>
<%= new java.util.Date()  %> 
<br>
<%
int a=0, sum=0;
do{
	a++;
	sum+=a;
}while(a<10);
%>
<%= "10까지의 합은 "+sum %>
<br>
<%= irum + "님의 전화번호는 " + tel %> <!-- service 메소드 내의 지역변수 -->
<%! String tel = "02-1111-1111"; %> <!-- 선언문(declartion)을 사용해서 클래스의 멤버필드 만들기 --> 
<!-- 원래 선언 먼저하고 출력해야하는데 선언문을 쓴다면 지역변수가 아니라 클래스의 멤버필드가 됨 즉 순서 바꿔도 오류 x -->
<br>
<!-- jsp는 service 메소드임 메소드안에 메소드를 쓰면 안됨 선언문으로 바꿔서 클래스의 멤버가 되서 가능 -->
<%! 
// 선언문을 사용해서 클래스의 멤버 메소드 만들기
public int add(int su1, int su2){
	return su1+su2;
}
%>
<%= add(10,20) %>

</body>
</html>






















