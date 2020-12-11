package database;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connect {
	public static Connection getConnection() {

		Connection conn = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;" + "databaseName=java;", "sa", "sa");
			
//			Class.forName("org.hsqldb.jdbcDriver");
//			conn = DriverManager.getConnection("jdbc:hsqldb:hsql://localhost/examples;" + "databaseName=java;", "sa", "");
		} catch (Exception ex) {
			System.out.println("connect failure!");
			ex.printStackTrace();
		}
		return conn;
	}
}
