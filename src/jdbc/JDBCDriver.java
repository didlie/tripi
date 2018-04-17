package jdbc;

import java.sql.*;
import java.util.ArrayList;

public class JDBCDriver {
	private static Connection conn = null;
	private static ResultSet rs = null;
	private static PreparedStatement ps = null;
	private static String password = "WangXueYuan123";
	
	public static void connect(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/Tripi?user=root&password="+ password +"&useSSL=false");
			System.out.println("Connected!");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void close(){
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
	
	
	public static ArrayList<ArrayList<String> >searchPlace(String place){
		ArrayList<ArrayList<String>>  stat = new ArrayList<ArrayList<String>>();
		connect();
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost/Tripi?user=root&password="+ password+"&useSSL=false");
			System.out.println("Search Place Connected?" + place);
			String sql = "SELECT Trip.Trip_ID, " + 
					"  Trip.cover_photo_link, TRIP.title, Trip.description,  Trip.main_place\n" + 
					"FROM Trip\n" + 
					"WHERE Trip.share = TRUE "
					+ " AND Trip.main_place = '" + place + "';";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				ArrayList<String> row = new ArrayList<String>();
				row.add(rs.getString("Trip.Trip_ID"));
				row.add(rs.getString("Trip.cover_photo_link"));
				row.add(rs.getString("Trip.title"));
				row.add(rs.getString("Trip.description"));
				row.add(rs.getString("Trip.main_place"));
				stat.add(row);
			}
		}catch(SQLException sqle){
			System.out.println("SQLException in function \" getData\": ");
			sqle.printStackTrace();
		}finally{
			close();
		}
		return stat;
	}
	
	public static ArrayList<ArrayList<String> >getATrip(String trip_id){
		ArrayList<ArrayList<String>>  stat = new ArrayList<ArrayList<String>>();
		connect();
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost/Tripi?user=root&password="+password+"&useSSL=false");
			System.out.println("Get A Trip Connected?" + trip_id);
			String sql = "SELECT Trip.Trip_ID, Trip.cover_photo_link, "
					+ "Trip.title, Trip.description, Trip.main_place,\n" + 
					"	Users.username, Users.profile_s\n" + 
					"FROM Users, Trip\n" + 
					"WHERE Users.user_ID = Trip.user_ID AND Trip.share = TRUE\n" + 
					"AND Trip.Trip_ID = " + trip_id +";";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				ArrayList<String> row = new ArrayList<String>();
				row.add(rs.getString("Trip.Trip_ID"));
				row.add(rs.getString("Trip.cover_photo_link"));
				row.add(rs.getString("Trip.title"));
				row.add(rs.getString("Trip.description"));
				row.add(rs.getString("Trip.main_place"));
				row.add(rs.getString("Users.username"));
				row.add(rs.getString("Users.profile_s"));
				stat.add(row);
			}
		}catch(SQLException sqle){
			System.out.println("SQLException in function \" getData\": ");
			sqle.printStackTrace();
		}finally{
			close();
		}
		return stat;
	}
	
	
	public static ArrayList<ArrayList<String> > getAllTrips(){
		ArrayList<ArrayList<String>>  stat = new ArrayList<ArrayList<String>>();
		connect();
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost/Tripi?user=root&password="+ password+"&useSSL=false");
			System.out.println("Get All Trips connected?");
			String sql = "SELECT Trip.Trip_ID, " + 
					"  Trip.cover_photo_link, TRIP.title, Trip.description,  Trip.main_place\n" + 
					"FROM Trip\n" + 
					"WHERE Trip.share = TRUE; ";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				ArrayList<String> row = new ArrayList<String>();
				row.add(rs.getString("Trip.Trip_ID"));
				row.add(rs.getString("Trip.cover_photo_link"));
				row.add(rs.getString("Trip.title"));
				row.add(rs.getString("Trip.description"));
				row.add(rs.getString("Trip.main_place"));
				stat.add(row);
			}
		}catch(SQLException sqle){
			System.out.println("SQLException in function \" getData\": ");
			sqle.printStackTrace();
		}finally{
			close();
		}
		return stat;
	}
	
	
	
}
