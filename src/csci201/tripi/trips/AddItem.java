package csci201.tripi.trips;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddItem
 */
@WebServlet("/edit/additem")
public class AddItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String responseMessage = "";
		
		Connection conn = null;
		Statement st = null;
		PreparedStatement ps = null;
		
		String tripId = request.getParameter("id");
		
		if (tripId == null) {
			tripId = "";
		}
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/Tripi?user=root&password=root&useSSL=false");
			st = conn.createStatement();
			ps = conn.prepareStatement("INSERT INTO "
					+ "Item (trip_id, title, description, latitude, longtitude, address, time, type, link) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);");
			
			ps.setString(1, tripId);
			ps.setString(2, request.getParameter("title"));
			ps.setString(3, request.getParameter("description"));
			ps.setString(4, request.getParameter("latitude"));
			ps.setString(5, request.getParameter("longitude"));
			ps.setString(6, request.getParameter("address"));
			ps.setString(7, request.getParameter("time"));
			ps.setString(8, request.getParameter("type"));
			ps.setString(9, request.getParameter("link"));
			
			ps.execute();
			
			responseMessage = "SUCCESS";
		} catch (SQLException sqle) {
			System.out.println("sqle: " + sqle.getMessage());
			responseMessage = "FAIL";
		} catch (ClassNotFoundException cnfe) {
			System.out.println("cnfe: " + cnfe.getMessage());
			responseMessage = "FAIL";
		} finally {
			try {
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
		
		PrintWriter out = response.getWriter();
		out.println(responseMessage);
		out.close();
	}
}
