package csci201.tripi.trips;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import csci201.tripi.database.JDBCDriver;

/**
 * Servlet implementation class AddItem
 */
@WebServlet("/edit/additem")
public class AddItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String responseMessage = "";
		
		String tripId = request.getParameter("id");
		System.out.println("in add item: " + request.getParameter("title"));
		
		if (tripId == null) {
			tripId = "";
		}
		
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String latitude = request.getParameter("latitude");
		String longitude = request.getParameter("longitude");
		String address = request.getParameter("address");
		String time = request.getParameter("time");
		String type = request.getParameter("type");
		String link = request.getParameter("link");
		
		if (title.trim().equals("")) {
			responseMessage += "Title cannot be blank";
		}
		
		if (description.trim().equals("")) {
			responseMessage += "Description cannot be blank";
		}
		
		responseMessage += JDBCDriver.addItem(tripId, title, description, latitude, longitude, address, time, type, link);
		
		PrintWriter out = response.getWriter();
		out.println(responseMessage);
		out.close();
		
	}
}
