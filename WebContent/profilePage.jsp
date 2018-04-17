<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Profile page</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
     <link href="css/profilePage.css" rel="stylesheet">
      
    <!--Font Awesome (added because you use icons in your prepend/append) -->
     <link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />
      

  </head>

	<script>

		    /* to change page without refreshing*/
		    function tripPage(){
		    document.getElementById('tripLink').classList.add('active');
		    document.getElementById('updateLink').classList.remove('active');
		    document.getElementById('createLink').classList.remove('active');
		    document.getElementById('updatePage').style.display = "none";
		    document.getElementById('createPage').style.display = "none";
		    document.getElementById('tripsPage').style.display = "block";
		  } 
		  function CreateTrip(){
		    document.getElementById('tripLink').classList.remove('active');
		    document.getElementById('updateLink').classList.remove('active');
		    document.getElementById('createLink').classList.add('active');
		    document.getElementById('tripsPage').style.display = "none";
		    document.getElementById('updatePage').style.display = "none";
		    document.getElementById('createPage').style.display = "block";
		  }      
		function update(){
		    document.getElementById('tripLink').classList.remove('active');
		    document.getElementById('updateLink').classList.add('active');
		    document.getElementById('createLink').classList.remove('active');
		    document.getElementById('tripsPage').style.display = "none";
		    document.getElementById('createPage').style.display = "none";
		    document.getElementById('updatePage').style.display = "block";
		  }
		    
		function validateCreate(){
		    var name = document.getElementById('nameInput');
		    var link = document.getElementById('linkInput');
		    var place = document.getElementById('placeInput');
		    var description = document.getElementById('descriptionInput');
		    var cityError = document.getElementById('cityError');
		    var dateError = document.getElementById('dateError');
		    var countryError = document.getElementById('countryError');
		    var cityEr = false;
		    var dateEr = false;
		    var countryEr = false;
		    
		    if(city.value === null || city.value.length <= 0){
		        cityError.innerHTML = "<strong>Please Enter City</strong>";
		        cityEr = true;
		    }
		    if(date.value === null || date.value.length <= 0){
		        dateError.innerHTML = "<strong>Please Enter Date!</strong>";
		        dateEr = true;
		    }
		    if(country.value === null || country.value.length <= 0){
		        countryError.innerHTML = "<strong>Please Enter Country!</strong>";
		        countryEr = true;
		    }
		    if(cityEr || dateEr || countryEr){
		        return false;
		    }
		    
		    //ajax call to get id
		    sendMessage(id, name, place, link, description);
		}
		
		function validateUpdate(){
		    var name = document.getElementById('nameInput');
		    var image = document.getElementById('imageUrl');
		    var password = document.getElementById('password');
		    var passwordError = document.getElementById('passwordError');
		    var passwordEr = false;
		    
		    if(name.value.length <= 0 && image.value.length <= 0 && password.value.length <= 0){
		        passwordError.innerHTML = "<strong>Please Enter Update</strong>";
		        passwordEr = true;
		    }
		    
		    if(passwordEr === true){
		        return false;
		    }
		    
		    return true;
		}
		
		
		    
		    /*for autocomplete date*/
		$(document).ready(function(){
			var date_input=$('input[name="date"]'); //our date input has the name "date"
			var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
			date_input.datepicker({
				format: 'mm/dd/yyyy',
				container: container,
				todayHighlight: true,
				autoclose: true,
			})
		})

	
		var socket;
		function connectToServer() {
			socket = new WebSocket("ws://localhost:8080/WebSockets/ws"); 
		
			socket.onmessage = function(event) {
				let message = JSON.parse(event.data); // assume event.data = {"message": "login", "user": "natalie"}

				if(message.message == "newI"){
					var htmlString = "<div class = 'result-blocks'><a href = 'view?id=" + message.id + "'><img class = 'result-img' src = '" + message.img;
					htmlString += "'> <div class = 'result-text'><h3>" + message.title + "</h3>" + message.details + "</div></a></div>";
					document.getElementById("results").innerHTML += htmlString;
				}
			}
		function sendMessage(var id, var name, var place, var link, var description) { //for when you make a newI
			event.data = {"message": "newI", "id": id, "place": place, "title": name, "img": link, "details": description};
			socket.send(event.data);
			return false; //because on submit, if true, will go to same page and reload the connectToServer, so return false so it doesnt submit
		} 
	</script>

  <body>

    <!-- header -->
		<header>
			
			<a href="home.html"><h1 id="logo-font"> TRIPI </h1></a>
			
			<div id="header-button-div">
				<a href="login.html">
					<button type="button" class="btn btn-light">Log Out</button>
				</a>
			</div>


		</header>

    <!-- Page Content -->
   	<div id="search-bar">

            <img id="profileImage" src="img/img4.jpg" width="200" height="200">
        
			<nav id="profileName" >
                <h3>${displayName}</h3>
			</nav>
			
     </div>
      
		<br style="clear: both;">
      

    <!-- navbar-->
        <nav id="myNavBar" class="navbar navbar-expand-lg navbar-dark bg-dark">
          <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
              <a id="tripLink" class="nav-item nav-link active center" onclick="tripPage();" href="javascript:void(0)">Your Trips </a>
                <div class="links">
              <a  id="createLink" class="nav-item nav-link center" onclick="CreateTrip();" href="javascript:void(0)">Create Trip</a>
                </div>
              <a id="updateLink" class="nav-item nav-link center" onclick="update();"  href="javascript:void(0)">Update Profile</a>

            </div>
          </div>
        </nav>
 
            
    <!-- content -->
        <div class="container" id="tripsPage">
        	<%
        		
        		ArrayList<String> photoLinks = (ArrayList<String>)request.getAttribute("photoLinks");
		 		ArrayList<String> descriptions = (ArrayList<String>)request.getAttribute("descriptions");
		 		ArrayList<String> titles = (ArrayList<String>)request.getAttribute("titles");
		 		ArrayList<String> mainPlaces = (ArrayList<String>)request.getAttribute("mainPlaces");
		 		
		 		for(int i = 0; i < photoLinks.size(); i++){
		 			if(i % 3 == 0){
		 				if(i > 0){
		 					out.println("</div>");
		 				}
		 				out.println("<div class=\"row\">");
		 			}
		 			out.println("<div id=\"search-results\" class=\"col-md-4\">");
		 			out.println("\t<div id=\"results\">");
		 			out.println("\t\t<div class=\"result-blocks\">");
		 			out.println("\t\t\t<a class=\"\" href=\"#\">");
		 			out.println("\t\t\t\t<img class=\"result-img\" src=\"" + photoLinks.get(i) + "\">");
		 			out.println("\t\t\t\t<div class=\"result-text\">");
		 			out.println("\t\t\t\t<h3>" + titles.get(i) + "</h3>");
		 			out.println("\t\t\t\t" + descriptions.get(i));
		 			out.println("\t\t\t\t</div>");
		 			out.println("\t\t\t</a>");
		 			out.println("\t\t</div>");
		 			out.println("\t</div>");
		 			out.println("</div>");
		 		
        		}
		 		
		 		out.println("</div>");
        	       	
        	%>
            
      </div>
      
      <!-- break page-->
      
      <div class="container" id="createPage" style="display: none;">
      
       <form name="createForm" onsubmit="return validateCreate();" action="#">
           <br>
          <div class="form-group">
            <span class="asteriskField">
            *
           </span>
            Enter Place:<br><br>
            <div  class="autocomplete">
                <input style="margin-left: 180px; width: 70%;" type="type" class="form-control" id="placeInput" name="country" placeholder="Enter place"/>
            </div>
          </div>
           <br>
            <div id="countryError" style="color: red;"></div>
           <br>
            <span class="asteriskField">
            *
           </span>
            Enter Name of Trip:<br><br>
            <input style="margin-left: 180px; width: 70%;" type="type" class="form-control" id="nameInput" name="city" placeholder="Enter name"/>
           <br>
            <div id="cityError" style="color: red;"></div>
           <br>
          <div class="form-group ">
          <label class="control-label  requiredField" for="date">
            <span class="asteriskField">
            *
           </span>
           Enter photo link:
          </label>
            <br><br>
            <input style="margin-left: 180px; width: 70%;" class="form-control" id="linkInput" name="date" placeholder="link" type="type"/>
           </div>

           <br>
            <div id="dateError" style="color: red;"></div>
           <br>
         <div class="form-group ">
          <label class="control-label">
           Write description:
          </label>
            <br><br>
            <input style="margin-left: 180px; width: 70%;" class="form-control" id="descriptionInput" name="date" placeholder="description" type="type"/>
           </div>
         <div class="form-group">
           <button class="btn btn-primary " name="submit" type="submit">
            Create
           </button>  
         </div>
           
        </form>
          
        
        <div style="margin-bottom: 100px;"></div>
      </div>
      
      <!-- break page-->
      
    <div class="container" id="updatePage" style="display: none;">
      
        <form name="updateForm" onsubmit="return validateUpdate();" action="#">
           <br>
          <div class="form-group">
            New Username:<br><br>
            <input style="margin-left: 180px; width: 70%;" type="type" class="form-control" id="nameInput" name="newName" placeholder="Enter a new Username"/>
          </div>
           <br>
            <div id="nameError" style="color: red;"></div>
           <br>
          <div class="form-group ">
           Profile Image Url:<br><br>
            <input style="margin-left: 180px; width: 70%;" class="form-control" id="imageUrl" name="imageUrl" placeholder="URL" type="type"/>
           </div>

           <br>
            <div id="urlError" style="color: red;"></div>
           <br>
            
          <div class="form-group ">
           New Password:<br><br>
            <input style="margin-left: 180px; width: 70%;" class="form-control" id="password" name="password" placeholder="password" type="type"/>
           </div>

           <br>
            <div id="passwordError" style="color: red;"></div>
           <br>
            
            
         <div class="form-group">
           <button class="btn btn-primary " name="submit" type="submit">
            Update
           </button>  
         </div>
           
        </form>
          
        
        <div style="margin-bottom: 100px;"></div>
      
      </div>
      
    <!-- /.container -->

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Include Date Range Picker -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
    <script src="js/profile.js"></script>  
    
  </body>

</html>