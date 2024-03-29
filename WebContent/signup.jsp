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
    
    <style>
    .auth-form {
      width: 330px;
      margin: 0 auto;
    }
    
    input[type='text'], input[type='password'], input[type='email'] {
      border-radius: 0;
    }
    
    .auth-form .first {
      border-radius: 5px 5px 0 0;
    }
    
    .auth-form .last {
      border-radius: 0 0 5px 5px;
    }
    </style>
  </head>

  <body class="text-center" style = "background-image: url('./img/auth-bg.jpg'); background-size: cover;">
    <form class="auth-form" method = "POST" action = "./signup">
      <a href = "home.jsp"><img class="mb-4" src="./img/logoorange.png" alt="" width="auto" height="300"></a>
      <div style = "margin-top: -60px;">
      <h1 class="h3 mb-3 font-weight-normal" style = "color: #f9880e;">Please fill out</h1>
      
      <% if (request.getAttribute("error") != null) { %>
      <div class="alert alert-danger item-form-alert" role="alert">
        <%= request.getAttribute("error") %>
      </div>
      <% } %>
        
      <input type="text" id="username" name="username" class="form-control first" placeholder="Username" required>
      
      <input type="email" id="email" name="email" class="form-control" placeholder="Email Address" required autofocus>
      
      <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
      
      <input type="text" id="displayName" name="displayName" class="form-control" placeholder="Display Name" required>
      
      <input type="text" id="profilePic" name="profilePic" class="form-control last" placeholder="Profile Pic Link" required>
      
      <br>
      
      <button class="btn btn-lg btn-primary btn-block" type="submit" style = "background-color: #f9880e; border-color: #f9880e;">Sign up</button>
    	</div>
    </form>
  </body>
</html>
