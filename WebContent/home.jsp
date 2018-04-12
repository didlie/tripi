<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "jdbc.*, java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<title>TRIPI Home</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link rel="stylesheet" href="css/home.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>
	
	<body>
		<header>
			
			<a href="home.jsp"><h1 id="logo-font"> TRIPI </h1></a>
			
			<div id="header-button-div">
				<a href="login.html">
					<button type="button" class="btn btn-light">Log In</button>
				</a>
				<a href="signup.html">
					<button type="button" class="btn btn-light">Sign Up</button>
				</a>
			</div>


		</header>

		<div id="search-bar">

			<nav id="search-nav" class="navbar navbar-light bg-light">

			  <!-- <form class="form-inline"> -->
			  	<h2>Inspire Your Next Trip </h2> <br/>
			  	<div class="search-field">
				    <input class="form-control mr-sm-2 search-input" type="search" 
				    	placeholder="Search Location" aria-label="Search" id="search-term">
				    <button class="btn btn-outline-success my-2 my-sm-0" onclick="search();">Search</button>
				</div>
			 <!--  </form> -->
			 
			</nav>
			
		</div>
		<br style="clear: both;">


		<div id="search-results">
			<div class="search-place">
				<h2><span style="color: black;"> Trips for you in </span>
					<span id="result-search-term">Los Angeles</span></h2>
			</div>
			
			
			
			<div id="results">
				<div class="result-blocks">
					<a href="#">
						<img  class="result-img" src="img/img1.jpg">
						<div class="result-text">
							<h3>Trip Title</h3>
							Trip Details... 
							I enjoyed a cruise in the Norwegian fjords, had a dinner 327 meters underground at Wieliczka salt mine in Krakow, felt sad at the Auschwitz concentration camps in Poland, waited for a delayed train in snowy 
						</div>
					</a>
				</div>
			</div>


			<br style="clear: both;">
		</div>
		
		
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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
				var place = autocomplete.getPlace();
				var short_name = place.address_components[0]["short_name"]	
				window.location.href = "home.jsp?place=" + encodeURI(short_name);
			}// End function search
			
			<%	
			// Connect to database and get search results
			if(request.getParameter("place") != null){
				String place = request.getParameter("place");
			%>
			document.querySelector('#result-search-term').innerHTML = "<%=place%>";
			<%
				System.out.println("Seraching for a place..." + request.getParameter("place") );
				ArrayList<ArrayList<String>> stat = JDBCDriver.searchPlace(place);
				System.out.println("size: " + stat.size());
				
				request.setAttribute("list", stat);	
				
				// Display the stats
				int result_size = stat.size();
				if(result_size > 12){
					result_size = 12;
				} %>
				
				var content = "";
				
				<%for(int i = 0; i < result_size; i++){ %>
					var id = "<%=stat.get(i).get(0)%>";
					var img_link = "<%=stat.get(i).get(1)%>";
					var title = "<%=stat.get(i).get(2)%>";
					var description = "<%=stat.get(i).get(3)%>";
					content += '<div class="result-blocks">';
					content += '<a href="itinerary.jsp?id='+ id +'">';
					content += '<img  class="result-img" src="'+ img_link +'">';
					content += '<div class="result-text">';
					content += '<h3>'+ title +'</h3>';
					content += description;
					content += '</a>';
					content += '</div>';
					content += '</div>';
				<%}%>
				
				content += '<br style="clear: both;">';
				if(content != ""){
					document.getElementById('results').innerHTML = content;
				}else{
					document.getElementById('results').innerHTML = "No Results Found!";
				}
			<%}%>// End if place not null
		
		</script>
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCEOE3jhPysVbJtjukU7Tc3Lkc-Q4fdSEk&libraries=places&callback=initAutocomplete"
        async defer></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
        
	</body>
</html>