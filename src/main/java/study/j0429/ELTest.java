package study.j0429;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0429/ELTest")
public class ELTest extends HttpServlet {
	@Override
	protected void service(HttpServletRequest requset, HttpServletResponse response) throws ServletException, IOException {
		requset.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name = requset.getParameter("name")==null ? "" : requset.getParameter("name");
		String[] hobbys = requset.getParameterValues("hobby");
		
		String hobby = "";
		for(String h : hobbys) {
			hobby += h + "/";
		}
		hobby = hobby.substring(0, hobby.length()-1);
		
		requset.setAttribute("name", name);
		requset.setAttribute("hobby", hobby);
		
		String viewPage = "/study/0429_JSTL/el1.jsp";
//		RequestDispatcher dispatcher = requset.getRequestDispatcher(viewPage);
//		dispatcher.forward(requset, response);
		requset.getRequestDispatcher(viewPage).forward(requset, response);
	}
}
