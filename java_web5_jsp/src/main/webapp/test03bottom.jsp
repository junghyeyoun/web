<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<hr>
이 곳은 문서의 바닥글 용도로 작성함
<br>
<%
// 날짜 및 시간
LocalDateTime now = LocalDateTime.now();
int year = now.getYear();
int hour = now.getHour();
out.println(year + "년 어느날 "+hour+"시");
%>