package study2.pdsTest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study2.StudyInterface;

public class FileUpload2OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdsTest");
		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String oFileName1 = multipartRequest.getOriginalFileName("fName1");
		String oFileName2 = multipartRequest.getOriginalFileName("fName2");
		String oFileName3 = multipartRequest.getOriginalFileName("fName3");
		
		String fsName1 = multipartRequest.getFilesystemName("fName1");
		String fsName2 = multipartRequest.getFilesystemName("fName2");
		String fsName3 = multipartRequest.getFilesystemName("fName3");
		
		System.out.println("원본파일명: "+oFileName1+"/"+oFileName2+"/"+oFileName3);
		System.out.println("서버파일명: "+fsName1+"/"+fsName2+"/"+fsName3);
		
		if(oFileName1 == null || oFileName1.equals("")) {
			request.setAttribute("message", "파일을 업로드해주세요!");
		}
		else {
			request.setAttribute("message", "파일이 정상적으로 업로드되었습니다");
		}
		request.setAttribute("url", "FileUpload2.st");
	}

}
