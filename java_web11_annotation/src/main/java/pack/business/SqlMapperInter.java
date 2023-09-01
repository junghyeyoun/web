package pack.business;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface SqlMapperInter {
	@Select("select * from membertab")
	List<DataDto> selectDataAll();
	
	@Select("select * from membertab where id=#{id}")
	DataDto selectDataPart(String id);
	
	@Insert(" insert into membertab values (#{id}, #{name}, #{passwd}, now())")
	int insertData(DataFormbean bean);
	
	@Update("update membertab set name=#{name} where id=#{id}")
	int updateData(DataFormbean bean);
	
	@Delete("delete from membertab where id=#{id}")
	int deleteData(String id);
}
