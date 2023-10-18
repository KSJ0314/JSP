package model2.mvcBoard;

import java.util.*;

import common.JDBConnect;

public class MVCBoardDAO extends JDBConnect {
	
	public MVCBoardDAO() {
		super();
	}
	
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		
		String query = "select count(*) from mvcBoard";
		
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
	
	public List<MVCBoardDTO> selectList(Map<String, Object> map){
		List<MVCBoardDTO> bbs = new Vector<>();
		
		String query = "select * from (select mvcBoard.*, rownum rNum from mvcBoard ";
		
		if(map.get("searchWord") != null) {	// 검색하는 단어가 있다면
			query += " where " + map.get("searchField") + " "
					+ "like '%" + map.get("searchWord") + "%'";
		}
		query += " order by idx desc) where rNum between ? and ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				MVCBoardDTO dto = new MVCBoardDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setDowncount(rs.getInt("downcount"));
				dto.setPw(rs.getString("pw"));
				dto.setVisitcount(rs.getInt("visitcount"));
				bbs.add(dto);
			}
			
			System.out.println("selectList() 성공");
		} catch (Exception e) {
			System.out.println("selectList() 오류");
			e.printStackTrace();
		}
		return bbs;
	}
	
	public int insertWrite(MVCBoardDTO dto) {
		int result = 0;
		String sql = "insert into mvcBoard (idx, name, title, content, ofile, sfile, pw) values (seq_board_num.NEXTVAL,?,?,?,?,?,?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getPw());
			result = psmt.executeUpdate();
			
			System.out.println("insertWrite() 성공");
		} catch (Exception e) {
			System.out.println("insertWrite() 오류");
			e.printStackTrace();
		}
		return result;
	}
	
	// 게시물 상세보기
	public MVCBoardDTO selectView(String idx) {
		updateVisitCount(idx);
		MVCBoardDTO dto = new MVCBoardDTO();
		
		String sql = "select * from mvcBoard where idx=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			
			rs.next();
			dto.setIdx(rs.getString("idx"));
			dto.setName(rs.getString("name"));
			dto.setTitle(rs.getString("title"));
			dto.setContent(rs.getString("content"));
			dto.setPostdate(rs.getDate("postdate"));
			dto.setOfile(rs.getString("ofile"));
			dto.setSfile(rs.getString("sfile"));
			dto.setDowncount(rs.getInt("downcount"));
			dto.setPw(rs.getString("pw"));
			dto.setVisitcount(rs.getInt("visitcount"));
			
			System.out.println("selectView() 성공");
		} catch (Exception e) {
			System.out.println("selectView() 오류");
		}
		
		return dto;
	}
	
	// 게시물의 조회수 증가 메소드
	public void updateVisitCount(String idx) {
		String sql = "update mvcBoard set visitcount = visitcount+1 where idx=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			psmt.executeQuery();	//executeUpdate : 전체 행 개수의 변화값을 리턴
			
			System.out.println("updateVisitCount() 성공");
		} catch (Exception e) {
			System.out.println("updateVisitCount() 오류");
		}
	}
	
	// 첨부파일 조회수 증가
	public void downCountPlus(String idx) {
		String sql = "update mvcBoard set downcount = downcount+1 where idx=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			psmt.executeQuery();
			
			System.out.println("downCountPlus() 성공");
		} catch (Exception e) {
			System.out.println("downCountPlus() 오류");
		}
	}
	
	// 게시물 수정
	public int updateEdit(MVCBoardDTO dto) {
		int result = 0;
		String sql = "update mvcBoard set title=?, content=? where idx=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getIdx());
			result = psmt.executeUpdate();
			
			System.out.println("updateEdit() 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateEdit() 오류");
		}
		return result;
	}
	
	public int deletePost(String idx) {
		int result = 0;
		
		String sql = "delete from mvcBoard where idx="+idx;
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
