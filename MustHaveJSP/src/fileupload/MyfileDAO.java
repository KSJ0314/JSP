package fileupload;

import common.JDBConnect;

public class MyfileDAO extends JDBConnect {

	public MyfileDAO() {
		super();
	}
	
	public int insertFile(MyfileDTO dto) {
		int result = 0;
		
		String sql = "insert into myfile values(seq_board_num.nextval,?,?,?,?,?, default)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getCate());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			
			result = psmt.executeUpdate();
			
			System.out.println("insertFile() 성공");
		} catch (Exception e) {
			System.out.println("insertFile() 오류");
		}
		
		return result;
	}

}
