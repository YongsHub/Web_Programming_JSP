package kpu.web.club.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kpu.web.club.domain.StudentVO;

public class StudentDAO {
	
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
	public ArrayList<StudentVO> getStudentList(){
		connect();
		ArrayList<StudentVO>studentlist = new ArrayList<StudentVO>();
		String sql = "select * from student";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				StudentVO student = new StudentVO();
				student.setId(rs.getString("id"));
				student.setPasswd(rs.getString("passwd"));
				student.setUsername(rs.getString("username"));
				student.setSnum(rs.getString("snum"));
				student.setDepart(rs.getString("depart"));
				student.setMobile(rs.getString("mobile"));
				student.setEmail(rs.getString("email"));
				studentlist.add(student);
			}
			rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return studentlist;
	}
	
	public boolean add(StudentVO vo) {
		connect();
		String sql = "insert into student values (?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getId());
			pstmt.setString(2,vo.getPasswd());
			pstmt.setString(3,vo.getUsername());
			pstmt.setString(4,vo.getSnum());
			pstmt.setString(5,vo.getDepart());
			pstmt.setString(6,vo.getMobile());
			pstmt.setString(7,vo.getEmail());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			disconnect();
		}
		return true;
	}
	
	public boolean update(StudentVO studentVO) {
		connect();
		String sql = "update student set passwd=?, username=?, snum=?,depart=?,mobile=?,email=? where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, studentVO.getPasswd());
			pstmt.setString(2, studentVO.getUsername());
			pstmt.setString(3, studentVO.getSnum());
			pstmt.setString(4, studentVO.getDepart());
			pstmt.setString(5, studentVO.getMobile());
			pstmt.setString(6, studentVO.getEmail());
			pstmt.setString(7, studentVO.getId());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			disconnect();
		}
		return true;
	}
	
	public StudentVO read(String id) {
		connect();
		String sql = "select * from student";
		StudentVO student = new StudentVO();
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				if(rs.getString("id").equals(id)) {
					student.setId(rs.getString("id"));
					student.setPasswd(rs.getString("passwd"));
					student.setUsername(rs.getString("username"));
					student.setSnum(rs.getString("snum"));
					student.setDepart(rs.getString("depart"));
					student.setMobile(rs.getString("mobile"));
					student.setEmail(rs.getString("email"));
				}
			}
			rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			disconnect();
		}
		return student;
		
	}
	
}

