package fileupload;

import java.util.List;
import java.util.Vector;

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

	public List<MyfileDTO> myFileList(){
		List<MyfileDTO> fileList = new Vector<>();
		
		String sql = "select * from myfile order by idx desc";
		
		try {
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				MyfileDTO dto = new MyfileDTO();
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setCate(rs.getString(4));
				dto.setOfile(rs.getString(5));
				dto.setSfile(rs.getString(6));
				dto.setPostdate(rs.getString(7));
				fileList.add(dto);
			}
			
			System.out.println("myFileList() 성공");
		} catch (Exception e) {
			System.out.println("myFileList() 오류");
		}
		
		
		return fileList;
	}
	
}
