<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "jdbc.*, java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	
	<% 
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String username = request.getParameter("username");
		
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
		}
		else if(flag == -1){
			response.sendRedirect("signup.jsp");
		}
	%>
	
	<body>

	</body>
</html>
