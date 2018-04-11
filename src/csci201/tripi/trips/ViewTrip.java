package csci201.tripi.trips;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewTrip
 */
@WebServlet("/view")
public class ViewTrip extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		Statement st = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String tripId = request.getParameter("id");
		
		if (tripId == null) {
			tripId = "";
		}
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/Tripi?user=root&password=root&useSSL=false");
			st = conn.createStatement();
			ps = conn.prepareStatement("SELECT * FROM Trip WHERE Trip_ID=?;");
			ps.setString(1, tripId);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String title = rs.getString("title");
				request.setAttribute("title", title);
				
				String coverPhoto = rs.getString("cover_photo_link");
				request.setAttribute("coverPhoto", coverPhoto);
				
				String description = rs.getString("description");
				request.setAttribute("description", description);
				
				String mainPlace = rs.getString("main_place");
				request.setAttribute("mainPlace", mainPlace);
			}
			
			PreparedStatement itemsPs = null;
			ResultSet itemSet = null;
			
			try {
				itemsPs = conn.prepareStatement("SELECT * FROM Item WHERE Trip_ID=? ORDER BY time ASC;");
				itemsPs.setString(1, tripId);
				
				itemSet = itemsPs.executeQuery();
				
				List<Item> tripItems = new ArrayList<Item>();
				while(itemSet.next()) {
					String itemTitle = itemSet.getString("title");
					String itemDescription = itemSet.getString("description");
					String itemLatitude = itemSet.getString("latitude");
					String itemLongitude = itemSet.getString("longtitude");
					String itemTime = itemSet.getString("time");
					String itemAddress = itemSet.getString("address");
					String itemType = itemSet.getString("type");
					String itemLink = itemSet.getString("link");
					
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
				
				request.setAttribute("tripItems", tripItems);
			} finally {
				if (itemsPs != null && itemSet != null) {
					itemsPs.close();
					itemSet.close();	
				}
			}
		} catch (SQLException sqle) {
			System.out.println("sqle: " + sqle.getMessage());
		} catch (ClassNotFoundException cnfe) {
			System.out.println("cnfe: " + cnfe.getMessage());
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (st != null) {
					st.close();
				}
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
			} catch (SQLException sqle) {
				System.out.println("sqle closeing streams");	
			}
		}

		RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/view.jsp");
		dispatch.forward(request, response);
	}

}
