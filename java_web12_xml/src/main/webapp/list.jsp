<%@page import="pack.business.DataDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="process" class="pack.business.ProcessImpl"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 정보</title>
<script src="http://code.jquery.com/jquery-1.12.1.js"></script>

<script>
$(function(){
    $('.gogek').on('click', function(){
        let jikwon_no = $(this).data('jikwon-no');
        let str =""
        $.ajax({
            url: 'gogekajax.jsp',
            type: 'get',
            data: { jikwon_no: jikwon_no }, 
            dataType: "json",
            success: function(data) {
            	// gogekList를 비워줌
                $('#gogekList').empty(); 
            	
                // JSON 데이터를 테이블로 출력
              //  str = jikwon_name + "의 고객 명단";
               	str += '<table border="1" style="text-align: center">';
               	str += '<tr><th>고객번호</th><th>이름</th><th>전화번호</th><th>성별</th></tr>';
               
               	// 불러온 자료가 있다면 
               	if(data.length > 0){
                
                for (let i = 0; i < data.length; i++) {
                	str += '<tr>';
                	str += '<td>' + data[i].gogek_no + '</td>';
                	str += '<td>' + data[i].gogek_name + '</td>';
                	str += '<td>' + data[i].gogek_tel + '</td>';
                	str += '<td>' + data[i].seng + '</td>';
                	str += '</tr>';
            			}  
               	// 불러온 자료가 없다면 
                }else{
                	str += '<tr><td colspan="4">직원자료 고객 없음</td></tr>'; 	
                }
                str += '</table>';
                
       
                $("#gogekList").append(str);
       
            },
            error: function() {
            	// 동명이인 처리를 하려면 jikwon_name말고 추가적인 데이터가 필요
            	//	gogekData 의 parameter를 param을 사용하여 두가지 이상을 받아야함
                alert("동명이인이 있습니다.");
            }
        });
    });
});
</script>
</head>	
<body>
<table border="1" style="text-align: center">
    <tr><th>사번</th><th>이름</th><th>직급</th><th>성별</th><th>연봉</th></tr>
    <% ArrayList<DataDto> list = (ArrayList)process.jikwonData(); %>
    <c:set var="list" value="<%= list %>"></c:set>

    <c:if test="${empty list }">
    <tr><td colspan="5">직원자료 없음</td></tr>
    </c:if>

    <c:forEach var="j" items="<%=list %>">
    <tr>
        <td>${j.jikwon_no }</td>
        <td class="gogek" data-jikwon-no="${j.jikwon_no }">${j.jikwon_name }</td>
        <td>${j.jikwon_jik }</td>
        <td>${j.jikwon_gen }</td>
        <td><fmt:formatNumber>${j.jikwon_pay }</fmt:formatNumber></td>
    </tr>
    </c:forEach>
</table>
<hr>
<div id="gogekList"></div>
</body>
</html>
