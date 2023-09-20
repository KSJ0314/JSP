package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBConnect {
	
	public Connection co;
	public PreparedStatement psmt;
	public Statement stmt;
	public ResultSet rs;
	
	public JDBConnect() {
		
		String url = "jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=utf8";
		String id = "manager";
		String pw = "1234";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			co = DriverManager.getConnection(url, id, pw);
			System.out.println("DB 연결 성공");
		} catch (Exception e) {
			System.out.println("DB 연결 실패");
		}
		
	}
	
	public void close() {
		try {
			if (rs != null) rs.close();
			if (psmt != null) psmt.close();
			if (co != null) co.close();
			System.out.println("DB 연결 해제");
		} catch (Exception e) {
		}
	}
	
}
