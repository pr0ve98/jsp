package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.complaint.BoardComplaintInputCommand;
import admin.complaint.ComplaintCheckCommand;
import admin.complaint.ComplaintListCommand;
import admin.member.MemberDeleteOkCommand;
import admin.member.MemberLevelChangeCommand;
import admin.review.ReviewDeleteCommand;
import admin.review.ReviewInputOkCommand;
import admin.review.ReviewReplyInputOkCommand;
import board.BoardListCommand;;

@SuppressWarnings("serial")
@WebServlet("*.ad")
public class AdminController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminInterface command = null;
		String viewPage = "/WEB-INF/admin";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		// 인증처리
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 999 : (int)session.getAttribute("sLevel");
		
		if(com.equals("/BoardComplaintInput")) {
			command = new BoardComplaintInputCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ReviewInputOk")) {
			command = new ReviewInputOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ReviewDelete")) {
			command = new ReviewDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ReviewReplyInputOk")) {
			command = new ReviewReplyInputOkCommand();
			command.execute(request, response);
			return;
		}
		else if(level > 0) {
			request.setAttribute("message", "관리자만 사용 가능합니다.");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/AdminMain")) {
			viewPage += "/adminMain.jsp";
		}
		else if(com.equals("/AdminLeft")) {
			viewPage += "/adminLeft.jsp";
		}
		else if(com.equals("/AdminContent")) {
			command = new AdminContentCommand();
			command.execute(request, response);
			viewPage += "/adminContent.jsp";
		}
		else if(com.equals("/MemberList")) {
			command = new admin.member.MemberListCommand();
			command.execute(request, response);
			viewPage += "/member/memberList.jsp";
		}
		else if(com.equals("/MemberLevelChange")) {
			command = new MemberLevelChangeCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/MemberDeleteOk")) {
			command = new MemberDeleteOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/BoardList")) {
			command = new admin.board.BoardListCommand();
			command.execute(request, response);
			viewPage += "/board/boardList.jsp";
		}
		else if(com.equals("/BoardContent")) {
			command = new admin.board.BoardContentCommand();
			command.execute(request, response);
			viewPage += "/board/boardContent.jsp";
		}
		else if(com.equals("/ComplaintList")) {
			command = new ComplaintListCommand();
			command.execute(request, response);
			viewPage += "/complaint/complaintList.jsp";
		}
		else if(com.equals("/ComplaintCheck")) {
			command = new ComplaintCheckCommand();
			command.execute(request, response);
			return;
		}

		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
