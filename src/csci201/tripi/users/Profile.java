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
		if (request.getSession().getAttribute("user_id") == null) {
			response.sendRedirect("./home.jsp");
			return;
		}
		
		String userId = (String) request.getSession().getAttribute("user_id");
		// String password = (String) request.getSession().getAttribute("password");
		// String username = (String) request.getSession().getAttribute("username");
		String displayName = (String) request.getSession().getAttribute("displayname");
		// String email = (String) request.getSession().getAttribute("email");
		String profilePic = (String) request.getSession().getAttribute("profile_pic");

		//to get trips, profile image, username trips
		 Connection conn = null;
		 Statement st = null;
		 ResultSet rs = null;
		 try {
		 Class.forName("com.mysql.jdbc.Driver");
		 String password = "WangXueYuan123";
		 conn = DriverManager.getConnection("jdbc:mysql://localhost/tripi?user=root&password="+ password+"&useSSL=false");
		 st = conn.createStatement();
		 
		 rs = st.executeQuery("SELECT * FROM Trip t Where t.user_id=" + userId + ";");
		 
		 ArrayList<String> tripIds = new ArrayList<String>();
		 ArrayList<String> photoLinks = new ArrayList<String>();
		 ArrayList<String> descriptions = new ArrayList<String>();
		 ArrayList<String> titles = new ArrayList<String>();
		 ArrayList<String> mainPlaces = new ArrayList<String>();
		 while (rs.next()) {
			 String id = rs.getString("trip_id");
			 String link = rs.getString("cover_photo_link");
			 String desc = rs.getString("description");
			 String title = rs.getString("title");
			 String place = rs.getString("main_place");

			 tripIds.add(id);
			 photoLinks.add(link);
			 descriptions.add(desc);
			 titles.add(title);
			 mainPlaces.add(place);
		  }
		 //trips
		 request.setAttribute("ids", tripIds);
		 request.setAttribute("photoLinks", photoLinks);
		 request.setAttribute("descriptions", descriptions);
		 request.setAttribute("titles", titles);
		 request.setAttribute("mainPlaces", mainPlaces);
		 //profile
		 request.setAttribute("profileImage", profilePic);
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
		  RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/profile.jsp");
		  dispatcher.forward(request,response);
	}

}
