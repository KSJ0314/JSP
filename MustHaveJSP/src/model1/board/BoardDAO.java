package model1.board;

import java.sql.SQLException;
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
	
	// 게시물 상세보기
	public BoardDTO selectView(String num) {
		updateVisitCount(num);
		BoardDTO dto = new BoardDTO();
		
		String sql = "select B.*, M.name from member M inner join board B on M.id = B.id where num=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			
			rs.next();
			dto.setNum(rs.getString("num"));
			dto.setTitle(rs.getString("title"));
			dto.setContent(rs.getString("content"));
			dto.setId(rs.getString("id"));
			dto.setPostdate(rs.getDate("postdate"));
			dto.setVisitcount(rs.getString("visitcount"));
			dto.setName(rs.getString("name"));
			
			System.out.println("selectView() 성공");
		} catch (Exception e) {
			System.out.println("selectView() 오류");
		}
		
		return dto;
	}
	
	// 게시물의 조회수 증가 메소드
	public void updateVisitCount(String num) {
		String sql = "update board set visitcount = visitcount+1 where num=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, num);
			psmt.executeQuery();	//executeUpdate : 전체 행 개수의 변화값을 리턴
			
			System.out.println("updateVisitCount() 성공");
		} catch (Exception e) {
			System.out.println("updateVisitCount() 오류");
		}
	}
	
	// 게시물 수정
	public int updateEdit(BoardDTO dto) {
		int result = 0;
		String sql = "update board set title=?, content=? where num=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			result = psmt.executeUpdate();
			
			System.out.println("updateEdit() 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateEdit() 오류");
		}
		return result;
	}
	
	public int deletePost(String num) {
		int result = 0;
		
		String sql = "delete from board where num="+num;
		try {
			stmt = con.createStatement();
			result = stmt.executeUpdate(sql);
			
			System.out.println("deletePost()성공");
		} catch (Exception e) {
			System.out.println("deletePost()오류");
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
}
