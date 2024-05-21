package study2.pdsTest;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.ClientInfoStatus;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class JavaFileDownloadCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdsTest/");
		String fileName = request.getParameter("file")==null ? "" : request.getParameter("file");
		
		File file = new File(realPath+fileName);
		
		/* HTTP 프로토콜 형식에 맞도록 헤더에 전송할 파일의 정보를 담아준다 */
		String mimeType = request.getServletContext().getMimeType(file.toString());
		if(mimeType == null) response.setContentType("application/octet-stream");	// 2진 바이너리 문자
		
		String downloadName = "";
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) {
			downloadName = new String(fileName.getBytes("UTF-8"), "8859_1"); // 윈도우에서 적용해주는 기본 방식 8859_1을 UTF-8 변경
		}
		else {
			downloadName = new String(fileName.getBytes("EUC-KR"), "8859_1");
		}
		
		// 헤더에 정보를 첨부
		response.setHeader("Content-Disposition", "attachment;filename="+downloadName);
		
		FileInputStream fis = new FileInputStream(file);
		//FileOutputStream fos = new FileOutputStream(file);
		ServletOutputStream sos = response.getOutputStream();
		
		byte[] buffer = new byte[2048];
		int size = 0;
		while((size = fis.read(buffer)) != -1) {
//		while((size = fis.read(buffer, 0, buffer.length)) != -1) {
			sos.write(buffer, 0, size);
		}
		sos.flush(); // 버퍼에 남아있는 것까지 전부 보내라
		fis.close();
		sos.close();
	}

}
