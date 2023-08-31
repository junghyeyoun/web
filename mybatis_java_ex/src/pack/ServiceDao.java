package pack;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class ServiceDao {
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession(); 
	
	public List<JikDto> selectDataAll() throws Exception {
		// SqlSession을 생성하기 위해 SqlSessionFactory를 사용한다. 세션ㅇ늘 한번 생성하면 매핑구문을 실행하거나 커밋 또는 롤백을 하기 위해 세션을 사용할수 있다.
		// 더 이상 필요하지 않은 상태가 되면 세션을 닫는다.
		SqlSession sqlSession = factory.openSession(); // 세션(SQL 매핑 처리단위) 열기
		List<JikDto> list = sqlSession.selectList("selectDataAll"); // DataMapper.xml의 id를 호출
		sqlSession.close();
		return list;
	} 
	
	public List<JikDto> selectData(String arg) throws Exception {
		// SqlSession을 생성하기 위해 SqlSessionFactory를 사용한다. 세션ㅇ늘 한번 생성하면 매핑구문을 실행하거나 커밋 또는 롤백을 하기 위해 세션을 사용할수 있다.
		// 더 이상 필요하지 않은 상태가 되면 세션을 닫는다.
		SqlSession sqlSession = factory.openSession(); // 세션(SQL 매핑 처리단위) 열기
		List<JikDto> list = sqlSession.selectList("selectData", arg); // DataMapper.xml의 id를 호출
		sqlSession.close();
		return list;
	}

}
