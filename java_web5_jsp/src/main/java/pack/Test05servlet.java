package pack;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/irum.go")
public class Test05servlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String data = request.getParameter("data");
		System.out.println("data : "+data); // 콘솔창에 찍기
		
		// 파일 호출 방법 1 : redirect - client를 통해 server에 파일을 요청
		// response.sendRedirect("test5called.jsp?data="+data); // String 단일 값 여러개 가능
		
		// 파일 호출 방법 2 : forward - server에서 바로 서버의 파일을 요청
		request.setAttribute("mydata", data); // 자바의 모든 객체 가능
		
		/*
		RequestDispatcher dispatcher = request.getRequestDispatcher("test5called.jsp");
		dispatcher.forward(request, response);
		*/
		// 두 줄을 한줄로 
		request.getRequestDispatcher("test5called.jsp").forward(request, response);
	}

}
