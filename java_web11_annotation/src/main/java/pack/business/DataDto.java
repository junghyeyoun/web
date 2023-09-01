package pack.business;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class DataDto {
	private String id,name,passwd;
	private Timestamp reg_date;
}
