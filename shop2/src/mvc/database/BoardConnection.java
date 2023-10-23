package mvc.database;

import java.sql.*;

public class BoardConnection {
	
	public Connection co;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public BoardConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/mvcboard?useUnicode=true&characterEncoding=utf8";
			String id = "manager";
			String pw = "1234";
			co = DriverManager.getConnection(url, id, pw);
			
			System.out.println("MVCBoardConnect() 성공");
		} catch (Exception e) {
			System.out.println("MVCBoardConnect() 실패");
		}
	}
	
	public void close() {
		try {
			if (rs!=null) rs.close();
			if (psmt!=null) psmt.close();
			if (stmt!=null) stmt.close();
			if (co!=null) co.close();
			System.out.println("close() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("close() 오류");
		}
	}
	
}
