package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberUpdateCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberIdCheck(mid);
		
		// 전화번호 분리하기
		String[] tel = vo.getTel().split("-");
		if(tel[1].equals(" ")) tel[1] = "";
		if(tel[2].equals(" ")) tel[2] = "";
		request.setAttribute("tel1", tel[0]);
		request.setAttribute("tel2", tel[1]);
		request.setAttribute("tel3", tel[2]);
		
		// 주소 분리하기
		String[] address = vo.getAddress().split("/");
		request.setAttribute("postcode", address[0]);
		request.setAttribute("roadAddress", address[1]);
		request.setAttribute("detailAddress", address[2]);
		request.setAttribute("extraAddress", address[3]);
		
		// 취미는 통째로 넘겨서 jstl에서 포함유무로 처리한다.
		request.setAttribute("hobby", vo.getHobby());
		
		request.setAttribute("vo", vo);
	}

}
