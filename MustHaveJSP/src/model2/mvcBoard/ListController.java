package model2.mvcBoard;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.BoardPage;

public class ListController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		
		Map<String, Object> map = new HashMap<>();
		if (searchWord != null){
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		
		MVCBoardDAO dao = new MVCBoardDAO();
		int totalCount = dao.selectCount(map);
		
		ServletContext application = getServletContext();
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
		int totalPage = (int)Math.ceil((double)totalCount/pageSize);
		
		int pageNum = 1;
		String pageTemp = request.getParameter("pageNum");
		if(pageTemp != null && !pageTemp.equals("")){
			pageNum = Integer.parseInt(pageTemp);
		}
		
		int start = (pageNum-1)*pageSize +1;
		int end = pageNum*pageSize;
		map.put("start", start);
		map.put("end", end);
		
		
		List<MVCBoardDTO> boardList = dao.selectList(map);
		dao.close();
		
		String pagingStr = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "/mvcboard.list.do");
		map.put("pagingStr", pagingStr);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		
		request.setAttribute("boardList", boardList);
		request.setAttribute("map", map);
		request.getRequestDispatcher("/14MVCBoard/List.jsp").forward(request, response);
		
	}

}
