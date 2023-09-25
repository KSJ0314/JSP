package dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.SimpleFormatter;

import common.SQLConnect;
import dto.BoardDTO;

public class BoardDAO extends SQLConnect {
	
	public BoardDAO() {
		super();
	}
	
	// 게시물 개수 반환
	public int selectCount() {
		int count = 0;
		
		String sql = "select count(*) from board";
		try {
			stmt = co.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			count = rs.getInt(1);
			System.out.println("selectCount() 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectCount() 오류");
		}
		
		return count;
	}
	
	public List<BoardDTO> selectBoard() {
		List<BoardDTO> listOfBoardDTO = new ArrayList<>();
		
		String sql = "select * from board order by num desc";
		
		try {
			stmt = co.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setId(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setVisitcount(rs.getInt(6));
				listOfBoardDTO.add(dto);
			}
			System.out.println("selectBoard() 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectBoard() 오류");
		}
		
		return listOfBoardDTO;
	}
	
	public int insertBoard(BoardDTO dto) {
		int result = 0;
		String now =  new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		
		String sql = "insert into board (title, content, id) values (?,?,?)";
		
		try {
			psmt = co.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			result = psmt.executeUpdate();
			
			System.out.println("insertBoard() 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertBoard() 오류");
		}
		
		return result;
	}
	
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		updateVisitCount(num);
		
		String sql = "select B.*, M.name from board B inner join member M on B.id=M.id where num="+num;
		try {
			stmt = co.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setId(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setVisitcount(rs.getInt(6));
				dto.setName(rs.getString(7));
			}
			
			System.out.println("selectView() 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectView() 오류");
		}
		
		return dto;
	}
	
	public void updateVisitCount(String num) {
		String sql = "update board set visitcount = visitcount+1 where num="+num;
		try {
			stmt = co.createStatement();
			stmt.executeUpdate(sql);
			
			System.out.println("updateVisitCount() 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateVisitCount() 오류");
		}
	}
	
	public void updateBoard(BoardDTO dto) {
		String sql = "update board set title=?, content=? where num=?";
		try {
			psmt = co.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			psmt.executeUpdate();
			
			System.out.println("updateBoard() 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateBoard() 오류");
		}
	}
	
	public void deleteBoard(String num) {
		String sql = "delete from board where num="+num;
		try {
			stmt = co.createStatement();
			stmt.executeUpdate(sql);
			
			System.out.println("deleteBoard() 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteBoard() 오류");
		}
	}
	
}
