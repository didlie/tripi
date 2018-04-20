package csci201.tripi.database;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import csci201.tripi.trips.Item;

public class JDBCDriver {
	private static Connection conn = null;
	private static ResultSet rs = null;
	private static PreparedStatement ps = null;
	private static String password = "root";
	
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
			String sql = "SELECT Trip.trip_id, Trip.cover_photo_link, "
					+ "Trip.title, Trip.description, Trip.main_place,\n" + 
					"	User.username, User.profile_s\n" + 
					"FROM User, Trip\n" + 
					"WHERE User.user_id = Trip.user_id AND Trip.share = TRUE\n" + 
					"AND Trip.trip_id = " + trip_id +";";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				ArrayList<String> row = new ArrayList<String>();
				row.add(rs.getString("Trip.trip_id"));
				row.add(rs.getString("Trip.cover_photo_link"));
				row.add(rs.getString("Trip.title"));
				row.add(rs.getString("Trip.description"));
				row.add(rs.getString("Trip.main_place"));
				row.add(rs.getString("User.username"));
				row.add(rs.getString("User.profile_pic"));
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
			String sql = "SELECT Trip.trip_id, " + 
					"  Trip.cover_photo_link, Trip.title, Trip.description,  Trip.main_place\n" + 
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
	
	public static boolean authenticate(String email, String pwd) {
		connect();
		try {
			ps = conn.prepareStatement("select password from User where email=?;"); //"password" depends on the final name in database
			ps.setString(1, email);
			rs = ps.executeQuery();
			
			if(rs.next()){
				if(pwd.equals(rs.getString("password")) ){ //"password" depends on the final name in database
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
	
	public static ArrayList<String> getUserInfoByEmail(String email) {
		connect();
		try {
			ps = conn.prepareStatement("select * from User where email=?;");
			ps.setString(1, email);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				ArrayList<String> result = new ArrayList<String>();
				result.add(rs.getString("user_id"));
				result.add(rs.getString("password"));
				result.add(rs.getString("username"));
				result.add(rs.getString("displayname"));
				result.add(rs.getString("email"));
				result.add(rs.getString("profile_pic"));
				
				return result;
			}
		} catch (SQLException e) {
			System.out.println("SQLException in function \"getUserInfo\"");
			e.printStackTrace();
		} finally {
			close();
		}
		
		return null;
	}
	
	public static void addUser(String username, String password, String displayName, String email, String profilePic) {
		connect();
		try {
			ps = conn.prepareStatement("insert into User (username, password, displayname, email, profile_pic) values (?, ?, ?, ?, ?);");
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setString(3,  displayName);
			ps.setString(4, email);
			ps.setString(5, profilePic);
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public static int checkEmail(String email) {
		connect();
		try {
			ps = conn.prepareStatement("select count(*) as num from User where email=?;");
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
	
	public static int checkUsername(String username) {
		connect();
		try {
			ps = conn.prepareStatement("select count(*) as num from User where username=?;");
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
	
	public static int createTrip(String userId, String coverPhotoLink, String description, String title, String mainPlace, boolean share) {
		connect();
		try {
			ps = conn.prepareStatement("insert into Trip (user_id, cover_photo_link, description, title, main_place, share) values (?, ?, ?, ?, ?, ?);", Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, userId);
			ps.setString(2, coverPhotoLink);
			ps.setString(3, description);
			ps.setString(4, title);
			ps.setString(5, mainPlace);
			ps.setBoolean(6, share);
			ps.execute();
			
			try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
	            if (generatedKeys.next()) {
	                return generatedKeys.getInt(1);
	            }
	        }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return -1;
	}
	
	public static ArrayList<String> getTripInfo(String tripId){
		connect();
		try {
			ps = conn.prepareStatement("SELECT * FROM Trip WHERE trip_id=?;");
			ps.setString(1, tripId);
			rs = ps.executeQuery();
			
			if (rs.next()){
				ArrayList<String> result = new ArrayList<String>();
				
				result.add(rs.getString("trip_id"));
				result.add(rs.getString("user_id"));
				result.add(rs.getString("cover_photo_link"));
				result.add(rs.getString("description"));
				result.add(rs.getString("title"));
				result.add(rs.getString("main_place"));
				result.add(rs.getString("share"));
				
				return result;
			}
		}catch(SQLException sqle){
			System.out.println("SQLException in function \" getData\": ");
			sqle.printStackTrace();
		}finally{
			close();
		}
		
		return null;
	}
	
	public static ArrayList<Item> getTripItems(String tripId){
		connect();
		try {
			ps = conn.prepareStatement("SELECT * FROM Item WHERE trip_id=? ORDER BY time ASC;");
			ps.setString(1, tripId);
			rs = ps.executeQuery();
			
			ArrayList<Item> tripItems = new ArrayList<Item>();
			while(rs.next()) {
				String itemTitle = rs.getString("title");
				String itemDescription = rs.getString("description");
				String itemLatitude = rs.getString("latitude");
				String itemLongitude = rs.getString("longitude");
				String itemTime = rs.getString("time");
				String itemAddress = rs.getString("address");
				String itemType = rs.getString("type");
				String itemLink = rs.getString("link");
				
				Item item = new Item();
				item.setTitle(itemTitle);
				item.setDescription(itemDescription);
				item.setLatitude(itemLatitude);
				item.setLongitude(itemLongitude);
				item.setTime(itemTime);
				item.setAddress(itemAddress);
				item.setType(itemType);
				item.setLink(itemLink);
				
				tripItems.add(item);
			}
			
			return tripItems;
		}catch(SQLException sqle){
			System.out.println("SQLException in function \" getData\": ");
			sqle.printStackTrace();
		}finally{
			close();
		}
		
		return null;
	}
}
