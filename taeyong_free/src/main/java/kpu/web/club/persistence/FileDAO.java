package kpu.web.club.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FileDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	
	String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/jspdb?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC";
	
	void connect() {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "jspbook","rlaxodyd628@");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public int upload(String userID, String fileName, String fileRealName,String postText) {
		connect();
		String SQL = "select proFileImg from file where userID= ?";
		String proFileImg = "0.jpg";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				proFileImg = rs.getString("proFileImg");
			}
			SQL = "INSERT INTO FILE VALUES (?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "0");			
			pstmt.setString(2, userID);
			pstmt.setString(3, fileName);
			pstmt.setString(4, fileRealName);
			pstmt.setString(5, postText);
			pstmt.setString(6, proFileImg);
			return pstmt.executeUpdate(); // 성공시 1이라는 return 값이다.
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		
		return -1;
	}
	public int profileUpload(String userID,String FileName) {
		connect();
		try {
			String sql = "UPDATE file SET proFileImg = ? where userID=?";
			PreparedStatement pstmt  = conn.prepareStatement(sql);
			pstmt.setString(1,FileName);
			pstmt.setString(2, userID);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return -1;
	}
	
//	public boolean post(String userID, String fileName,String postText) {
//		connect();
//		String SQL = "update file set postText= ? where userID = ? and fileName= ?";
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(SQL);
//			pstmt.setString(1, postText);
//			pstmt.setString(2, userID);
//			pstmt.setString(3, fileName);
//			pstmt.executeUpdate();
//			return true; // 성공시 1이라는 return 값이다.
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		finally {
//			disconnect();
//		}
//		
//		return false;
//	}
}
