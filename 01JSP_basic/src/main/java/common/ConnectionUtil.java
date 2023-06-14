package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class ConnectionUtil {

	public ConnectionUtil() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * DB Connection을 반환합니다.
	 * @return
	 */
	public static Connection getConnection() {
		Connection conn = null;		
		// 접속 정보
		//			  오라클 프로토콜	   @ip:port:sid
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "jsp";
		String pw = "1234";		
		try {
			// 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");			
			// 커넥션 생성
			conn = DriverManager.getConnection(url, id, pw);			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.err.println("라이브러리 로드 중 오류가 발생하였습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	/**
	 * web.xml 파일의 컨텍스트 초기화 매개 변수를 읽어서
	 * DB 접속 정보를 설정합니다.
	 * @param application
	 * @return
	 */
	public static Connection getConnection(ServletContext application) {
		Connection conn = null;
		String driver = application.getInitParameter("OracleDriver");
		String url = application.getInitParameter("OracleUrl");
		String id = application.getInitParameter("OracleId");
		String pw = application.getInitParameter("OraclePw");
		try {
			// 드라이버 로딩
			Class.forName(driver);			
			// 커넥션 생성
			conn = DriverManager.getConnection(url, id, pw);			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.err.println("라이브러리 로드 중 오류가 발생하였습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void close(Connection conn) {
		try {
			if(conn!=null && !conn.isClosed()) conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void close(Connection conn, Statement stmt) {
		try {
			if(conn!=null && !conn.isClosed()) stmt.close();
			if(conn!=null && !conn.isClosed()) conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if(conn!=null && !conn.isClosed()) rs.close();
			if(conn!=null && !conn.isClosed()) stmt.close();
			if(conn!=null && !conn.isClosed()) conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
