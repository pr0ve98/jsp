package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;

public class MemberDeleteCheckOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberIdCheck(mid);
		
		
		// 저장된 비밀번호에서 salt키를 분리시켜서 다시 암호화 시킨후 맞는지 비교처리한다.
		String salt = vo.getPwd().substring(0, 8);
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(salt + pwd);
		
		if(!vo.getPwd().substring(8).equals(pwd)) {
			request.setAttribute("message", "비밀번호를 확인해주세요");
			request.setAttribute("url", "MemberDelete.mem");
			return;
		}
		
		int res = dao.setMemberDeleteUpdate(mid);
		
		if(res != 0) {
			session.invalidate();
			request.setAttribute("message", "회원 탈퇴 되었습니다.\\n같은 아이디로 1개월간 재가입 불가합니다.");
			request.setAttribute("url", request.getContextPath()+"/Main");
		}
		else {
			request.setAttribute("message", "회원 탈퇴 실패!");
			request.setAttribute("url", "MemberMain.mem");
		}
	}

}
