package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import common.JDBConnect;
import dto.TestDTO;

public class TestDAO extends JDBConnect {

	public TestDAO() {
		super();
	}
	
	public ArrayList<TestDTO> selectAll(int start, int end){
		ArrayList<TestDTO> listTest = new ArrayList<>();
		
		String sql = "SELECT * from test where (국어+수학+영어)/3 >= "+start+" and (국어+수학+영어)/3 < "+end+" order by 학번";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				TestDTO dto = new TestDTO();
				dto.setCode(rs.getString(1));
				dto.setKor(rs.getInt(2));
				dto.setMath(rs.getInt(3));
				dto.setEng(rs.getInt(4));
				listTest.add(dto);
			}
			
			System.out.println("selectAll() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("selectAll() 오류");
		}
		
		return listTest;
	}
	
}
