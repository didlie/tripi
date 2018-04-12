<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "jdbc.*, java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Itinerary Details</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/itinerary.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<header>	
		<a href="home.jsp"><h1 id="logo-font"> TRIPI </h1></a>
		<div id="search-bar">
			<nav id="search-nav" class="navbar navbar-light">

			  	<div class="search-field">
				    <input class="form-control mr-sm-2 search-input" type="search" 
				    	placeholder="Search Location" aria-label="Search" id="search-term">
				</div>
				<button class="btn btn-outline-success my-2 my-sm-0" onclick="search();">Search</button>
			 
			</nav> 

		</div>
		<div id="header-button-div">
			<a href="login.html">
				<button type="button" class="btn btn-light">Log In</button>
			</a>
			<a href="signup.html">
				<button type="button" class="btn btn-light">Sign Up</button>
			</a>
		</div>
	</header>
	<div id="background"></div>
	<div id="container">
		<div id="bg-img"></div>
		<div id="left-col">
			<h3>TITLE</h3>
			DESCRIPTION....
		</div>
		<div id="right-col">
			<div id="profile"></div>
			<br/>
			<div id="username">USERNAME</div>
		</div>

	</div> <!-- End container -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script type="text/javascript">
	
		<% 
		String trip_id = request.getParameter("id");
		System.out.println(trip_id);
		ArrayList<ArrayList<String>> stat = JDBCDriver.getATrip(trip_id);
		System.out.println("Here_ " + stat.size());
		
		%>

		
		var Trip_ID = "<%=stat.get(0).get(0)%>";
		var cover_photo_link = "<%=stat.get(0).get(1)%>";
		var title = "<%=stat.get(0).get(2)%>";
		var description = "<%=stat.get(0).get(3)%>";
		var main_place = "<%=stat.get(0).get(4)%>";
		var username = "<%=stat.get(0).get(5)%>";
		var profile_s = "<%=stat.get(0).get(6)%>";
		
		document.getElementById("background").style.backgroundImage = "url('"+ cover_photo_link + "')";
		document.getElementById("bg-img").style.backgroundImage = "url('"+ cover_photo_link + "')";
		var content = "<h3>" + title + "</h3>";
		content += description;
		document.getElementById("left-col").innerHTML = content;
		if(profile_s != null){
			document.getElementById("profile").style.backgroundImage = "url('"+ profile_s + "')";
		}
		
		document.getElementById("username").innerHTML = "@" + username;

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
		
	</script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCEOE3jhPysVbJtjukU7Tc3Lkc-Q4fdSEk&libraries=places&callback=initAutocomplete"
        async defer></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>

		


</body>
</html>