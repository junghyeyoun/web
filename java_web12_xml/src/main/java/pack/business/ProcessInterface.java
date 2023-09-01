package pack.business;

import java.util.List;

public interface ProcessInterface {
	List<DataDto> selectDataAll();
	List<DataDto> selectDataPart(String no);
}
