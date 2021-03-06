package kpu.web.club.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import kpu.web.club.domain.UserVO;

public class UserDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs;
	
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
	
	public boolean add(UserVO vo) {
		connect();
		String sql = "insert into sns_user values (?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getId());
			pstmt.setString(2,vo.getPasswd());
			pstmt.setString(3,vo.getUsername());
			pstmt.setString(4,vo.getMobile());
			pstmt.setString(5, "0.jpg");
			pstmt.setString(6, " ");
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			disconnect();
		}
		return true;
	}
	
	public int login(String userID, String passwd) {
		try {
			connect();
			String sql = "SELECT passwd FROM sns_user where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("passwd").equals(passwd)) {
					return 1; // 비밀번호 일치시
				}else { 
					return 0; // 비밀번호 불일치
				}
				
			}
			return -1; // 아이디 없음
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return -2; // 데이터베이스 오류
	}
	
	public int porfileUpload(String userID, String FileName, String RealFileName, String text) {
		try {
			connect();
			if(FileName == null) {
				String sql = "UPDATE sns_user SET text= ? where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, text);
				pstmt.setString(2, userID);
				pstmt.executeUpdate();
			}else if(text == null) {
				String sql = "UPDATE sns_user SET proFileImg = ? where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, FileName);
				pstmt.setString(2, userID);
				pstmt.executeUpdate();
				sql = "UPDATE fie SET proFileImg = ? where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, FileName);
				pstmt.setString(2, userID);
				pstmt.executeUpdate();
			}else {
				String sql = "UPDATE sns_user SET proFileImg = ?, text= ? where id=?";
				pstmt = conn.prepareStatement(sql);
				new FileDAO().profileUpload(userID,FileName);
				pstmt.setString(1, FileName);
				pstmt.setString(2, text);
				pstmt.setString(3, userID);
				pstmt.executeUpdate();
			}
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return -1;
	}
	
	public int delete(String userID) {
		try {
			connect();
			String SQL = "delete from file where userID = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return -1;
	}

}
