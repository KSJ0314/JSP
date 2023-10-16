<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>

<%
	String saveDirectory = application.getRealPath("/Uploads");
	String sName = request.getParameter("sName");
	String oName = request.getParameter("oName");
	
	try{
		File file = new File(saveDirectory, sName);
		InputStream inStream = new FileInputStream(file);
		
		// 웹 브라우저 종류
		String client = request.getHeader("User-agent");
		
		// 익스플로러 = WOW64		
		if(client.indexOf("WOW64")==-1){
			// 익플이 아니면 utf-8
			oName = new String(oName.getBytes("utf-8"), "ISO-8859-1");
		} else {
			// 익플이면 KSCJ5601 방식이면 한글 처리
			oName = new String(oName.getBytes("KSC5601"), "ISO-8859-1");
		}
		
		// 응답 헤더 초기화
		response.reset();
		
		// 8비트 스트림 설정
		response.setContentType("application/octet-stream");
		
		response.setHeader("Content-Disposition", "attachment; filename=\""+oName+"\"");
		response.setHeader("Content-Length", ""+file.length());
		
		// 출력 스트림 초기화
		out.clear();
		
		OutputStream outStream = response.getOutputStream();
		byte[] b = new byte[(int)file.length()];
		int readBuffer = 0;
		while((readBuffer = inStream.read(b))>0){
			outStream.write(b, 0, readBuffer);
		}
		
		inStream.close();
		outStream.close();
		
		
	} catch(Exception e){
		e.printStackTrace();
		JSFunction.alertBack("예외 발생", out);
	}
	
	
	
	
%>

