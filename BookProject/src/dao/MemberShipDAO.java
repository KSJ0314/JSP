package dao;

import common.SQLConnect;
import dto.MemberShipDTO;
 
public class MemberShipDAO extends SQLConnect {

	public MemberShipDAO() {
		super();
	}
	
	public MemberShipDTO selectMember(String id) {
		MemberShipDTO dto = new MemberShipDTO();
		
		String sql = "select * from membership where member_id=?";
		try {
			psmt = co.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setMember_id(rs.getString(1));
				dto.setMember_pw(rs.getString(2));
				dto.setMember_name(rs.getString(3));
				dto.setMember_addr(rs.getString(4));
				dto.setMember_tel(rs.getString(5));
			}
			
			System.out.println("selectMember() 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectMember() 오류");
		}
		
		return dto;
	}
	
	public int addMember(MemberShipDTO dto) {
		int result = 0;
		
		String sql = "insert into membership values(?,?,?,?,?)";
		
		try {
			psmt = co.prepareStatement(sql);
			psmt.setString(1, dto.getMember_id());
			psmt.setString(2, dto.getMember_pw());
			psmt.setString(3, dto.getMember_name());
			psmt.setString(4, dto.getMember_addr());
			psmt.setString(5, dto.getMember_tel());
			
			result = psmt.executeUpdate();
			
			System.out.println("addMember() 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("addMember() 오류");
		}
		
		return result;
	}
	
	public int deleteMember(String id) {
		int result = 0;
		
		String sql = "delete from membership where member_id=?";
		
		try {
			psmt = co.prepareStatement(sql);
			psmt.setString(1, id);
			
			result = psmt.executeUpdate();
			
			System.out.println("deleteMember() 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteMember() 오류");
		}
		
		return result;
	}
	
}
