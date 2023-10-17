package servlet;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membership.MemberDAO;
import membership.MemberDTO;

public class MemberAuth extends HttpServlet {
	
	MemberDAO dao;

	// 시작시 실행
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		String drv = application.getInitParameter("OracleDriver");
		String url = application.getInitParameter("OracleURL");
		String id = application.getInitParameter("OracleId");
		String pw = application.getInitParameter("OraclePwd");
		dao = new MemberDAO(drv, url, id, pw);
		dao = new MemberDAO();
	}

	// 종료시 실행
	@Override
	public void destroy() {
		dao.close();
	}

	//doget + dopost
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String admin_id = this.getInitParameter("admin_id");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDTO dto = dao.getMemberDTO(id, pw);
		
		String memberName = dto.getName();
		
		if(memberName != null) {
			request.setAttribute("authMessage", memberName+"님 환영합니다.");
		} else {
			if(admin_id.equals(id)) {
				request.setAttribute("authMessage", admin_id+"은 최고의 관리자입니다.");
			} else {
				request.setAttribute("authMessage", "귀하는 회원이 아닙니다.");
			}
		}
		
		request.getRequestDispatcher("/13Servlet/MemberAuth.jsp").forward(request, response);
		
		
	}

}
