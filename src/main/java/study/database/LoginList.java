package study.database;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guest.GuestVO;

@SuppressWarnings("serial")
@WebServlet("/study/database/LoginList")
public class LoginList extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginDAO dao = new LoginDAO();
		
		String val = request.getParameter("val")==null ? "idx" : request.getParameter("val");
		
//		ArrayList<LoginVO> vos = dao.getLoginList();
//		//System.out.println("vos "+vos);
//		
//		request.setAttribute("vos", vos);
		
		// 1. 현재 페이지번호를 구해온다.
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		
		// 2. 한페이지의 분량을 구한다.
		int pageSize = request.getParameter("pageSize")==null ? 3 : Integer.parseInt(request.getParameter("pageSize"));
		
		// 3. 총 레코드 건수를 구한다.(sql 명령어 중 count함수를 이용)
		int totRecCnt = dao.getTotalRecCnt();
		
		// 4. 총 페이지 건수를 구한다.
		int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize)+1;
		if(pag > totPage) pag = 1;
		
		// 5. 현재 페이지에서 출력할 '시작 인덱스 번호'를 구한다.
		int startIndexNo = (pag - 1) * pageSize;
		
		// 6. 현재 화면에 표시될 시작 실제번호를 구한다.
		int curScrStartNo = totRecCnt - startIndexNo;
		
		// 한페이지에 표시할 건수만을(pageSize수만큼) DAO에서 가져온다.
		ArrayList<LoginVO> vos = dao.getLoginList(startIndexNo, pageSize, val);
		
		// 설정(지정)된 페이지의 모든 변수들을 view 페이지로 넘겨줄 준비를 한다.(나중엔 vo로 넘길것)
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("totRecCnt", totRecCnt);
		request.setAttribute("totPage", totPage);
		// startIndexNo 는 필요없음
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("val", val);
		request.setAttribute("vos", vos);
		
		String viewPage = "/study/database/loginMain.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
