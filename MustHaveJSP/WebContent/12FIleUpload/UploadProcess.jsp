<%@page import="fileupload.MyfileDAO"%>
<%@page import="fileupload.MyfileDTO"%>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%
	String saveDirectory = application.getRealPath("/Uploads");	// 실제 위치
	int maxPostSize = 1024 * 1000; // 1Mb
	String encoding = "utf-8";
	
	try{
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
		
		String name = mr.getParameter("name");
		String title = mr.getParameter("title");
		String[] cateArr = mr.getParameterValues("cate");
		/* StringBuffer cateBuf = new StringBuffer();
		if (cateArr==null){
			cateBuf.append("선택 없음");
		} else {
			for (String s : cateArr){
				cateBuf.append(s+" ");
			}
		} */
		String cate = "";
		for (String str : cateArr){
			cate += str + " ";
		}
		
		String fileName = mr.getFilesystemName("attachedFile");	// 업로드한 파일 이름
		String ext = fileName.substring(fileName.lastIndexOf("."));	// 업로드한 파일 이름에서 확장자 추출
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new java.util.Date());	// 현재 날짜 시간 저장
		String newFileName = now + ext;	// 예) 장동건.jpg -> 20231012_154011973.jpg
		File oldFile = new File(saveDirectory+File.separator+fileName);
		File newFile = new File(saveDirectory+File.separator+newFileName);
		oldFile.renameTo(newFile);
		
		MyfileDTO dto = new MyfileDTO();
		MyfileDAO dao = new MyfileDAO();
		dto.setName(name);
		dto.setTitle(title);
		dto.setCate(cate);
		dto.setOfile(fileName);
		dto.setSfile(newFileName);
		
		dao.insertFile(dto);
		dao.close();
		
		response.sendRedirect("FileList.jsp");
		
	} catch(Exception e){
		e.printStackTrace();
		request.setAttribute("errorMessage", "파일 업로드 오류");
		request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
	}
%>