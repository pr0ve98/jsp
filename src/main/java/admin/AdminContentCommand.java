package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberVO;

public class AdminContentCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminDAO dao = new AdminDAO();
		ArrayList<MemberVO> vos1 = dao.getAdminMemberList(1);
		ArrayList<MemberVO> vos99 = dao.getAdminMemberList(99);
		
		request.setAttribute("mCount", vos1.size());
		request.setAttribute("m99Count", vos99.size());
	}

}
