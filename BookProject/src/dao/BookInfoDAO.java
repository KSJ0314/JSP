package dao;

import java.util.ArrayList;
import java.util.List;

import common.SQLConnect;
import dto.BookInfoDTO;

public class BookInfoDAO extends SQLConnect{

	public BookInfoDAO() {
		super();
	}
	
	public List<BookInfoDTO> getListOfBookInfo(){
		List<BookInfoDTO> listOfBookInfo = new ArrayList<>();
		String sql = "select * from bookinfo";
		try {
			stmt = co.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				BookInfoDTO dto = new BookInfoDTO();
				dto.setBook_id(rs.getString(1));
				dto.setBook_author(rs.getString(2));
				dto.setBook_title(rs.getString(3));
				dto.setBook_content(rs.getString(4));
				dto.setBook_price(rs.getInt(5));
				dto.setBook_date(rs.getDate(6));
				dto.setMember_id(rs.getString(7));
				listOfBookInfo.add(dto);
			}
			
			System.out.println("getListOfBookInfo() 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getListOfBookInfo() 오류");
		}
		return listOfBookInfo;
	}
	
	public int addBook(BookInfoDTO dto) {
		int result = 0;
		
		String sql = "insert into bookinfo values(?,?,?,?,?,?,?)";
		try {
			psmt = co.prepareStatement(sql);
			psmt.setString(1, dto.getBook_id());
			psmt.setString(2, dto.getBook_author());
			psmt.setString(3, dto.getBook_title());
			psmt.setString(4, dto.getBook_content());
			psmt.setInt(5, dto.getBook_price());
			psmt.setDate(6, dto.getBook_date());
			psmt.setString(7, dto.getMember_id());
			
			result = psmt.executeUpdate();
			
			System.out.println("addBook() 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("addBook() 오류");
		}
		
		return result;
	}
	
	public BookInfoDTO selectBook(String id) {
		BookInfoDTO dto = new BookInfoDTO();
		
		String sql = "select * from bookinfo where book_id=?";
		try {
			psmt = co.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setBook_id(rs.getString(1));
				dto.setBook_author(rs.getString(2));
				dto.setBook_title(rs.getString(3));
				dto.setBook_content(rs.getString(4));
				dto.setBook_price(rs.getInt(5));
				dto.setBook_date(rs.getDate(6));
				dto.setMember_id(rs.getString(7));
			}
			
			System.out.println("selectBook() 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectBook() 오류");
		}
		
		return dto;
	}
}
