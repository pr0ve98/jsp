package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberNickCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		String nickName = request.getParameter("nickName") == null ? "" : request.getParameter("nickName");
		
		MemberVO vo = dao.getMemberNickCheck(nickName);
		
		String str = "0";
		if(vo.getNickName() != null) str = "1";
		
		response.getWriter().write(str);

	}

}
