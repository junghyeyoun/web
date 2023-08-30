package pack2;

public class Test14SangpumDto {
	private String code, sang;
	private int su, dan;
	// 연산에 참여하지 않는다면 굳이 int로 주지 않아도 됨 (연산 할 때 String으로 주고 형변환해도 됨)
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getSang() {
		return sang;
	}
	public void setSang(String sang) {
		this.sang = sang;
	}
	public int getSu() {
		return su;
	}
	public void setSu(int su) {
		this.su = su;
	}
	public int getDan() {
		return dan;
	}
	public void setDan(int dan) {
		this.dan = dan;
	}
	
}
