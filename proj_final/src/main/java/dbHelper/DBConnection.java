package dbHelper;

import java.sql.Connection;
import java.sql.DriverManager;
/*
 * DBConnection class - To Load the JDBC drivers and connect to Database instance
 */
public class DBConnection {
	private static Connection conn;
	
	public static Connection getConnection() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		if (conn == null || conn.isClosed()) {
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/java_proj_db", "root", "root@12345");
		}
		return conn;
	}

}
