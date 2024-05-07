package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test5EditOkCommand implements Test5Interface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = (String)request.getAttribute("mid");
		String message = mid+"님의 정보가 수정되었습니다.";
		request.setAttribute("message", message);
		request.setAttribute("url", "test5.do5");
	}

}
