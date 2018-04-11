

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/signup")
public class signupservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		String pageToForward = null;
		HttpSession session;
		session = request.getSession(true);
		try {
			Class.forName("com.mysql.jdbc.Driver"); 
			//conn = DriverManager.getConnection("jbdc:mysql://localhost/StudentGrades?user=root&password=Chloedog98&useSSL=false");
			st = conn.createStatement(); 

			String username = request.getParameter("username");
			String fname = request.getParameter("fname");
			String password = request.getParameter("password");
			
			//add the user to the database
//			INSERT INTO table_name (column1, column2, column3, ...)
//			VALUES (value1, value2, value3, ...);
			
			//if the username and password is good
			session.setAttribute("user", username);
			
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
	
		
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(pageToForward);
		dispatch.forward(request, response);
	}

}
