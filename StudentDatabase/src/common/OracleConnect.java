package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OracleConnect {
	public Connection con;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public OracleConnect() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "manager";
			String pwd = "1234";
			con = DriverManager.getConnection(url, id, pwd);
			
			System.out.println("DB 연결 성공");
		} catch (Exception e) {
			System.out.println("DB 연결 실패");
		}
	}
	
	public void close() {
		try {
			if( rs != null) rs.close();
			if( psmt != null) psmt.close();
			if( con != null) con.close();
			System.out.println("연결 해제 성공");
		} catch (Exception e) {
			System.out.println("연결 해제 실패");
		}
	}
	
}
