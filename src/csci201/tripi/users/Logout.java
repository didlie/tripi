package csci201.tripi.users;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Logout
 */
@WebServlet("/logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().setAttribute("user_id", null);
		request.getSession().setAttribute("password", null);
		request.getSession().setAttribute("username", null);
		request.getSession().setAttribute("displayname", null);
		request.getSession().setAttribute("email", null);
		request.getSession().setAttribute("profile_pic", null);
		
		response.sendRedirect("./home.jsp"); 
	}

}
