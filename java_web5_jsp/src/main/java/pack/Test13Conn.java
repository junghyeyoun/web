package pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Test13Conn {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	public Test13Conn (){
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			
		} catch (Exception e) {
			System.out.println("연결 실패 : "+e);
		}
	}
	
	public ArrayList<Test13Dto> getDataAll(String buser){
		ArrayList<Test13Dto> list = new ArrayList<Test13Dto>();
		try {
			// db는 필요할 때 연결하고 처리가 끝나면 연결을 끊는다.
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/test","root","seoho123");
			String sql = "SELECT jikwon_no,jikwon_name,jikwon_jik,jikwon_gen FROM jikwon INNER JOIN buser ON buser_no = buser_num WHERE buser_name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, buser);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Test13Dto dto = new Test13Dto();
				dto.setJiwkon_no(rs.getString("jikwon_no"));
				dto.setJikwon_name(rs.getString("jikwon_name"));
				dto.setJikwon_jik(rs.getString("jikwon_jik"));
				dto.setJikwon_gen(rs.getString("jikwon_gen"));
				list.add(dto);
				
			}
			
		} catch (Exception e) {
			System.out.println("getDataAll err : "+e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}  
}
