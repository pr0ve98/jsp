package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Pagination;

public class BoardListCommand2 implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		
		// 페이징처리 시작
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 10 : Integer.parseInt(request.getParameter("pageSize"));
		String part = request.getParameter("part")==null ? "전체" : request.getParameter("part");
		//int totRecCnt = dao.getTotalRecCnt();
		//int startIndexNo = Pagination.pageChange(pag, pageSize, totRecCnt, request, part);
//		int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize)+1;
//		if(pag > totPage) pag = 1;
//		int startIndexNo = (pag - 1) * pageSize;
//		int curScrStartNo = totRecCnt - startIndexNo;
//		int blockSize = 3;
//		int curBlock = (pag - 1) / blockSize;
//		int lastBlock = (totPage - 1) / blockSize;
		// 페이징처리 끝
		
		//ArrayList<BoardVO> vos = dao.getBoardList(startIndexNo, pageSize);
		
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		//request.setAttribute("totRecCnt", totRecCnt);
//		request.setAttribute("totPage", totPage);
//		request.setAttribute("curScrStartNo", curScrStartNo);
//		request.setAttribute("blockSize", blockSize);
//		request.setAttribute("curBlock", curBlock);
//		request.setAttribute("lastBlock", lastBlock);
		
		//request.setAttribute("vos", vos);
	}

}
