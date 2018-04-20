package csci201.tripi.users;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import csci201.tripi.database.JDBCDriver;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String username = request.getParameter("username");
		String displayName = request.getParameter("displayName");
		String profilePic = request.getParameter("profilePic");
		 
		if (email != null && password != null && username != null) {
			int flag = 0;
			String errorMessage = "";
			
			if(email.length() == 0){
				errorMessage += "The email field should not be empty. ";
				flag = -1;
			} 
			
			if(password.length() == 0){
				errorMessage += "The password field should not be empty. ";
				flag = -1;
			}
			
			if(username.length() == 0){
				errorMessage += "The username field should not be empty. ";
				flag = -1;
			}
			
			if(displayName.length() == 0){
				errorMessage += "The display name field should not be empty. ";
				flag = -1;
			}
			
			if(profilePic.length() == 0){
				errorMessage += "The profile pic field should not be empty. ";
				flag = -1;
			}
			
			if(email.length()!=0 && JDBCDriver.checkEmail(email)==1){
				errorMessage += "This email address has been used. ";
				flag = -1;
			}
			
			if(username.length()!=0 && JDBCDriver.checkUsername(username)==1){
				errorMessage += "This username has been used!";
				flag = -1;
			}
			
			if(flag == 0){
				// If flag is 0, that means there were no errors
				JDBCDriver.addUser(username, password, displayName, email, profilePic);
				
				ArrayList<String> user = JDBCDriver.getUserInfoByEmail(email);
				request.getSession().setAttribute("user_id", user.get(0));
				request.getSession().setAttribute("password", user.get(1));
				request.getSession().setAttribute("username", user.get(2));
				request.getSession().setAttribute("displayname", user.get(3));
				request.getSession().setAttribute("email", user.get(4));
				request.getSession().setAttribute("profile_pic", user.get(5));
				
				response.sendRedirect("home.jsp");
				return; // Proceed no further
			} else {
				// If flag is -1, that means there were errors
				request.setAttribute("error", errorMessage);
			}
		}
		
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/signup.jsp");
		dispatch.forward(request, response);
	}

}
