package pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class Test12Conn {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	public Test12Conn (){
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			
		} catch (Exception e) {
			System.out.println("연결 실패 : "+e);
		}
	}
	
	
	public ArrayList<Test12SangpumDto> getDataAll(){
		ArrayList<Test12SangpumDto> list = new ArrayList<Test12SangpumDto>();
		try {
			// db는 필요할 때 연결하고 처리가 끝나면 연결을 끊는다.
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/test","root","seoho123");
			String sql = "select * from sangdata";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Test12SangpumDto dto = new Test12SangpumDto();
				dto.setCode(rs.getString("code"));
				dto.setSang(rs.getString("sang"));
				dto.setSu(rs.getString("su"));
				dto.setDan(rs.getString("dan"));
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
	
	public Test12SangpumDto getData(int code){
		Test12SangpumDto dto = null;
		try {
			// db는 필요할 때 연결하고 처리가 끝나면 연결을 끊는다.
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/test","root","seoho123");
			String sql = "select * from sangdata where code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, code);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new Test12SangpumDto();
				dto.setCode(rs.getString("code"));
				dto.setSang(rs.getString("sang"));
				dto.setSu(rs.getString("su"));
				dto.setDan(rs.getString("dan"));
				
				
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
		
		 return dto;
	}
	
	/* 콘솔로 찍기
	public static void main(String[] args) {
		Test12Conn test12Conn = new Test12Conn();
		ArrayList<Test12SangpumDto> list = test12Conn.getDataAll();
		for(Test12SangpumDto s:list) {
			System.out.println(s.getCode() + " " +s.getSang() + " " +s.getSu() + " " + s.getDan());
		}
	}
	*/

}
