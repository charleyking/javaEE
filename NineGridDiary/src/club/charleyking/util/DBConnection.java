package club.charleyking.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class DBConnection {
	public Connection conn = null;
	public Statement stmt = null;
	public ResultSet rs = null;
	private static String propFileName = "DBConnection.properties";
	private static Properties prop = new Properties();
	private static String dbClassName = "com.mysql.jdbc.Driver";
	private static String dbUrl = "jdbc:mysql://127.0.0.1/NineGridDiary";
	private static String dbUser = "root";
	private static String dbPassword = "charleyking";
	
	public DBConnection() {
		InputStream ins = getClass().getResourceAsStream(propFileName);
		try {
			prop.load(ins);
			dbClassName = prop.getProperty("DB_CLASS_NAME");
			dbUrl = prop.getProperty("DB_CLASS", dbUrl);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName(dbClassName);
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPassword);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (conn == null) {
			System.out.println("get connection fail");
		}
		return conn;
	}
	
	public ResultSet executeQuery(String sql) {
		try {
			conn = getConnection();
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("in dbconnection, catch exception in excutequery");
		}
		return rs;
	}
	
	public int excuteUpdate(String sql) {
		int result = 0;
		try {
			conn = getConnection();
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			result = 0;
		}
		return result;
	}
	
	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace(System.err);
		}
	}
}
