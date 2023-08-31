package pack;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class ServiceDao {
	// DB와 Mybatis 사이에서 실질적인 처리를 수행할 수 있도록 제어하는 서비스 클래스  
	// SqlSessionFactory는 SqlSessionFactorBean 구현체를 활용하여 생성하고 DataSource를 주입받는다.
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession(); 
	
	// DataMapper에 selectDataAll를 읽기 위한 과정 
	// 복수일 때 list로 반환함
	public List<SangpumDto> selectAll() throws Exception {
		// SqlSession을 생성하기 위해 SqlSessionFactory를 사용한다. 세션ㅇ늘 한번 생성하면 매핑구문을 실행하거나 커밋 또는 롤백을 하기 위해 세션을 사용할수 있다.
		// 더 이상 필요하지 않은 상태가 되면 세션을 닫는다.
		SqlSession sqlSession = factory.openSession(); // 세션(SQL 매핑 처리단위) 열기
		List<SangpumDto> list = sqlSession.selectList("selectDataAll"); // DataMapper.xml의 id를 호출
		sqlSession.close();
		return list;
	}
	
	// 단수일 때 SangpumDto 반환함
	public SangpumDto selectData(String arg) throws Exception {
		SqlSession sqlSession = factory.openSession();
		SangpumDto dto = sqlSession.selectOne("selectDataById", arg); // 순서대로 mapping 됨 이름 달라도 됨 arg -> code로 매핑 
		sqlSession.close();
		return dto;
	}
	
	public void insData(SangpumDto dto) throws Exception {
		/*
		SqlSession sqlSession = factory.openSession(); // 수동 commit
		sqlSession.insert("insertData", dto);
		sqlSession.commit(); // or rollback() 을 써줘야함
		sqlSession.close();
		*/
		
		SqlSession sqlSession = factory.openSession(true); // 자동 commit
		sqlSession.insert("insertData", dto); // ("메소드",수정할 데이터)
		sqlSession.close();
	}
	
	public void upData(SangpumDto dto) throws Exception {
		
		SqlSession sqlSession = factory.openSession(); // 수동 commit
		sqlSession.insert("updateData", dto); 
		sqlSession.commit(); // or rollback() 을 써줘야함
		sqlSession.close();
		
	}
	
	public boolean delData(int arg) {
		boolean result = false;
		SqlSession sqlSession = factory.openSession();
		try {
			int cou = sqlSession.delete("deleteData",arg);
			if(cou > 0) result = true;
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println("delData err : "+e);
		} finally {
			if(sqlSession != null) sqlSession.close();
			sqlSession.rollback();
		}
		return result;
	}
}
