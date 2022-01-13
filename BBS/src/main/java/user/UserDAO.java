package user;

//DAO(Data Access Object) : 데이터베이스에 있는 데이터에 접근하기 위해 생성하는 객체 클래스
//CRUD(생성, 읽기, 갱신, 삭제)작업을 시행하는 클래스이다.
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
			conn=DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) 
					return 1; //로그인 성공
				else 
					return 0; //비밀번호 불일치
			}
			
			return -1; //아이디가 없음
		}catch(Exception e) {
			e.printStackTrace();
		}
	return -2; //데이터베이스 오류	
	}
	
	public int join(User user) {
		
		String SQL = "INSERT INTO USER VALUES(?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {if(conn != null) {conn.close();}} catch (Exception ex) {ex.printStackTrace();}
			try {if(rs != null)   {rs.close();}}   catch (Exception ex) {ex.printStackTrace();}
			try {if(pstmt != null){pstmt.close();}}catch (Exception ex) {ex.printStackTrace();}
}
		return -1; //데이터베이스 오류
	}
	
	
	
}
