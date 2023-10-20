package dao;

import java.text.SimpleDateFormat;

import dto.MemberShipDTO;
import util.MysqlDB;

public class MemberShipDAO extends MysqlDB {
	
	public String Login(String id, String pw) {
		String name = "";
		
		String sql = "select name from membership where id=? and pw=?";
		
		try {
			psmt = co.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			rs = psmt.executeQuery();
			if (rs.next()) {
				name = rs.getString(1);
			}
			System.out.println("checkLogin() 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("checkLogin() 오류");
		}
		
		return name;
	}
	
	public MemberShipDTO getDTO(String id) {
		MemberShipDTO dto = new MemberShipDTO();
		
		String sql = "select * from membership where id='"+id+"'";
		
		try {
			stmt = co.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			
			dto.setId(rs.getString(1));
			dto.setPw(rs.getString(2));
			dto.setName(rs.getString(3));
			dto.setSex(rs.getString(4));
			dto.setBirth(rs.getDate(5));
			dto.setEmail(rs.getString(6));
			dto.setTell(rs.getString(7));
			dto.setAddr(rs.getString(8));
			dto.setAddDay(rs.getDate(9));
			
			System.out.println("getDTO() 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getDTO() 오류");
		}
		
		return dto;
	}

	public void insertDTO(MemberShipDTO dto) {
		String birth = new SimpleDateFormat("yyyy-MM-dd").format(dto.getBirth());
		
		String sql = "insert into membership values(?,?,?,?,?,?,?,?,default)";
		try {
			psmt = co.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getSex());
			psmt.setString(5, birth);
			psmt.setString(6, dto.getEmail());
			psmt.setString(7, dto.getTell());
			psmt.setString(8, dto.getAddr());
			
			psmt.executeUpdate();
			
			System.out.println("insertDTO() 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertDTO() 오류");
		}
	}
	
	public void updateDTO(MemberShipDTO dto, String id) {
		String birth = new SimpleDateFormat("yyyy-MM-dd").format(dto.getBirth());
		
		String sql = "update membership set id=?, pw=?, name=?, sex=?, birth=?, email=?, tell=?, addr=? where id=?";
		try {
			psmt = co.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getSex());
			psmt.setString(5, birth);
			psmt.setString(6, dto.getEmail());
			psmt.setString(7, dto.getTell());
			psmt.setString(8, dto.getAddr());
			psmt.setString(9, id);
			
			psmt.executeUpdate();
			
			System.out.println("insertDTO() 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertDTO() 오류");
		}
	}
	
	public int deleteDTO(String id, String pw) {
		int result = 0;
		
		String sql = "delete from membership where id=? and pw=?";
		
		try {
			psmt = co.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			
			result = psmt.executeUpdate();
			
			System.out.println("deleteDTO() 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteDTO() 오류");
		}
		
		return result;
	}
	
}
