package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberIdCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		
		MemberVO vo = dao.getMemberIdCheck(mid);
		
		String str = "0";
		if(vo.getMid() != null) str = "1";
		
		response.getWriter().write(str);
	}

}
