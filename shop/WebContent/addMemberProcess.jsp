<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@page import="dao.MemberDAO"%>
<%@page import="common.JSFunction"%>
<%@page import="common.SQLConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%
	String saveDirectory = application.getRealPath("/Uploads");
	int maxPostSize = 1024 * 1024;
	String encoding = "utf-8";

	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
	
	String id = mr.getParameter("id");
	String name = mr.getParameter("name");
	String pw = mr.getParameter("pw");
	String phone = mr.getParameter("phone");
	String address = mr.getParameter("address");
	
	String fileName = mr.getFilesystemName("photoImage");
	
	File file = new File(saveDirectory + File.separator + fileName);
	MemberDAO dao = new MemberDAO();
	dao.addDTO(id, name, pw, phone, address, fileName, out);
	dao.close();
%>