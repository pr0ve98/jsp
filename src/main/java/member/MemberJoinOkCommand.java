package member;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.SecurityUtil;

public class MemberJoinOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/member");
		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String mid = multipartRequest.getParameter("mid") == null ? "" : multipartRequest.getParameter("mid");
		String pwd = multipartRequest.getParameter("pwd") == null ? "" : multipartRequest.getParameter("pwd");
		String nickName = multipartRequest.getParameter("nickName") == null ? "" : multipartRequest.getParameter("nickName");
		String name = multipartRequest.getParameter("name") == null ? "" : multipartRequest.getParameter("name");
		String gender = multipartRequest.getParameter("gender") == null ? "" : multipartRequest.getParameter("gender");
		String birthday = multipartRequest.getParameter("birthday") == null ? "" : multipartRequest.getParameter("birthday");
		String tel = multipartRequest.getParameter("tel") == null ? "" : multipartRequest.getParameter("tel");
		String address = multipartRequest.getParameter("address") == null ? "" : multipartRequest.getParameter("address");
		String email = multipartRequest.getParameter("email") == null ? "" : multipartRequest.getParameter("email");
		String homePage = multipartRequest.getParameter("homePage") == null ? "" : multipartRequest.getParameter("homePage");
		String job = multipartRequest.getParameter("job") == null ? "" : multipartRequest.getParameter("job");
		//String hobby = request.getParameter("hobby") == null ? "" : request.getParameter("hobby");
		String photo = multipartRequest.getFilesystemName("fName") == null ? "noimage.jpg" : multipartRequest.getFilesystemName("fName");
		String content = multipartRequest.getParameter("content") == null ? "" : multipartRequest.getParameter("content");
		String userInfor = multipartRequest.getParameter("userInfor") == null ? "" : multipartRequest.getParameter("userInfor");
		
		String[] hobbys = multipartRequest.getParameterValues("hobby");
		String hobby = "";
		if(hobbys.length != 0) {
			for(String h : hobbys) {
				hobby += h + "/";
			}
		}
		hobby = hobby.substring(0, hobby.length()-1);
		
		// DB에 저장시킬 자료 중 not null 데이터는 Back End 체크시켜준다.
		
		// 아이디/닉네임 중복체크
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberIdCheck(mid);
		if(vo.getMid() != null) {
			request.setAttribute("message", "이미 사용중인 아이디입니다.");
			request.setAttribute("url", "MemberJoin.mem");
			return;
		}
		
		// 비밀번호 암호화(SHA256) - salt키를 만든 후 암호화 시켜준다(uuid 코드 중 앞자리 8자리와 같이 병행처리 후 암호화)
		UUID uid = UUID.randomUUID();
		String salt = uid.toString().substring(0,8);
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(salt + pwd);
		pwd = salt + pwd;
		
		// 모든 체크가 끝난 자료는 vo에 담아서 DB에 저장처리한다.
		vo = new MemberVO();
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setNickName(nickName);
		vo.setName(name);
		vo.setGender(gender);
		vo.setBirthday(birthday);
		vo.setTel(tel);
		vo.setAddress(address);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setJob(job);
		vo.setHobby(hobby);
		vo.setPhoto(photo);
		vo.setContent(content);
		vo.setUserInfor(userInfor);
		
		int res = dao.setMemberJoinOk(vo);
		
		if(res != 0) {
			request.setAttribute("message", "회원가입을 축하합니다!");
			request.setAttribute("url", "MemberLogin.mem");
		}
		else {
			request.setAttribute("message", "회원가입에 실패했어요...");
			request.setAttribute("url", "MemberJoin.mem");
		}
	}

}
