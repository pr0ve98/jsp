package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.do5")
public class Test5Controller extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Test5Interface command = null;
		String viewPage = "/WEB-INF/study2/mapping/";
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		
		String mid = request.getParameter("mid");
		request.setAttribute("mid", mid);
		
		if(com.equals("test5")) {
			viewPage += "test5.jsp";
		}
		else if(com.equals("join")) viewPage += "t5_join.jsp";
		else if(com.equals("joinOk")) {
			command = new Test5JoinOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("edit")) viewPage += "t5_edit.jsp";
		else if(com.equals("editOk")) {
			command = new Test5EditOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("delete")) viewPage += "t5_delete.jsp";
		else if(com.equals("deleteOk")) {
			command = new Test5DeleteOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("search")) viewPage += "t5_search.jsp";
		else if(com.equals("searchOk")) viewPage += "t5_searchOk.jsp";
		else if(com.equals("list")) viewPage += "t5_list.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
