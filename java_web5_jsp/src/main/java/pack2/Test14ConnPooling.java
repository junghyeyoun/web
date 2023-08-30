package pack2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Test14ConnPooling {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public Test14ConnPooling() {
		// context.xml에 db연결하는 과정 써놓음 
		// JNDI(Java Naming and Directory Interface)는 디렉터리 서비스에서 제공하는 데이터 및 객체를 발견(discover)하고 참고(lookup) 하기 위한 자바 API다.
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria"); // java:comp/env는 고정 뒤는 context.xml에서 쓴거 참고 / 노출시키는 일 없기 때문에 보안에도 유리
		} catch (Exception e) {
			System.out.println("db 연결 실패 : "+e.getMessage());
		}
	}
	
	public ArrayList<Test14SangpumDto> getDataAll() {
		ArrayList<Test14SangpumDto> list = new ArrayList<Test14SangpumDto>();
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select * from sangdata");
			rs = pstmt.executeQuery();
			while(rs.next()) { // 한개일 때 if 여러개일때 while
				Test14SangpumDto dto = new Test14SangpumDto();
				dto.setCode(rs.getString("code")); // rs.getString(1)
				dto.setSang(rs.getString("sang"));
				dto.setSu(rs.getInt("su"));
				dto.setDan(rs.getInt("dan"));
				list.add(dto); // 모든 자료가 소진될 때 까지 읽고 넣어주는 역할
			}
		} catch (Exception e) {
			System.out.println("getDataAll err : " +e);
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
	
	public boolean insertData(Test14SangpumBean bean) {
		boolean b = false;
		try {
			// System.out.println(bean.getSang());
			// 클라이언트가 입력한 자료가 jsp를 타고 클래스를 타고 들어옴
			
			// autoincrement로 되어 있다면 할 필요 없는 작업 - db마다 다르기 때문에 안씀
			// 신상 code 구하기
			String sql = "select max(code) as max from sangdata";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int maxCode = 0;
			if(rs.next()) {
				maxCode = rs.getInt("max");
			}
			maxCode++;
			System.out.println("신상 코드 : "+maxCode);
			pstmt.close(); // 뒤에서 쓰기 위해 닫기
			
			// 추가 작업
			sql = "insert into sangdata values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, maxCode);
			pstmt.setString(2, bean.getSang());
			pstmt.setString(3, bean.getSu());
			pstmt.setString(4, bean.getDan());
			int re = pstmt.executeUpdate(); // 성공하면 1 실패하면 0
			if(re == 1) b=true; 
		} catch (Exception e) {
			System.out.println("insertData err : "+e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return b;
	}
	
	// 수정할 자료를 반환
	public Test14SangpumDto getData(String code) { // code에 해당하는 1개의 자료 읽기
		System.out.println("code : "+code);
		Test14SangpumDto dto = null;
		try {
			String sql = "select * from sangdata where code=?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new Test14SangpumDto();
				dto.setCode(rs.getString(1)); // 1을 code라고 써도 됨
				dto.setSang(rs.getString(2));
				dto.setSu(rs.getInt(3));
				dto.setDan(rs.getInt(4));
			}
		} catch (Exception e) {
			System.out.println("getData err : "+e);
		}finally {
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
	
	public boolean updateData(Test14SangpumBean bean) {
		boolean b = false;
		try {
			conn = ds.getConnection();
			String sql = "update sangdata set sang=?,su=?,dan=? where code=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getSang());
			pstmt.setString(2, bean.getSu());
			pstmt.setString(3, bean.getDan());
			pstmt.setString(4, bean.getCode());
			if(pstmt.executeUpdate()>0) b=true;  // insert와 약간 다르게 작성함
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return b;
	}
	
	public boolean deleteData(String code) {
		boolean b = false;
		try {
			conn = ds.getConnection();
			String sql = "delete from sangdata where code =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			if(pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("deleteData err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return b;
	}
}

























