package pack;

public class Test11formBean { // 클라이언트에서 전달되는 값이 여러 개인 경우 폼빈을 사용
	private String name;
	private int kor;
	private int eng;
public void setName(String name) {
	this.name = name;
}

public String getName() {
	return name;
}

public void setKor(int kor) {
	this.kor = kor;
}

public int getKor() {
	return kor;
}

public void setEng(int eng) {
	this.eng = eng;
}

public int getEng() {
	return eng;
}
}
