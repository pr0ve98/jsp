package study.j0425;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0425/T06Ok")
public class T06Ok extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		// Front에서 넘어온 값들을 변수에 담아서 처리한다.
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		int age = (request.getParameter("age")==null || request.getParameter("age")=="") ? 0 : Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String[] hobbys = request.getParameterValues("hobby");
		String job = request.getParameter("job");
		String[] mtns = request.getParameterValues("mtn");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		content = content.replace("\n", "<br/>");
		String fileName = request.getParameter("fileName");
		
		System.out.println("성명 "+name+" 나이 "+age+" 성별 "+gender);
		String hobby = "";
		if(hobbys != null) {
			for(String h : hobbys) {
				hobby += h+"/";
			}
			hobby = hobby.substring(0, hobby.length()-1);
		}
		String mtn = "";
		if(mtns != null) {
			for(String m : mtns) {
				mtn += m+"/";
			}
			mtn = mtn.substring(0, mtn.length()-1);
		}
		System.out.print("취미: "+hobby);
		System.out.print("직업: "+job);
		System.out.print("가본 산: "+mtn);
		System.out.println("자기소개: "+content);
		System.out.println("파일명: "+fileName);
		
		PrintWriter out = response.getWriter();
		
		out.println("<p>성명 "+name+" 나이 "+age+" 성별 "+gender+" 취미 "+hobby+" 직업 "+job+" 가본 산 "+mtn+"</p>");
		out.println("<p>자기소개: "+content+"</p>");
		out.println("<p><a href='"+request.getContextPath()+"/study/0425/t06_form.jsp'>돌아가기</a></p>");
	}
}
