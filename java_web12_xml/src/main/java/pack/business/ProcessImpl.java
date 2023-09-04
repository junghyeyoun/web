package pack.business;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class ProcessImpl implements ProcessInterface{
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	@Override
	public List<DataDto> jikwonData() {
		SqlSession sqlSession = factory.openSession();
		List<DataDto> list = null;
		try {
			list = sqlSession.selectList("jikwonData");
		} catch (Exception e) {
			System.out.println("jikwonData err : "+e);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return list;
	}
	
	@Override
	public List<DataDto> gogekData(String jikwon_no) {
		SqlSession sqlSession = factory.openSession();
		List<DataDto> list = null;
		try {
			list = sqlSession.selectList("gogekData",jikwon_no);
		} catch (Exception e) {
			System.out.println("gogekData err : "+e);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return list;
	}
	
	
}
