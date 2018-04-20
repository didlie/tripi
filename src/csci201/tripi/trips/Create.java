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
 * Servlet implementation class Create
 */
@WebServlet("/create")
public class Create extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = (String) request.getSession().getAttribute("user_id");
		String coverPhotoLink = request.getParameter("coverPhotoLink");
		String description = request.getParameter("description");
		String title = request.getParameter("title");
		String mainPlace = request.getParameter("mainPlace");
		
		int tripId = JDBCDriver.createTrip(userId, coverPhotoLink, description, title, mainPlace, true);
		
		PrintWriter out = response.getWriter();
		out.println(tripId);
		out.close();
	}
}
