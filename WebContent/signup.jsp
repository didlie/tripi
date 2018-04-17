<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Tripi Signup</title>

    <!-- Bootstrap core CSS -->
    <link href="https://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="https://getbootstrap.com/docs/4.0/examples/sign-in/signin.css" rel="stylesheet">
  </head>

  <body class="text-center" style = "background-image: url('background.jpg'); background-size: cover;">
    <form class="form-signin" method = "POST" action = "authenticate1_signup.jsp">
      <a href = "home.jsp"><img class="mb-4" src="logoorange.png" alt="" width="auto" height="300"></a>
      <div style = "margin-top: -60px;">
      <h1 class="h3 mb-3 font-weight-normal" style = "color: #f9880e;">Please fill out</h1>
      <label for="inputFname" class="sr-only">First Name</label>
      <input type="fname" id="fname" name="username" class="form-control" placeholder="First Name" required><span style="color: red;font-weight:bold">${username_error!=null? username_error : username_repeat_error!=null? username_repeat_error : ''}</span>
      <label for="inputEmail" class="sr-only">Email address</label>
      <input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email address" required autofocus><span style="color: red;font-weight:bold">${email_error!=null? email_error : email_repeat_error!=null? email_repeat_error : ''}</span>
      <label for="inputPassword" class="sr-only">Password</label>
      <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required><span style="color: red;font-weight:bold">${password_error!=null? password_error : ''}</span>
      <button class="btn btn-lg btn-primary btn-block" type="submit" style = "background-color: #f9880e; border-color: #f9880e;">Sign up</button>
    	</div>
    </form>
  </body>
</html>
