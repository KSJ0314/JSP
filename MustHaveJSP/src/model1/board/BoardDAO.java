package model1.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect {
	
	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		
		String query = "select count(*) from board";
		
		if(map.get("searchWord") != null) {	// 검색하는 단어가 있다면
			System.out.println("searchWord != null");
			query += " where " + map.get("searchField") + " "
					+ "like '%" + map.get("searchWord") + "%'";	// serachField : 검색 분류
		}
			
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
			System.out.println("selectCount() 성공");
		} catch (Exception e) {
			System.out.println("selectCount() 오류");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public List<BoardDTO> selectList(Map<String, Object> map){
		List<BoardDTO> bbs = new Vector<>();
		
		String query = "select * from board";
		
		if(map.get("searchWord") != null) {	// 검색하는 단어가 있다면
			query += " where " + map.get("searchField") + " "
					+ "like '%" + map.get("searchWord") + "%'";
		}
		query += " order by num desc";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
				bbs.add(dto);
			}
			
			System.out.println("selectList() 성공");
		} catch (Exception e) {
			System.out.println("selectList() 오류");
			e.printStackTrace();
		}
		return bbs;
	}
	
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		String sql = "insert into board (num, title, content, id, visitcount) values (seq_board_num.NEXTVAL,?,?,?,0)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			result = psmt.executeUpdate();
			
			System.out.println("insertWrite() 성공");
		} catch (Exception e) {
			System.out.println("insertWrite() 오류");
			e.printStackTrace();
		}
		return result;
	}
	
}
