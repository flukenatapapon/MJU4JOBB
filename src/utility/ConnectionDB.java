package utility;
import java.sql.*;
public class ConnectionDB {
	Connection conn;
	String url = "jdbc:mysql://localhost:3306/mju4jobb?characterEncoding=UTF-8";
	String uname = "root";
	String pwd = "Fluke123";
	
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url,uname,pwd);
			} catch (ClassNotFoundException e) {
			e.printStackTrace();
			} catch (SQLException e) {
			e.printStackTrace();
			} 
		return conn;
	}
}
