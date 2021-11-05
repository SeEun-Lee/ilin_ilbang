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
			String dbURL = "jdbc:log4jdbc:mysql://127.0.0.1:3306/oneroom?serverTimezone=Asia/Seoul";
			String dbID = "root";
			String dbPassword = "1111";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String mid, String mpw) {
		String SQL = "SELECT mpw FROM USER WHERE mid = ?";
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
}
