package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MysqlDB {
	
	public Connection co;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public MysqlDB() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/mvctest?useUnicode=true&characterEncoding=utf8&useSSL=false";
			String id = "manager";
			String pw = "1234";
			co = DriverManager.getConnection(url,id,pw);
			
			System.out.println("MysqlDB 접속 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("MysqlDB 접속 실패");
		}
		
	}
	
	public void close() {
		try {
			if (rs != null) rs.close();
			if (psmt != null) psmt.close();
			if (stmt != null) stmt.close();
			if (co != null) co.close();
			System.out.println("MysqlDB 접속 해제");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
