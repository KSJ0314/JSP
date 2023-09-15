package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class MysqlConnect {
	public Connection con;
	public Statement st;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public MysqlConnect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=utf8";
			String id = "manager";
			String pw = "1234";
			con = DriverManager.getConnection(url, id, pw);
		} catch (Exception e) {
		}
	}
	
	public void close() {
		try {
			if (rs != null) rs.close();
			if (psmt != null) psmt.close();
			if (st != null) st.close();
			if (con != null) con.close();
		} catch (Exception e) {
			
		}

	}
}
