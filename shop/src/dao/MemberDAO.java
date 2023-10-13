package dao;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.jsp.JspWriter;

import common.JSFunction;
import common.SQLConnect;
import dto.MemberDTO;

public class MemberDAO extends SQLConnect {
	
	public MemberDTO getDTO(String id, String pw) {
		MemberDTO dto = new MemberDTO();
		String sql = "select * from member where id=? and pw=?";
		try{
			psmt = co.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			rs = psmt.executeQuery();
			if (rs.next()){
				dto.setId(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setPw(rs.getString(3));
				dto.setPhone(rs.getString(4));
				dto.setAddress(rs.getString(5));
				dto.setPhotoImage(rs.getString(6));
			}
		} catch(Exception e){
			System.out.println("getDTO 오류");
		}
		return dto;
	}
	
	public boolean hasId(String id) {
		boolean result = false;
		String sql = "select * from member where id=?";
		try{
			psmt = co.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if (rs.next()){
				result = true;
			}
		} catch(Exception e){
			System.out.println("haveDTO 오류");
		}
		return result;
	}
	
	public void addDTO(String id, String name, String pw, String phone, String address, String photoImage, JspWriter out) {
		if (hasId(id)) {
			JSFunction.alertLocation("아이디 중복","addMember.jsp", out);
			return;
		}
 		String sql = "insert into member values(?,?,?,?,?,?)";
		try{
			psmt = co.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, name);
			psmt.setString(3, pw);
			psmt.setString(4, phone);
			psmt.setString(5, address);
			psmt.setString(6, photoImage);
			psmt.executeUpdate();
			JSFunction.alertLocation("회원 가입 성공","loginprocess.jsp?id="+id+"&pw="+pw, out);
		} catch(Exception e){
			System.out.print("addDTO오류");
			e.printStackTrace();
		} 
		
	}
	public void deleteDTO(String id, String pw, JspWriter out) {
		MemberDTO dto = getDTO(id, pw);
		if (dto.getId() == null){
			JSFunction.alertLocation("비밀번호가 맞지 않습니다.","deleteMember.jsp", out);
			return;
		}
		String sql = "delete from member where id=?";
		try{
			psmt = co.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.executeUpdate();
			JSFunction.alertLocation("회원 탈퇴 성공","logout.jsp", out);
		} catch(Exception e){
			System.out.print("deleteDTO오류");
			e.printStackTrace();
		} 
	}
	public void updateDTO(String id, Map<String, String> data, JspWriter out) {
		String sql = "";
		int count = 0;
		
		Set<String> set = data.keySet();
		Iterator<String> it = set.iterator();
		while (it.hasNext()) {
			String key = it.next();
			String value = data.get(key);
			if (value == "") {
				continue;
			}
			count++;
			sql = "update member set "+key+"=? where id=?";
			try{
				psmt = co.prepareStatement(sql);
				psmt.setString(1, value);
				psmt.setString(2, id);
				psmt.executeUpdate();
			} catch(Exception e){
				System.out.print("updateDTO오류");
			} 
		}
		
		if (count != 0) {
			JSFunction.alertLocation("수정 완료","editMember.jsp", out);
		} else {
			JSFunction.alertLocation("입력값이 없습니다.","editMember.jsp", out);
		}
	}
}