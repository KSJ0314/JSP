package model2.mvcBoard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fileupload.FileUtil;
import utils.JSFunction;

public class PassController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/14MVCBoard/Pass.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mode = request.getParameter("mode");
		String idx = request.getParameter("idx");
		String pw = request.getParameter("pw");
		
		MVCBoardDAO dao = new MVCBoardDAO();
		MVCBoardDTO dto = dao.selectView(idx);
		
		if (!dto.getPw().equals(pw)) {
			JSFunction.alertBack(response, "비밀번호가 다릅니다.");
			return;
		}
		
		if (mode.equals("edit")) {
			dao.close();
			request.getSession().setAttribute("pw", pw);
			response.sendRedirect("../mvcboard/edit.do?idx="+idx);
			// request.getRequestDispatcher("../mvcboard/edit.do").forward(request, response);
		} else if (mode.equals("delete")) {
			dao.deletePost(idx);
			dao.close();
			FileUtil.deleteFile(request, "/Uploads", dto.getSfile());
			JSFunction.alertLocation(response, "삭제완료", "../mvcboard/list.do");
		}
		
	} 

}
