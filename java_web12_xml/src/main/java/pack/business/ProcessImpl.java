package pack.business;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class ProcessImpl implements ProcessInterface{
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	@Override
	public List<DataDto> selectDataAll() {
		SqlSession sqlSession = factory.openSession();
		List<DataDto> list = null;
		try {
			list = sqlSession.selectList("selectDataAll");
		} catch (Exception e) {
			System.out.println("selectDataAll err : "+e);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return list;
	}
	
	@Override
	public List<DataDto> selectDataPart(String jikwon_no) {
		SqlSession sqlSession = factory.openSession();
		List<DataDto> list = null;
		try {
			list = sqlSession.selectList("selectDataPart",jikwon_no);
		} catch (Exception e) {
			System.out.println("selectDataPart err : "+e);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return list;
	}
	
	
}
