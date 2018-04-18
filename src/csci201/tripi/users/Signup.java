package csci201.tripi.users;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.JDBCDriver;

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
		 
		if (email != null && password != null && username != null) {
			int flag = 0;
			
			if(email.length() == 0){
				request.setAttribute("email_error", "The email field should not be empty!");
				flag = -1;
			} 
			
			if(password.length() == 0){
				request.setAttribute("password_error", "The password field should not be empty!");
				flag = -1;
			}
			
			if(username.length() == 0){
				request.setAttribute("username_error", "The username field should not be empty!");
				flag = -1;
			}
			
			if(email.length()!=0 && JDBCDriver.checkemail(email)==1){
				request.setAttribute("email_repeat_error", "This email address has been used!");
				flag = -1;
			}
			
			if(username.length()!=0 && JDBCDriver.checkusername(username)==1){
				request.setAttribute("username_repeat_error", "This username has been used!");
				flag = -1;
			}
			
			if(username.length()!=0 && password.length()!=0 && email.length()!=0 && JDBCDriver.checkemail(email)==0 && JDBCDriver.checkusername(username)==0){
				JDBCDriver.adduser(username, email, password);
				flag = 1;
			}
			
			if(flag == 1){
				int User_ID = JDBCDriver.extract_userid(email);
				request.getSession().setAttribute("User_ID", User_ID);
				request.getSession().setAttribute("email", email);
				request.getSession().setAttribute("password", password);
				request.getSession().setAttribute("username", username);
				
				response.sendRedirect("home.jsp");
				return;
			}
		}
		
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/signup.jsp");
		dispatch.forward(request, response);
	}

}
