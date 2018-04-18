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
			
			if(email.length() == 0){ 
				request.setAttribute("email_error", "The email field should not be empty!");
				flag = -1;
			}
			
			if(password.length() == 0){
				request.setAttribute("password_error", "The password field should not be empty!");
				flag = -1;
			}
			
			if(email.length()!=0 && password.length()!=0 && !JDBCDriver.validate(email, password)){
				request.setAttribute("info_error", "The input info does not match!");
				flag = -1;
			}
			
			if(JDBCDriver.validate(email, password)){
				flag = 1;
			}
			
			if(flag == 1){
				int User_ID = JDBCDriver.extract_userid(email);
				request.getSession().setAttribute("email", email);
				request.getSession().setAttribute("password", password);
				request.getSession().setAttribute("User_ID", User_ID);
				
				response.sendRedirect("./home.jsp");
				return;
			}
		}

		RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/login.jsp");
		dispatch.forward(request, response);
	}

}
