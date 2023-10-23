package mvc.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import mvc.database.BoardConnection;

public class BoardDAO extends BoardConnection {
	
	public BoardDAO() {
		super();
	}
	
	// 게시물 개수 반환
	public int getListCount(String items, String text) {
		int count = 0;
		
		String sql = "select count(*) from board";
		if (text != null) {
			sql += " where "+items+" like '%"+text+"%'";
		}
		
		try {
			psmt = co.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				count = rs.getInt(1);
			}
			
			System.out.println("getListCount() 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getListCount() 오류");
		}
		
		return count;
	}
	
	// board 테이블에 데이터 가져오기
	public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text, int total_row){
		ArrayList<BoardDTO> list = new ArrayList<>();
		int start = (page-1) * limit + 1;
		
		String sql = "select * from board";
		if (text != null) {
			sql += " where "+items+" like '%"+text+"%'";
		}
		sql += " order by num desc";
		
		try {
			psmt = co.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.absolute(start);
			
			for (int i = 0; i < limit; i++) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setTitle(rs.getString(4));
				dto.setContent(rs.getString(5));
				String date = new SimpleDateFormat("yyyy-MM-dd").format(rs.getDate(6));
				dto.setRegist_day(date);
				dto.setHit(rs.getInt(7));
				dto.setIp(rs.getString(8));
				list.add(dto);
				if(rs.getRow() == total_row) {
					break;
				}
				rs.next();
			}
			
			System.out.println("getBoardList() 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getBoardList() 오류");
		}
		
		return list;
	}
	
}
