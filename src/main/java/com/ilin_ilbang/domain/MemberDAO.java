package com.ilin_ilbang.domain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MemberDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/oneroom?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
			String dbID = "root";
			String dbPassword = "1111";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public String toString() {
		return "MemberDAO [conn=" + conn + ", pstmt=" + pstmt + ", rs=" + rs + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

	public int login(String mid, String mpw) {
		String SQL = "SELECT mpw FROM member_info WHERE mid = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getString(1).equals(mpw)) {
					return 1; // 로그인 성공
				}
				else
					return 0; // 비밀번호 불일치
			}
			return -1; // 아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}
	
	public int join(MemberVO member) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt = setString(1, member.getMid());
			pstmt = setString(2, member.getMpw());
			pstmt = setString(3, member.getMname());
			pstmt = setString(4, member.getMbirth());
			pstmt = setString(5, member.getMgender());
			pstmt = setString(6, member.getMaddr());
			pstmt = setString(7, member.getMtel());
			pstmt = setString(8, member.getMemail());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) {conn.close();}
			} catch (Exception e) {e.printStackTrace();}
			try {
				if(rs != null)   {rs.close();}
			} catch (Exception e) {e.printStackTrace();}
			try {
				if(pstmt != null){pstmt.close();}
			}catch (Exception e) {e.printStackTrace();}
		}
		return -1; // 데이터베이스 오류
	}

	private PreparedStatement setString(int i, String mid) {
		return pstmt;
		
	}
}
