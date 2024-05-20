package study2.pdsTest;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study2.StudyInterface;

public class FileUpload3OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdsTest");
		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		// 업로드된 파일의 정보를 추출해본다.
		
		Enumeration fileNames = multipartRequest.getFileNames();
		
		String file = "";
		String oFileName = "", fsName = "";
		
		while(fileNames.hasMoreElements()) {
			file = (String)fileNames.nextElement();
			oFileName += multipartRequest.getOriginalFileName(file)+"/";
			fsName += multipartRequest.getFilesystemName(file)+"/";
		}
		oFileName = oFileName.substring(0, oFileName.lastIndexOf("/"));
		fsName = fsName.substring(0, fsName.lastIndexOf("/"));
		System.out.println("원본파일명: "+oFileName);
		System.out.println("서버파일명: "+fsName);
		
		if(oFileName != null && !oFileName.equals("")) {
			request.setAttribute("message", "파일이 정상적으로 업로드되었습니다");
		}
		else {
			request.setAttribute("message", "파일업로드 실패!");
		}
		request.setAttribute("url", "FileUpload3.st");
	}

}
