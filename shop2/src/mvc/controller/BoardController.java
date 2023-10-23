package mvc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 5;
	BoardDAO dao;
	
	@Override
	public void init() throws ServletException {
		dao = new BoardDAO();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();	// 절대 경로 (현재 파일 이름 포함)
		String Path = request.getContextPath();	// 절대 경로 (현재 파일 이름 미포함)
		String command = uri.substring(Path.length()+1);	// 슬래시 제외 현재 파일 이름
		RequestDispatcher rd = request.getRequestDispatcher("");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		if(command.equals("BoardListAction.board")){	// 등록된 글 출력
			doPost(request, response);
		} else if(command.equals("BoardWriteAction.board")){	// 새로운 글 쓰기
			
		} else if(command.equals("BoardViewAction.board")){
			
		} else if(command.equals("BoardEditAction.board")){
			
		} else if(command.equals("BoardDeleteAction.board")){
			
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();	// 절대 경로 (현재 파일 이름 포함)
		String Path = request.getContextPath();	// 절대 경로 (현재 파일 이름 미포함)
		String command = uri.substring(Path.length()+1);	// 슬래시 제외 현재 파일 이름
		RequestDispatcher rd = request.getRequestDispatcher("");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		if(command.equals("BoardListAction.board")){	// 등록된 글 출력
			requestBoard(request);
			rd = request.getRequestDispatcher("./board/list.jsp");
		} else if(command.equals("BoardWriteAction.board")){	// 새로운 글 쓰기
			
			rd = request.getRequestDispatcher("./board/write.jsp");
		} else if(command.equals("BoardViewAction.board")){
			
			rd = request.getRequestDispatcher("./board/view.jsp");
		} else if(command.equals("BoardEditAction.board")){
			
			rd = request.getRequestDispatcher("./board/write.jsp");
		} else if(command.equals("BoardDeleteAction.board")){
			
			rd = request.getRequestDispatcher("./board/write.jsp");
		}
		rd.forward(request, response);
	}

	@Override
	public void destroy() {
		dao.close();
	}
	
	private void requestBoard(HttpServletRequest request) {
		
		int pageNum = 1;
		
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		String items = request.getParameter("itmes");
		String text = request.getParameter("text");
		
		int total_row = dao.getListCount(items, text);
		
		List<BoardDTO> boardlist = dao.getBoardList(pageNum, LISTCOUNT, items, text, total_row);
		
		int total_page = (int)Math.ceil((double)total_row/LISTCOUNT);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page);
		request.setAttribute("total_row", total_row);
		request.setAttribute("boardlist", boardlist);
		
	}
	
}
