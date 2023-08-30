package pack;

public class Goods { // DTO(VO) 역할 : 레코드단위로 장바구니의 입력정보 가지고 있음
	// private 인 값 외부에서 받는 방법
	// 1. 생성자
	// 2. setter
	private String name;
	private int price;
	
	public Goods(String name, int price) {
		this.name = name;
		this.price = price;
	}
	
	public String getName() {
		return name;
	}
	
	public int getPrice() {
		return price;
	}
}
