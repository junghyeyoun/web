package pack;

import java.util.List;
import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		ServiceDao dao = new ServiceDao();
		try {
			/*
			System.out.println("전체 자료 읽기");
			List<JikDto> list = dao.selectDataAll();     
			for(JikDto s:list) { 
				System.out.println(s.getJikwon_no()+" "+s.getJikwon_name()+" "+s.getBuser_name()+" "+s.getJikwon_gen());
			}
			*/
			Scanner sc = new Scanner(System.in);
			System.out.println("부분 자료 읽기");
			List<JikDto> list2 = dao.selectData(sc.next());
			for(JikDto s2:list2) {
				System.out.println(s2.getJikwon_no()+" "+s2.getJikwon_name()+" "+s2.getBuser_name()+" "+s2.getJikwon_gen());
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

}
