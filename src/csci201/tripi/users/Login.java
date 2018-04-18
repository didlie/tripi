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
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		if (email != null && password != null) {
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
			
			if(!JDBCDriver.authenticate(email, password)){
				errorMessage += "Email and password don't match!";
				flag = -1;
			} else {
				flag = 1;
			}
			
			if(flag == 1){
				ArrayList<String> user = JDBCDriver.getUserInfoByEmail(email);
				request.getSession().setAttribute("user_id", user.get(0));
				request.getSession().setAttribute("password", user.get(1));
				request.getSession().setAttribute("username", user.get(2));
				request.getSession().setAttribute("displayname", user.get(3));
				request.getSession().setAttribute("email", user.get(4));
				request.getSession().setAttribute("profile_pic", user.get(5));
				
				response.sendRedirect("./home.jsp");
				return;
			} else {
				// If flag is not 1, that means there were errors
				request.setAttribute("error", errorMessage);
			}
		}

		RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/login.jsp");
		dispatch.forward(request, response);
	}

}
