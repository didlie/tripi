import java.sql.*;

public class JDBCDriver {

	private static Connection conn = null;
	private static ResultSet rs = null;
	private static PreparedStatement ps = null;
//	private static Statement st = null;
	
	public static void connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/Tripi?user=root&password=qu971216&useSSL=false");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close() {
		try{
			if (rs!=null){
				rs.close();
				rs = null;
			}
			if(conn != null){
				conn.close();
				conn = null;
			}
			if(ps != null ){
				ps = null;
			}
		}catch(SQLException sqle){
			System.out.println("connection close error");
			sqle.printStackTrace();
		}
	}
	
	public static boolean validate(String email, String pwd) {
		connect();
		try {
			ps = conn.prepareStatement("select User_password from Users where User_email=?;"); //"password" depends on the final name in database
			ps.setString(1, email);
			rs = ps.executeQuery();
			
			if(rs.next()){
				if(pwd.equals(rs.getString("User_password")) ){ //"password" depends on the final name in database
					return true;
				}
			}
		} catch (SQLException e) {
			System.out.println("SQLException in function \"validate\"");
			e.printStackTrace();
		} finally {
			close();
		}
		return false;
	}
	
	public static int extract_userid(String email) {
		connect();
		try {
			ps = conn.prepareStatement("select User_ID from Users where User_email=?;");
			ps.setString(1, email);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				return rs.getInt("User_ID");
			}
		} catch (SQLException e) {
			System.out.println("SQLException in function \"extract\"");
			e.printStackTrace();
		} finally {
			close();
		}
		return -1;
	}
	
	public static void adduser(String un, String em, String pwd) {
		connect();
		try {
			ps = conn.prepareStatement("insert into Users (User_password, User_name, User_email) values (pwd, un, em);");
			rs = ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public static int checkemail(String email) {
		connect();
		try {
			ps = conn.prepareStatement("select count(*) as num from Users where User_email=?;");
			ps.setString(1, email);
			rs = ps.executeQuery();
			return rs.getInt("num");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return -1;
	}
	
	public static int checkusername(String username) {
		connect();
		try {
			ps = conn.prepareStatement("select count(*) as num from Users where User_name=?;");
			ps.setString(1, username);
			rs = ps.executeQuery();
			return rs.getInt("num");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return -1;
	}
	
}
