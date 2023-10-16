package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Login extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("id", request.getParameter("id"));
		request.setAttribute("pw", request.getParameter("pw"));
		request.getRequestDispatcher("/13Servlet/Login.jsp").forward(request, response);
	}

}
