package csci201.tripi.users;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class toProfilePage
 */
@WebServlet("/profile")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//need to get the user ID
		//int userId = Integer.parseInt(request.getParameter("user_id"));
		//String displayName = request.getParameter("displayName");
		
		String displayName = "Darkdra";
		int userId = 1;
		
		//to get trips, profile image, username trips
		 Connection conn = null;
		 Statement st = null;
		 ResultSet rs = null;
		 try {
		 Class.forName("com.mysql.jdbc.Driver");
		 conn = DriverManager.getConnection("jdbc:mysql://localhost/tripi?user=root&password=root&useSSL=false");
		 st = conn.createStatement();
		 
		 rs = st.executeQuery("SELECT * FROM Users s, Trip p Where s.User_ID=" + userId + ";");
		 
		 
		 //get profile image
		 String profileImage = "";
		 if(rs.next()) {
			 profileImage = rs.getString("profile_s");
		 }
		
		 
		 ArrayList<String> photoLinks = new ArrayList<String>();
		 ArrayList<String> descriptions = new ArrayList<String>();
		 ArrayList<String> titles = new ArrayList<String>();
		 ArrayList<String> mainPlaces = new ArrayList<String>();
		 while (rs.next()) {
			 String link = rs.getString("cover_photo_link");
			 String desc = rs.getString("description");
			 String title = rs.getString("title");
			 String place = rs.getString("main_place");
			 //check
			 //System.out.println("it: " + link + " " + desc + " " + title + " " + place);
			 //
			 photoLinks.add(link);
			 descriptions.add(desc);
			 titles.add(title);
			 mainPlaces.add(place);
		  }
		 //trips
		 request.setAttribute("photoLinks", photoLinks);
		 request.setAttribute("descriptions", descriptions);
		 request.setAttribute("titles", titles);
		 request.setAttribute("mainPlaces", mainPlaces);
		 //profile
		 request.setAttribute("profileImage", profileImage);
		 request.setAttribute("displayName", displayName);
		 } catch (SQLException sqle) {
			  System.out.println ("sqle: " + sqle.getMessage());
		 } catch (ClassNotFoundException cnfe) {
			  System.out.println ("cnfe: " + cnfe.getMessage());
		} finally {
			  try {
				  if (rs != null) { rs.close(); }
				  if (st != null) { st.close(); }
				  if (conn != null) { conn.close(); }
			  } catch (SQLException sqle) {
			  System.out.println("sqle2: " + sqle.getMessage());
			  }
		}
		 
		 //change this if necessary
		  String nextPage = "/profile.jsp";
		  RequestDispatcher dispatcher =
		  getServletContext().getRequestDispatcher(nextPage);
		  dispatcher.forward(request,response);
		
		
	}

}
