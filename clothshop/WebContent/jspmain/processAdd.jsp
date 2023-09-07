<%@page import="dto.ClothRepository"%>
<%@page import="dto.Cloth"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		request.setCharacterEncoding("utf-8");
		String clothId = request.getParameter("clothId");	
		String clothName = request.getParameter("clothName");
		Integer clothCost = 0;
		if (!request.getParameter("clothCost").isEmpty()){
			clothCost = Integer.valueOf(request.getParameter("clothCost"));	
		}
		Integer clothSize = 0;
		if (!request.getParameter("clothSize").isEmpty()){
			clothSize = Integer.valueOf(request.getParameter("clothSize"));	
		}
		String clothColor = request.getParameter("clothColor");
		
		Cloth cloth = new Cloth();
		cloth.setClothId(clothId);
		cloth.setClothName(clothName);
		cloth.setClothCost(clothCost);
		cloth.setClothSize(clothSize);
		cloth.setClothColor(clothColor);
		
		ClothRepository cr = new ClothRepository().getinstance();
		cr.addCloth(cloth);
		
		response.sendRedirect("clothmain.jsp");
		
	%>
</body>
</html>