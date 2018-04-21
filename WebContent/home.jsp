<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "csci201.tripi.database.JDBCDriver, java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<title>TRIPI Home</title>

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
		 <!--- Semantics UI Component CSS -->
		<link rel="stylesheet" type="text/css" href="css/dist/components/icon.css">
		<link rel="stylesheet" type="text/css" href="css/dist/components/button.css">
		<link rel="stylesheet" type="text/css" href="css/dist/components/card.css">
		<link rel="stylesheet" type="text/css" href="css/dist/components/label.css">
		<link rel="stylesheet" type="text/css" href="css/dist/components/image.css">
		<link rel="stylesheet" type="text/css" href="css/dist/components/reveal.css">
		<link rel="stylesheet" type="text/css" href="css/dist/components/dimmer.css">
		<link rel="stylesheet" type="text/css" href="css/dist/components/rating.css">
		<link rel="stylesheet" type="text/css" href="css/dist/components/transition.css">
		<link rel="stylesheet" type="text/css" href="css/dist/components/popup.css">

		<link rel="stylesheet" href="css/home.css">
		<!-- Cross file header style -->
		<link rel="stylesheet" href="css/header.css"> 

		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


	
	    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>

		<!--- Semantic UI Component JS -->
		<script src="css/assets/library/jquery.min.js"></script>
		<script src="css/assets/library/iframe-content.js"></script>
		<script type="text/javascript" src="css/dist/components/popup.js"></script>
		<script type="text/javascript" src="css/dist/components/dimmer.js"></script>
		<script type="text/javascript" src="css/dist/components/rating.js"></script>
		<script type="text/javascript" src="css/dist/components/transition.js"></script>

	</head> 
	
	<body>


		<!-- Nav Bar -->
		<nav id="navigation" class="navbar navbar-expand-lg navbar-light bg-light">
		  <div class="container">
	        <!-- <a class="navbar-brand" href="./home.jsp">Tripi</a> -->
	        <a href = "home.jsp"><img class="nav-img" src="./img/logo-nav.png" alt="" width="auto" height="300"></a>


	        <ul class="navbar-nav ml-auto">
	        	<%
          			if (request.getSession().getAttribute("user_id") == null) {
        	  	%>
	        	  <li class="nav-item">
	        	  	<a class="nav-link" href="./login">Log In</a>
	        	  </li>
	              <li class="nav-item">
	              	<a class="nav-link" href="./signup">Sign Up</a>
	              </li>
	              <li class="nav-item">
	              	<a class="nav-link" href="./login">Create Trip</a>
	              </li>
	            <% } else {  %>
              	  <li class="nav-item">
              	   <a class="nav-link" href="./profile">Hello <%= request.getSession().getAttribute("displayname") %></a>
              	  </li>

          		  <li class="nav-item">
          		  	<a class="nav-link" href="./logout">Logout</a>
          		  </li>

              	  
          	<% } %>

	        </ul>
		  </div>
    	</nav>

	    <!-- Carousel  -->
	    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
	        <ol class="carousel-indicators">
	          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
	          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
	          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
	        </ol>
	        <div class="carousel-inner" role="listbox">
	          <!-- Slide One - Set the background image for this slide in the line below -->
	          <div class="carousel-item active" style="background-image: url('img/home-bg.jpg')">
				<!--  <div class="carousel-caption d-none d-md-block">
	              <h3>First Slide</h3>
	              <p>This is a description for the first slide.</p>
	            </div> -->
	          </div>
	          <!-- Slide Two - Set the background image for this slide in the line below -->
	          <div class="carousel-item" style="background-image: url('img/home-bg2.jpg')">
	          </div>
	          <!-- Slide Three - Set the background image for this slide in the line below -->
	          <div class="carousel-item" style="background-image: url('img/home-bg3.jpg')">
	          </div>
	        </div>
	        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
	          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	          <span class="sr-only">Previous</span>
	        </a>
	        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
	          <span class="carousel-control-next-icon" aria-hidden="true"></span>
	          <span class="sr-only">Next</span>
	        </a>
	    </div>


	     <!-- Search Box -->
		<nav id="search-nav" class="navbar navbar-light bg-light">
		  	<h2>Inspire Your Next Trip </h2> <br/>
		  	<div class="search-field">
			    <input class="form-control mr-sm-2 search-input" type="search" 
			    	placeholder="Search Location" aria-label="Search" id="search-term">
			    <button class="btn btn-outline-success my-2 my-sm-0" onclick="search();">Search</button>
			</div>
		</nav>
			
		<br style="clear: both;">
		<div class="search-place">
			<h2><span style="color: black;"> Trips for you in </span>
				<span id="result-search-term">...</span></h2>
		</div>

		<div id="semantic-results">
			<!-- Semantic Cards Results -->
			<div class="ui card">
			    <div class="image">
			      	<img class="result-img" src="img/img2.jpg">
			        <div class="content">
			          <div class="center">
			          	<a href="#">
				            <div class="ui teal button">
				            	View Itinerary
				            </div>
			        	</a>
			          </div>
			        </div>
			    </div>

			    <div class="content">
			      <div class="header">Title</div>
			      <div class="description">
			        One or two sentence description that may go to several lines
			      </div>
			    </div>
			    <div class="extra content">
			      <a class="friends">
			      	<i class="fa fa-map-marker"></i>
			        Las Vegas</a>
			    </div>
			</div><!--End Semantic Card-->
			
		</div> <!--End Semantic-Result-->
		<br style="clear: both;">

		<script type="text/javascript">
			// Populate the home page search results

			// Make the search field auto-complete place names for user
			var autocomplete;
			function initAutocomplete() {
		        // Create the autocomplete object, restricting the search to geographical
		        // location types.
		        autocomplete = new google.maps.places.Autocomplete(
		            /** @type {!HTMLInputElement} */(document.getElementById('search-term')),
		            {types: ['geocode']});
		    }


		    // Search Function
			function search(){
				var searchTerm = document.querySelector('#search-term').value;
				console.log(searchTerm);
				searchTerm = searchTerm.trim();
				// searchTerm = encodeURI(searchTerm);
				console.log(searchTerm);
				if(searchTerm == ""){
					// If user not search a place - display all places
						console.log("No places");
						window.location.href = "home.jsp";
					
				}
				var place = autocomplete.getPlace();
				var short_name = place.address_components[0]["short_name"]	
				window.location.href = "home.jsp?place=" + encodeURI(short_name);
			}// End function search

			<%	
			// Connect to database and get search results
			if(request.getParameter("place") != null){
				String place = request.getParameter("place");
			%>
			// Change the displayed search place
			document.querySelector('#result-search-term').innerHTML = "<%=place%>";

			<%
				System.out.println("Home-Seraching for a place..." + request.getParameter("place") );
				ArrayList<ArrayList<String>> stat = JDBCDriver.searchPlace(place);
				System.out.println("size: " + stat.size());
			
				request.setAttribute("list", stat);	
				int result_size = stat.size();
			%>
				// Display the stats

				var content = "";

				<%for(int i = 0; i < result_size; i++){ %>
					var id = "<%=stat.get(i).get(0)%>";
					var img_link = "<%=stat.get(i).get(1)%>";
					var title = "<%=stat.get(i).get(2)%>";
					var description = "<%=stat.get(i).get(3)%>";
					var main_place = "<%=stat.get(i).get(4)%>";
 
					content += '<div class="ui card">';
					content += '<div class="image">';
					content += '<img class="result-img" src="'+ img_link +'">';
					content += '<div class="content">';
					content += '<div class="center">';
					
					content += '<a href="view?id='+ id +'">';
					content += '<div class="ui teal button">View Itinerary </div>';
					content += '</a></div></div></div>';

					content += '<div class="content">';
					
					content += '<div class="header">' + title + '</div>';
					content += '<div class="description">';
					
					content += description;
					content += '</div></div>';
					content += '<div class="extra content">';
					content += '<a class="friends"><i class="fa fa-map-marker"></i> ';
					
					content += main_place;
					content += '</a></div></div>';

				<%}%>
				
			
				if(content != ""){
					document.getElementById('semantic-results').innerHTML = content;
				}else{
					document.getElementById('semantic-results').innerHTML = "No Results Found!";
				}
			<%}%>// End if place not null


			// Load the page, display all places
			function DisplayAllPlaces(){
				<%
				System.out.println("Displaying all places..." );
				ArrayList<ArrayList<String>> stat = JDBCDriver.getAllTrips();
				System.out.println("size: " + stat.size());
				request.setAttribute("list", stat);	
				
				// Display the stats
				int result_size = stat.size();
				%>
				
				var content = "";
				
				<%for(int i = 0; i < result_size; i++){ %>
					var id = "<%=stat.get(i).get(0)%>";
					var img_link = "<%=stat.get(i).get(1)%>";
					var title = "<%=stat.get(i).get(2)%>";
					var description = "<%=stat.get(i).get(3)%>";
					var main_place = "<%=stat.get(i).get(4)%>";

					content += '<div class="ui card">';
					content += '<div class="image">';
					content += '<img class="result-img" src="'+ img_link +'">';
					content += '<div class="content">';
					content += '<div class="center">';
					
					content += '<a href="view?id='+ id +'">';
					content += '<div class="ui teal button">View Itinerary </div>';
					content += '</a></div></div></div>';

					content += '<div class="content">';
					
					content += '<div class="header">' + title + '</div>';
					content += '<div class="description">';
					
					content += description;
					content += '</div></div>';
					content += '<div class="extra content">';
					content += '<a class="friends"><i class="fa fa-map-marker"></i> ';
					
					content += main_place;
					content += '</a></div></div>';

				<%}%>
				
				content += '<br style="clear: both;">';
	
				if(content != ""){
					document.getElementById('semantic-results').innerHTML = content;
				}else{
					document.getElementById('semantic-results').innerHTML = "No Results Found!";
				}
				
				
			}// End DisplayAllPlaces function
			
			// If user not search a place - display all places
			<%
			if(request.getParameter("place") == null){
			%>
				console.log("No places");
				window.onload = DisplayAllPlaces();
				document.querySelector('#result-search-term').innerHTML = "Worldwide";
			<%}%>
			
			

		</script>
		<script>
			// Multi-Threading with Networking
  			var socket;
			function connectToServer() {
				socket = new WebSocket("ws://localhost:8080/tripi_csci201/feed"); 
	
				socket.onmessage = function(event) {
				  let message = JSON.parse(event.data); // assume event.data = {"message": "login", "user": "natalie"}
	
				  if(message.message == "newI"){
	
				    var content = "";
				    var oldHTML = document.getElementById("semantic-results").innerHTML;
					
				    content += '<div class="ui card">';
					content += '<div class="image">';
					content += '<img class="result-img" src="'+ message.img +'">';
					content += '<div class="content">';
					content += '<div class="center">';
					
					content += '<a href="view?id='+ message.id +'">';
					content += '<div class="ui teal button">View Itinerary </div>';
					content += '</a></div></div></div>';

					content += '<div class="content">';
					
					content += '<div class="header">' + message.title + '</div>';
					content += '<div class="description">';
					console.log("here: "+ message.details);
	
					content += message.details;
					content += '</div></div>';
					content += '<div class="extra content">';
					content += '<a class="friends"><i class="fa fa-map-marker"></i> ';
					
					content += message.place;
					content += '</a></div></div>';
					document.getElementById("semantic-results").innerHTML = content + oldHTML;
					
				  }
				}
			}
			
		    function sendMessage(name, place, link, description) { //for when you make a newI
		      var xhttp = new XMLHttpRequest();
		      xhttp.open("GET", "create?coverPhotoLink=" + link + "&description=" + description + "&title=" + name + "&mainPlace=" + place, false)
		      xhttp.send();
		      var id = 0;
		      if(xhttp.responseText.trim().length > 0) { 
		        id = xhttp.responseText;
		      } 
		      else {
		        console.log("no id received");
		        return false;
		      }
		      event.data = {"message": "newI", "id": id, "place": place, "title": name, "img": link, "details": description};
		      socket.send(event.data);
		      return false; 
		    } 
			    
			connectToServer();
		</script>

		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCEOE3jhPysVbJtjukU7Tc3Lkc-Q4fdSEk&libraries=places&callback=initAutocomplete"
        async defer></script>

        
	</body>
</html>