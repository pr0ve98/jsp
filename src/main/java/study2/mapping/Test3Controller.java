package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.do3")
public class Test3Controller extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("이곳은 *.do3 서블릿입니다");

//		StringBuffer url = request.getRequestURL();
//		System.out.println("url: "+url);
		
		String uri = request.getRequestURI();
		System.out.println("uri: "+uri);
		
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		System.out.println("com: "+com);
		
		int su1 = request.getParameter("su1")==null ? 0 : Integer.parseInt(request.getParameter("su1"));
		int su2 = request.getParameter("su2")==null ? 0 : Integer.parseInt(request.getParameter("su2"));
		
		if(com.equals("list")) {
			System.out.println("여기는 list입니다.");
		}
		else if(com.equals("input")) {
			System.out.println("여기는 input입니다.");
		}
		else if(com.equals("update")) {
			System.out.println("여기는 update입니다.");
		}
		else if(com.equals("delete")) {
			System.out.println("여기는 delete입니다.");
		}
		else if(com.equals("search")) {
			System.out.println("여기는 search입니다.");
		}
		else if(com.equals("hap")) {
			System.out.println("여기는 hap입니다.");
			
			Test1Service service = new Test1Service();
			int hap = service.hap(su1, su2);
			request.setAttribute("hap", hap);
		}
		else if(com.equals("cha")) {
			System.out.println("여기는 cha입니다.");
			
			Test1Service service = new Test1Service();
			int cha = service.cha(su1, su2);
			request.setAttribute("cha", cha);
		}
		else if(com.equals("gop")) {
			System.out.println("여기는 gop입니다.");
			request.setAttribute("gop", (su1 * su2));
		}
		else if(com.equals("mok")) {
			System.out.println("여기는 mok입니다.");
			String mok = su2 == 0 ? "계산불가" : (su1 / su2)+"";
			request.setAttribute("mok", mok);
		}
		
		request.setAttribute("su1", su1);
		request.setAttribute("su2", su2);
		
		String viewPage = "/WEB-INF/study2/mapping/test3.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
