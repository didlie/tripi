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

import csci201.tripi.database.JDBCDriver;

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
		ArrayList<ArrayList<String>> trips = JDBCDriver.getTripsByUser(userId);
		
		ArrayList<String> tripIds = new ArrayList<String>();
		ArrayList<String> photoLinks = new ArrayList<String>();
		ArrayList<String> descriptions = new ArrayList<String>();
		ArrayList<String> titles = new ArrayList<String>();
		ArrayList<String> mainPlaces = new ArrayList<String>();

		for(ArrayList<String> trip : trips) {
			tripIds.add(trip.get(0));
			photoLinks.add(trip.get(1));
			titles.add(trip.get(2));
			descriptions.add(trip.get(3));
			mainPlaces.add(trip.get(4));
		}

		 //trips
		request.setAttribute("tripIds", tripIds);
		request.setAttribute("photoLinks", photoLinks);
		request.setAttribute("descriptions", descriptions);
		request.setAttribute("titles", titles);
		request.setAttribute("mainPlaces", mainPlaces);
		//profile
		request.setAttribute("profileImage", profilePic);
		request.setAttribute("displayName", displayName);

		//change this if necessary
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/profile.jsp");
		dispatcher.forward(request,response);
	}

}
