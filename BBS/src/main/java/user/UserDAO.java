package user;

//DAO(Database Access Object)파일데이터베이스 접근 객체
//실질적으로 데이터 베이스에서 정보를 불러오거나 넣을때 사용.

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement; 
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {		
		try {
			
			String dbURL = "jdbc:mysql://localhost:3305/BBS?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "!jy101712";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID, dbPassword);	
		}catch(Exception e) { 
			e.printStackTrace();
		}
		
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {	
				if(rs.getString(1).equals(userPassword))
					return 1;
				else
					return 0;							
			}
			return -1; //아이디 없음
		}catch(Exception e ) {
			e.printStackTrace();	
		}
		return -2;//데이터 베이스 오류
	}
}
