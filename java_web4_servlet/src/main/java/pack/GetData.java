package pack;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/GetData")
public class GetData extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get, post 모두 처리
		System.out.println("service 처리");
		String nai = request.getParameter("age");
		if(nai.equals("33")) {
			doGet(request, response);
		}else {
			doPost(request,response);
		}
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get 요청시 처리
		String name = request.getParameter("name");
		String juso = request.getParameter("addr");
		String nai = request.getParameter("age");
		System.out.println(name + " " + juso + " "+nai);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// post 요청시 처리
		System.out.println("dePost");
	}
}
