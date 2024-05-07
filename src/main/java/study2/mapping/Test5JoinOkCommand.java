package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test5JoinOkCommand implements Test5Interface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String message = "회원가입 완료!";
		request.setAttribute("message", message);
		request.setAttribute("url", "test5.do5");
	}

}
