<%@page import="pack2.Test14SangpumDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="test" class="pack2.Test14ConnPooling"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function funcUp() {
	// alert("aa");
	let code = prompt("수정할 코드 입력","");
	// alert(code);
	if(code !== ""&&code!==null){
		location.href="test14update.jsp?code=" +code;
	}
}

function funcDel() {
	// alert("bb");
	let code = prompt("삭제할 코드 입력","");
	// alert(code);
	if(code !== ""&&code!==null){
		if(confirm("정말 삭제할까요?")===true) {
		location.href="test14delete.jsp?code=" +code;
		}
	}
}
</script>
</head>
<body>
* 상품 정보 보기(beans + db pooling) *
<hr/>
<a href="test14insert.html">추가</a> &nbsp;&nbsp;
<a href="javascript:funcUp()">수정</a> &nbsp;&nbsp;
<a href="javascript:funcDel()">삭제</a>
<br/>
<table border="1">
 <tr><th>코드</th><th>품명</th><th>수량</th><th>단가</th></tr>
 <% 
 ArrayList<Test14SangpumDto> list = test.getDataAll();
 for(Test14SangpumDto s:list){
%>
<tr>
	<td><%= s.getCode() %></td>
	<td><%= s.getSang() %></td>
	<td><%= s.getSu() %></td>
	<td><%= s.getDan() %></td>
</tr>
<%
 }
 %>
 
</table>
</body>
</html>