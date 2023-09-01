<%@page import="pack.business.SqlMapConfig"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pack.business.DataDto"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="process" class="pack.business.ProcessImpl" />
<%
request.setCharacterEncoding("utf-8");
String jikwon_no = request.getParameter("jikwon_no");
jikwon_no ="2";
ArrayList<DataDto> list = (ArrayList<DataDto>)process.selectDataPart(jikwon_no);
%>

<%
String result = "";
for(DataDto d:list){
   result += "{";
   result += "\"gogek_no\":" + "\"" + d.getGogek_no() + "\",";
   result += "\"gogek_name\":" + "\"" + d.getGogek_name() + "\",";
   result += "\"gogek_tel\":" + "\"" + d.getGogek_tel() + "\",";
   result += "\"gogek_jumin\":" + "\"" + d.getGogek_jumin() + "\"";
   result += "},";
}

if(result.length() > 0){
   result = result.substring(0,result.length() - 1);
}
out.print(result);
out.print(jikwon_no);

%>