package mvc.controller;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JSFunction;

public class ProductController extends HttpServlet {

	@Override
	public void init(ServletConfig config) throws ServletException {
		
	}

	@Override
	public void destroy() {
		
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();	// 절대 경로 (현재 파일 이름 포함)
		String Path = request.getContextPath();	// 절대 경로 (현재 파일 이름 미포함)
		String command = uri.substring(Path.length()+1);	// 슬래시 제외 현재 파일 이름
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		if(command.equals("order.product")){	// 상품주문
			System.out.println("order.product");
			JSFunction.alertLocation(response, "주문 완료되었습니다.", Path+"/product.jsp");
		}
	}

}
