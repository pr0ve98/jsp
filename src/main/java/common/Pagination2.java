package common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import board.BoardDAO;
import board.BoardVO;
import pds.PdsDAO;

public class Pagination2 {
	
	public static void pageChange(HttpServletRequest request, int pag, int pageSize, String contentsShow, String section, String part) {
		BoardDAO boardDao = new BoardDAO();
		PdsDAO pdsDao = new PdsDAO();
		int totRecCnt = 0;
		
		if(section.equals("board")) {
			//totRecCnt = boardDao.getTotalRecCnt(); // 게시판에 전체 레코드수 구하기
		}
		else if(section.equals("pds")) {
			
		}
		
		int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize)+1;
		if(pag > totPage) pag = 1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage - 1) / blockSize;
		
		List<BoardVO> vos = null;
		//List<PdsVO> vos = null;
		
		if(section.equals("board")) {
			//vos = boardDao.getBoardList(startIndexNo, pageSize); // 게시판의 전체 자료 가져오기
		}
		else if(section.equals("pds")) {
			//List<PdsVO> vos = boardDao.getBoardList(startIndexNo, pageSize); // 게시판의 전체 자료 가져오기
		}
		
		request.setAttribute("vos", vos);
		
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("totRecCnt", totRecCnt);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		
		request.setAttribute("section", section);
		request.setAttribute("part", part);
		
	}

}
