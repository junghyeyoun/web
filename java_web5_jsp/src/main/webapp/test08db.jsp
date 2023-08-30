<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
try {
	Class.forName("org.mariadb.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/test","root","seoho123");
} catch (Exception e) {
	System.out.println("연결 실패 : "+e);
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
<h2>** sangdata 출력(beans 사용 안함) **</h2>
<table border="1">
	<tr><th>코드</th><th>품명</th><th>수량</th><th>단가</th></tr>
<% 
try{
	pstmt = conn.prepareStatement("select * from sangdata");
	rs = pstmt.executeQuery();
	while(rs.next()){
		
%>
	<tr>
		<td><%= rs.getString("code") %></td>
		<td><%= rs.getString("sang") %></td>
		<td><%= rs.getString("su") %></td>
		<td><%= rs.getString("dan") %></td>
	</tr>
<%
		
	}
} catch (Exception e) {
	System.out.println("처리 실패 : "+e);
} finally {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	
}
%>
</table>
</body>
</html>