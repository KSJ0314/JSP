package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberShipDAO;
import dto.MemberShipDTO;
import util.JSFunction;

public class Member extends HttpServlet {
	
	MemberShipDAO dao;
	
	@Override
	public void init() throws ServletException {
		dao = new MemberShipDAO();
	}

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		
		if(command.equals("/mvc/login")){
			request.getRequestDispatcher("/member/login.jsp").forward(request, response);
		} else if(command.equals("/mvc/add")){
			request.getRequestDispatcher("/member/addMember.jsp").forward(request, response);
		} else if(command.equals("/mvc/logout")){
			session.removeAttribute("UserId");
			session.removeAttribute("UserName");
			JSFunction.alertLocation(response, "로그아웃 성공", "/mvctest/main.jsp");
		} else if(command.equals("/mvc/edit")){
			MemberShipDTO dto = dao.getDTO((String)session.getAttribute("UserId"));
			request.setAttribute("dto", dto);
			request.getRequestDispatcher("/member/editMember.jsp").forward(request, response);
		} else if(command.equals("/mvc/delete")){
			request.getRequestDispatcher("/member/deleteMember.jsp").forward(request, response);
		} 
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		
		if(command.equals("/mvc/login")){
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			String name = dao.Login(id, pw);
			if (name != null && !name.equals("")) {
				session.setAttribute("UserId", id);
				session.setAttribute("UserName", name);
				JSFunction.alertLocation(response, "로그인 성공", "/mvctest/main.jsp");
			} else {
				JSFunction.alertBack(response, "로그인 실패");
			}
			
		} else if(command.equals("/mvc/add")){
			MemberShipDTO dto = new MemberShipDTO();
			dto.setId(request.getParameter("id"));
			dto.setPw(request.getParameter("pw"));
			dto.setName(request.getParameter("name"));
			dto.setSex(request.getParameter("sex"));
			try {
				dto.setBirth(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("birth")));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			String email = request.getParameter("email")+request.getParameter("domain");
			dto.setEmail(email);
			dto.setTell(request.getParameter("tell"));
			dto.setAddr(request.getParameter("addr"));
			
			dao.insertDTO(dto);
			
			JSFunction.alertLocation(response, "회원가입 성공", "/mvctest/main.jsp");
		} else if(command.equals("/mvc/edit")){
			
			MemberShipDTO dto = new MemberShipDTO();
			dto.setId(request.getParameter("id"));
			dto.setPw(request.getParameter("pw"));
			dto.setName(request.getParameter("name"));
			dto.setSex(request.getParameter("sex"));
			try {
				dto.setBirth(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("birth")));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			String email = request.getParameter("email")+request.getParameter("domain");
			dto.setEmail(email);
			dto.setTell(request.getParameter("tell"));
			dto.setAddr(request.getParameter("addr"));
			
			dao.updateDTO(dto, (String)session.getAttribute("UserId"));
			session.setAttribute("UserId", dto.getId());
			session.setAttribute("UserName", dto.getName());
			JSFunction.alertLocation(response, "회원수정 성공", "/mvctest/main.jsp");
		} else if(command.equals("/mvc/delete")){
			String id = (String)session.getAttribute("UserId");
			String pw = request.getParameter("pw");
			int result = dao.deleteDTO(id, pw);
			if (result == 1) {
				session.removeAttribute("UserId");
				session.removeAttribute("UserName");
				JSFunction.alertLocation(response, "회원탈퇴 성공", "/mvctest/main.jsp");
			} else {
				JSFunction.alertBack(response, "회원탈퇴 실패");
			}
		} 
	}

	@Override
	public void destroy() {
		dao.close();
	}
	
}
