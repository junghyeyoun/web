package pack.business;

import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
  public static SqlSessionFactory sqlSessionFactory;  //DB의 SQL명령을 실행시킬 때 필요한 메소드를 갖고 있다.
 
  static{
     String resource = "pack/mybatis/Configuration.xml";
     try {
         Reader reader = Resources.getResourceAsReader(resource);
         sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
         reader.close();
         
         // MyBatis annotaton 사용할 경우 추가 코드
         Class[] mappers = {SqlMapperInter.class};
         for(Class m:mappers) {
        	 // SqlSessionFactory에 mapper 등록
        	 sqlSessionFactory.getConfiguration().addMapper(m); // 클래스의 포함관계
         }
     } catch (Exception e) {
     System.out.println("SqlMapConfig 오류 : " + e);
  }
}
 
public static SqlSessionFactory getSqlSession(){ // static 메소드에서는 static만 부를 수 있음
     return sqlSessionFactory;
  }
}