package jspbook.ch07;


import java.sql.*;
import java.util.*;

public class AddrDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	
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
	public void add( AddrVO ab ) {
		connect();
		String sql = "insert into address values (?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ab.getUsername());
			pstmt.setString(2, ab.getTel() );
			pstmt.setString(3, ab.getEmail());
			pstmt.setString(4, ab.getSex());
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
//			return false;
		} finally {
			disconnect();
		}
//		return true;
	}
	
	public ArrayList<AddrVO> getAddrList() {
		connect();
		ArrayList<AddrVO> addrlist = new ArrayList<AddrVO>();
		String sql = "select * from address ";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				AddrVO ab = new AddrVO();
				ab.setUsername(rs.getString("username"));
				ab.setTel(rs.getString("tel"));
				ab.setEmail(rs.getString("email"));
				ab.setSex(rs.getString("sex"));
				addrlist.add(ab);
			}
			rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return addrlist;
	}
}
