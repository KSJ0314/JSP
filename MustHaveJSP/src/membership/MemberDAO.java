package membership;

import java.sql.PreparedStatement;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
	
	public MemberDAO(String drv, String url, String id, String pw) {
		super(drv,url,id,pw);
	}
	
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String sql = "select * from member where id = ? and pass = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto.setId(rs.getString(1));
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
			
		} catch (Exception e) {
			System.out.println("오류");
		}
		return dto;
	}
	
}
