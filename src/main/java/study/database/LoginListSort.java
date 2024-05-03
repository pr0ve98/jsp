package study.database;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/database/LoginListSort")
public class LoginListSort extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String val = request.getParameter("val")==null ? "" : request.getParameter("val");
		
		LoginDAO dao = new LoginDAO();
		ArrayList<LoginVO> vos = dao.getLoginSortList(val);
		
		request.setAttribute("vos", vos);
		
		String viewPage = "/study/database/loginMain.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
