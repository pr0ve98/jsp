package study.j0426;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.tools.DocumentationTool.Location;

@SuppressWarnings("serial")
@WebServlet("/j0426/E1Ok")
public class E1Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String idSave = request.getParameter("idSave")==null ? "no" : "yes";
		Cookie[] cookies = request.getCookies();
		
		PrintWriter out = response.getWriter();
		String viewPage = "";
		
		if(!mid.equals("admin") || !pwd.equals("1234")) {
			out.println("<script>");
			out.println("alert('일치하지 않습니다. 다시 입력하세요.');");
			out.println("window.location.href='" + request.getContextPath() + "/study/0427_storage/e1_Login.jsp';");
			out.println("</script>");
		}
		else {
			if(!idSave.equals("no")) {
				boolean cMidCheck = false;
				for(Cookie c : cookies) {
					if(c.getName().equals("cMid")) {
						cMidCheck = true;
						break;
					}
				}
				if(!cMidCheck) {
					Cookie cMid = new Cookie("cMid", mid);
					cMid.setMaxAge(60*60*24);
					cMid.setPath("/"); // 가장 상위 폴더에 쿠키를 저장하겠다는 뜻(못 찾는 경우 방지)
					response.addCookie(cMid);			
				}
			}
			else {
				for(int i=0; i<cookies.length; i++){
					if(cookies[i].getName().equals("cMid")) {
						cookies[i].setMaxAge(0);
						cookies[i].setPath("/");
						response.addCookie(cookies[i]);
					}
				}
			}
			// request에 담아 넘기면 쿼리스트링을 쓰지 않아도 됨
			request.setAttribute("mid", mid);
			viewPage = "/study/0427_storage/e1_Main.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
			
	}
}
