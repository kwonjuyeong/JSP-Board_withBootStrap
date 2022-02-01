package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BbsDAO {

	private Connection conn;
	private ResultSet rs;
	
	
	public BbsDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3305/BBS?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "!jy101712";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
	}
	
	//���� ��¥�� �������� �Լ�
	public String getDate() {
		
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getString(1);
			}
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		return "";	//�����ͺ��̽� ����		
	}
	
	//�Խñ� ��ȣ(������ ������ ��ȣ+1)
	public int getNext() {
		
		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getInt(1) + 1;
			}
			return 1;//�ʱ� �Խñ� ��ȣ ��ġ �˷��� - ù ��° �Խñ��� ��� 1
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		return -1;	//�����ͺ��̽� ����		
	}
	
	//���� �ۼ��ϴ� �Լ�
	public int write(String bbsTitle, String userID, String bbsContent) {		
		String SQL = "INSERT INTO BBS VALUES(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1); //���� ������ �ȵ� ����
			return pstmt.executeUpdate();
		}catch(Exception e) {		
			e.printStackTrace();
		}
		return -1;	//�����ͺ��̽� ����	
		
		
	}
	
	
	
	
}
