package study.j0425;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0425_____________________/T12Ok")
public class T12Ok extends HttpServlet {
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
		String[] mnts = request.getParameterValues("mnt");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		content = content.replace("\n", "<br/>");
		String fileName = request.getParameter("fileName");
		
		String hobby = "";
		if(hobbys != null) {
			for(String h : hobbys) {
				hobby += h+"/";
			}
			hobby = hobby.substring(0, hobby.length()-1);
		}
		String mnt = "";
		if(mnts != null) {
			for(String m : mnts) {
				mnt += m+"/";
			}
			mnt = mnt.substring(0, mnt.length()-1);
		}
		System.out.println("성명 "+name);
		System.out.println("나이: "+age);
		System.out.println("성별: "+gender);
		System.out.println("취미: "+hobby);
		System.out.println("직업: "+job);
		System.out.println("가본 산: "+mnt);
		System.out.println("자기소개: "+content);
		System.out.println("파일명: "+fileName);
		
		T12VO vo = new T12VO();
		vo.setName(name);
		vo.setAge(age);
		vo.setGender(gender);
		vo.setHobby(hobby);
		vo.setJob(job);
		vo.setMnt(mnt);
		vo.setContent(content);
		vo.setFileName(fileName);
		
		// response.sendRedirect(request.getContextPath()+"/study/0425/t12_Main.jsp?name="+name+"&age="+age+"&gender="+gender+"&hobby="+hobby+"&job="+job+"&mnt="+mnt);
		//response.sendRedirect(request.getContextPath()+"/study/0425/t12_Main.jsp?vo="+vo);
		
		request.setAttribute("vo", vo);
		
		String viewPage = "/study/0425/t12_Main.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
