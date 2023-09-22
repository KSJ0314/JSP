<%@page import="common.JSFunction"%>
<%@page import="java.util.ArrayList"%>
<%@page import="common.MysqlConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");

	MysqlConnect ms = new MysqlConnect();
	
	try{
		String sql = "select * from mem";
		ms.st = ms.con.createStatement();
		ms.rs = ms.st.executeQuery(sql);
		ArrayList<String> idList = new ArrayList<>();
		
		while (ms.rs.next()){
			idList.add(ms.rs.getString(1));
		}
		
		for (String str : idList){
			if (id.equals(str)){
				JSFunction.alertBack("중복 있음", out);
			}
		}
	} catch(Exception e){
		out.print("연결실패");
	} finally {
		ms.close();
		JSFunction.alertBack("중복 없음", out);
	}
%>