package study.j0425;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0425/T10Ok")
public class T10Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		// Front에서 넘어온 값들을 변수에 담아서 처리한다.
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");

		// DB에서 mid와 같은 자료가 있는지 검색후 돌아온다.
		if(!mid.equals("admin") || !pwd.equals("1234")) {
			// JSP로 보내서 다시 로그인 하라는 메세지를 띄우도록 한다
			response.sendRedirect(request.getContextPath()+"/study/0425/t10_Login.jsp?msgFlag=no"); // 문자 값을 넣어주는 쿼리스트링 방식
			return;
		}
		// 정상 회원들 처리
		System.out.println("정상 로그인 처리됨");
		response.sendRedirect(request.getContextPath()+"/study/0425/t10_Main.jsp?msgFlag=ok&mid="+mid);
	}
}
