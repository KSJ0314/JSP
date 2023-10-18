package model2.mvcBoard;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.*;

public class WriteController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/14MVCBoard/Write.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ServletContext application = getServletContext();
		
		String saveDirectory = application.getRealPath("/Uploads");
		int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize")); // 1Mb
		
		MultipartRequest mr = FileUtil.uploadFile(request, saveDirectory, maxPostSize);
		
		if(mr==null) {
			JSFunction.alertLocation(response, "첨부 파일 용량 초과", "../mvcboard/write.do");
			return;
		}
		
		String name = mr.getParameter("name");
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		String pw = mr.getParameter("pw");
		
		MVCBoardDTO dto = new MVCBoardDTO();
		dto.setName(name);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setPw(pw);
		
		String ofile = mr.getFilesystemName("ofile");
		if(ofile != null) {
			String ext = ofile.substring(ofile.lastIndexOf("."));	// 업로드한 파일 이름에서 확장자 추출
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new java.util.Date());	// 현재 날짜 시간 저장
			String sfile = now + ext;	// 예) 장동건.jpg -> 20231012_154011973.jpg
			
			// 실제 저장은 newFileName 1개
			File oldFile = new File(saveDirectory+File.separator+ofile);
			File newFile = new File(saveDirectory+File.separator+sfile);
			oldFile.renameTo(newFile);
			
			dto.setOfile(ofile);
			dto.setSfile(sfile);
		}
		
		MVCBoardDAO dao = new MVCBoardDAO();
		int result = dao.insertWrite(dto);
		dao.close();
		
		if (result == 1) {
			response.sendRedirect("../mvcboard/list.do");
		} else {
			response.sendRedirect("../mvcboard/write.do");
		}
	}

	
	
}
