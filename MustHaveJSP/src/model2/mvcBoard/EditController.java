package model2.mvcBoard;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/mvcboard/edit.do")
public class EditController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx");
		MVCBoardDAO dao = new MVCBoardDAO();
		MVCBoardDTO dto = dao.selectView(idx);
		dao.close();
		
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("/14MVCBoard/Edit.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		ServletContext application = getServletContext();
		
		String saveDirectory = application.getRealPath("/Uploads");
		int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
		
		MultipartRequest mr = FileUtil.uploadFile(request, saveDirectory, maxPostSize);
		
		if (mr == null) {
			JSFunction.alertBack(response, "용량 초과");
		}
		
		String idx = mr.getParameter("idx");
		String preOfile = mr.getParameter("preOfile");
		String preSfile = mr.getParameter("preSfile");
		String name = mr.getParameter("name");
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		String fileName = mr.getFilesystemName("fileName");
		
		MVCBoardDAO dao = new MVCBoardDAO();
		MVCBoardDTO dto = dao.selectView(idx);
		
		String pw = (String)session.getAttribute("pw");
		session.removeAttribute("pw");
		
		dto.setIdx(idx);
		dto.setName(name);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setPw(pw);
		
		if(fileName != null) {
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new java.util.Date());
			String ext = fileName.substring(fileName.lastIndexOf("."));
			String newFileName = now + ext;	

			File ofile = new File(saveDirectory+File.separator+fileName);
			File sfile = new File(saveDirectory+File.separator+newFileName);
			ofile.renameTo(sfile);
			
			dto.setOfile(fileName);
			dto.setSfile(newFileName);
			
			FileUtil.deleteFile(request, "/Uploads", preSfile);
		} else {
			dto.setOfile(preOfile);
			dto.setSfile(preSfile);
		}
		
		if (!dto.getPw().equals(pw)) {
			JSFunction.alertBack(response, "비밀번호가 다릅니다.");
			return;
		}
		
		dao.updatePost(dto);
		dao.close();
		
		JSFunction.alertLocation(response, "수정 완료", "../mvcboard/view.do?idx="+idx);
	} 

}
