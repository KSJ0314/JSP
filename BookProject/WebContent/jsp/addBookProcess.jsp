<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.BookInfoDTO"%>
<%@page import="dao.BookInfoDAO"%>
<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	BookInfoDTO dto = new BookInfoDTO();

	dto.setBook_id(request.getParameter("book_id"));
	dto.setBook_title(request.getParameter("book_title"));
	dto.setBook_author(request.getParameter("book_author"));
	dto.setBook_price(Integer.parseInt(request.getParameter("book_price")));
	dto.setBook_date(Date.valueOf(request.getParameter("book_date")));
	dto.setBook_content(request.getParameter("book_content"));
	dto.setMember_id(request.getParameter("member_id"));
	
	BookInfoDAO dao = new BookInfoDAO();
	
	int result = dao.addBook(dto);
	
	if (result == 1){
		JSFunction.alertLocation("도서 추가 성공", "bookmain.jsp", out);
	} else {
		JSFunction.alertBack("도서 추가 실패", out);
	}
	
	dao.close();
%>