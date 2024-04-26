package study.j0425;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0425/T14Ok3")
public class T14Ok3 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 T14Ok3 입니다");
		
		// 객체여서 문자 타입으로 강제 형변환
		String mid = (String)request.getAttribute("mid");
		String pwd = (String)request.getAttribute("pwd");
		String seqKey = (String)request.getAttribute("seqKey");
		String seqMasterKey = (String)request.getAttribute("seqMasterKey");
		String userPwd = pwd + seqKey;
		
		String viewPage = "";    
		if(!mid.equals("admin") || !userPwd.equals("1234"+seqMasterKey)) {
			request.setAttribute("loginFlag", "NO");
			viewPage = "/study/0425/t14_forward.jsp";
		}
		else {
			request.setAttribute("loginFlag", "OK");
			viewPage = "/study/0425/t14Res.jsp";	
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
