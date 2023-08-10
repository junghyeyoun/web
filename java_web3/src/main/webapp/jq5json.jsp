<%@page import="java.util.Scanner"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

[
<%
String buser = request.getParameter("buser");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String result = "";


try {
   Class.forName("org.mariadb.jdbc.Driver");
} catch (Exception e) {
   System.out.println("로딩 실패" + e);
   return;
}

try {
   conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/test","root","seoho123");
   pstmt = conn.prepareStatement("select jikwon_no, jikwon_name, jikwon_jik, buser_name, jikwon_gen "
			+ "from jikwon left outer join buser on buser_num = buser_no where buser_name = ?");
   pstmt.setString(1,buser); //1은 첫번째 물음표
   rs = pstmt.executeQuery();
  
	   
   
   while(rs.next()){  
      result += "{";
      result += "\"jikwon_no\":" + "\"" + rs.getString("jikwon_no") + "\",";
      result += "\"jikwon_name\":" + "\"" + rs.getString("jikwon_name") + "\",";
      result += "\"jikwon_jik\":" + "\"" + rs.getString("jikwon_jik") + "\",";
      result += "\"jikwon_gen\":" + "\"" + rs.getString("jikwon_gen") + "\"";
      result += "},";
   }
   if(result.length() > 0){
      result = result.substring(0,result.length() - 1);
   }
   out.print(result);
   rs.close();
   pstmt.close();
   conn.close();
} catch (Exception e) {
   System.out.println("처리 실패 : " + e);
}


%>
]
