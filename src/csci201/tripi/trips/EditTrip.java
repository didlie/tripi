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

import csci201.tripi.database.JDBCDriver;

/**
 * Servlet implementation class EditTrip
 */
@WebServlet("/edit")
public class EditTrip extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getSession().getAttribute("user_id") == null) {
			response.sendRedirect("./home.jsp");
			return;
		}
		
		String tripId = request.getParameter("id");
		request.setAttribute("tripId", tripId);
		
		if (tripId == null) {
			tripId = "";
		}
		
		ArrayList<String> tripInfo = JDBCDriver.getTripInfo(tripId);
		
		// Trip wasn't found if tripInfo is null
		if (tripInfo == null) {
			response.sendRedirect("./home.jsp");
			return;
		}
		
		// User must own trip to edit
		if (!request.getSession().getAttribute("user_id").equals(tripInfo.get(1))) {
			// User doesn't own trip. OUT!
			response.sendRedirect("./home.jsp");
			return;
		}
		
		request.setAttribute("title", tripInfo.get(4));
		request.setAttribute("coverPhoto", tripInfo.get(2));
		request.setAttribute("description", tripInfo.get(3));
		request.setAttribute("mainPlace", tripInfo.get(5));
		
		ArrayList<Item> tripItems = JDBCDriver.getTripItems(tripId);
		request.setAttribute("tripItems", tripItems);
		
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/edit.jsp");
		dispatch.forward(request, response);
	}
}
