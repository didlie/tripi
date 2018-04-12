<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ page import="csci201.tripi.trips.Item" %> 
<%@ page import="java.util.List" %>
    
<!doctype html>

<html>
	<head>
		<title>Tripi - <%= request.getAttribute("title") %></title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link rel="stylesheet" href="./css/stylesheet.css">
	</head>
	
	<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
  		  <a class="navbar-brand" href="#">Tripi</a>
  		  
  		  <ul class="navbar-nav ml-auto">
  		    <li class="nav-item"><a class="nav-link" href="/login">Log In</a></li>
  		    <li class="nav-item"><a class="nav-link" href="/signup">Sign Up</a></li>
  		  </ul>
	  </nav>

		<div class="container-fluid full-screen">
			<div class="row h-100">
				<div class="col padding-0">
					<div id="map"></div>
				</div>
				
				<div class="col timeline">
				  <div class="trip-header">
				    <img src="<%= request.getAttribute("coverPhoto") %>" class="trip-cover">
				    <div class="trip-header-overlay"></div>
				    
				    <div class="trip-details">
				      <h1 class="trip-title"><%= request.getAttribute("title") %></h1>
              <h2 class="trip-place" id="trip-place"><%= request.getAttribute("mainPlace") %></h2>
              <p class="trip-description"><%= request.getAttribute("description") %></p>
				    </div>
           </div>
           
				  <div class="trip-items">
				    <%
				    List<Item> tripItems = (List<Item>) request.getAttribute("tripItems");
				    
				    for(Item i : tripItems) {
				    	%>
				    	<div class="card trip-item" data-longitude="<%= i.getLongitude() %>" data-latitude="<%= i.getLatitude() %>">
              <div class="card-body">
                <h5 class="card-title"><%= i.getTitle() %></h5>
                <p class="card-subtitle"><%= i.getAddress() %></p>
                <p class="card-text"><%= i.getDescription() %></p>
              </div>
            </div>
				    	<%
				    }
				    %>
          </div>
				</div>
			</div>      
		</div>
		
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="./js/trip.js"></script>
    
    <script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
    <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB6J_Nh39Z6ExGReql27-RJv7wY8IjPLY8&callback=initMap">
      </script>
		
	</body>
</html>