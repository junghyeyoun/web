package pack;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 @WebServlet({"/HelloServlet","/hello.korea","/abc.*"})
public class HelloServlet extends HttpServlet {
	 private HelloSub hellosub;
	 @Override
	public void init() throws ServletException {
		// HelloServlet 최초 요청 시 딱 한 번 수행
		hellosub = new HelloSub();
	}
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("get 요청 접수 완료"); // 표준출력 장치로 출력
		response.setContentType("text/html;charset=utf-8"); // Mine type과 문자 코드
		PrintWriter out = response.getWriter();
		out.println("<html><body>"); 
		out.println("<h1>환영합니다. 서블릿 방문을 ...</h1>");
		
		int a = 10, b = 20;
		//int tot = a+b;
		//System.out.println(tot); // 콘솔(표준출력장치에 찍힘)
		//out.println("tot : "+  tot); // 브라우저에 출력
		// 두 수의 합을 구하는 메소드를 이용
		int tot = myCalc(a,b);
		out.println("두수의 합 : "+"<b>"+tot+"</b>");
		
		// 다른 클래스의 메소드를 호출
		// HelloSub hellosub = new HelloSub(); 객체 요청시 객체가 매번 생성
		String result = hellosub.display(5);
		out.println(result);
		
		out.println("</html></body>"); 
		out.close();
		
	}
	@Override
	public void destroy() {
		// 웹 서비스가 종료될 때 딱 한 번 수행
		hellosub = null;
	}
	private int myCalc(int a, int b) {
		return a+b;
	}
}
