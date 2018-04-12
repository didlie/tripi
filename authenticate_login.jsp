<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	
	<% 
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		int flag = 0;
		if(email.length() == 0){
			request.setAttribute("email_error", "The email field should not be empty!");
			flag = -1;
		}
		if(password.length() == 0){
			request.setAttribute("password_error", "The password field should not be empty!");
			flag = -1;
		}
		if(!JDBCDriver.validate(email, password)){
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
			
			response.sendRedirect("home.jsp"); //need to add name of homepage after login
		}
		if(flag == -1){
			response.sendRedirect("login.jsp");
		}
	%>
	
	<body>

	</body>
</html>