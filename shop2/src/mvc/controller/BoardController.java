package mvc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JSFunction;
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
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		if(command.equals("list.board")){	// 등록된 글 출력
			doPost(request, response);
		} else if(command.equals("write.board")){	// 새로운 글 쓰기
			response.sendRedirect(Path+"/board/write.jsp");
		} else if(command.equals("view.board")){
			doPost(request, response);
		} else if(command.equals("delete.board")){
			doPost(request, response);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();	// 절대 경로 (현재 파일 이름 포함)
		String Path = request.getContextPath();	// 절대 경로 (현재 파일 이름 미포함)
		String command = uri.substring(Path.length()+1);	// 슬래시 제외 현재 파일 이름
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		if(command.equals("list.board")){	// 등록된 글 출력
			requestBoard(request);
			request.getRequestDispatcher("/board/list.jsp").forward(request, response);
			
		} else if(command.equals("write.board")){	// 새로운 글 쓰기
			writeBoard(request);
			JSFunction.alertLocation(response, "작성 성공", Path+"/list.board");
			
		} else if(command.equals("view.board")){
			viewBoard(request);
			request.getRequestDispatcher("/board/view.jsp").forward(request, response);
			
		} else if(command.equals("edit.board")){
			editBoard(request);
			request.getRequestDispatcher("/list.board").forward(request, response);
			
		} else if(command.equals("delete.board")){
			deleteBoard(request);
			request.getRequestDispatcher("/list.board").forward(request, response);
		}
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
		
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		int total_row = dao.getListCount(items, text);
		
		int total_page = (int)Math.ceil((double)total_row/LISTCOUNT);
		
		List<BoardDTO> boardlist = dao.getBoardList(pageNum, LISTCOUNT, items, text, total_row);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_row", total_row);
		request.setAttribute("total_page", total_page);
		request.setAttribute("boardlist", boardlist);
		
	}
	
	private void writeBoard(HttpServletRequest request) {
		BoardDTO dto = new BoardDTO();
		dto.setId(request.getParameter("id"));
		dto.setName(request.getParameter("name"));
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		dto.setIp(request.getRemoteAddr());
		
		dao.insertBoard(dto);
	}
	
	private void viewBoard(HttpServletRequest request) {
		BoardDTO dto = dao.getDTO(request.getParameter("num"));
		request.setAttribute("dto", dto);
	}
	
	private void editBoard(HttpServletRequest request) {
		BoardDTO dto = new BoardDTO();
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		dao.editBoard(dto, request.getParameter("num"));
	}
	
	private void deleteBoard(HttpServletRequest request) {
		dao.deleteBoard(request.getParameter("num"));
	}
}
