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
     
      
    <!--Font Awesome (added because you use icons in your prepend/append) -->
     <link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />
     
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
	
	
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/semantic_block.css">
	<link href="css/profilePage.css" rel="stylesheet">
	
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
    	
    <!-- Profile BG -->
    <div id="profile-bg">
      <div id="profile-info">
          <img id="profileImage" src="${profileImage}" width="200" height="200">
       
            <h3>@${displayName}</h3>
           
        <div class="sidenav">
          <a id="tripLink" class="nav-item active sidebar" onclick="tripPage();" href="#">Your Trips </a>
            <div class="links">
          <a  id="createLink" class="nav-item sidebar" onclick="CreateTrip();" href="#">Create Trip</a>
            </div>
          <a id="updateLink" class="nav-item sidebar" onclick="update();"  href="#">Update Profile</a>

        </div>
    
           
    </div>
    <!-- navbar-->
    
    <br style="clear: both;">
    </div><!--End Profile bg-->
      
 
 
            
    <!-- content -->
      <div class="container" id="tripsPage">
          <div id="semantic-results"></div>	
      </div>
      
      <!-- break page-->
      
      <div class="container" id="createPage" style="display: none;">
      
       <form name="createForm" onsubmit="return validateCreate();" action="./create">
           <br>
          <div class="form-group">
            Place:<br><br>
            <div  class="autocomplete">
                <input style="margin-left: 180px; width: 70%;" type="text" class="form-control" id="placeInput" name="mainPlace" placeholder="New York, NY" required/>
            </div>
          </div>
           <br>
            <div id="countryError" style="color: red;"></div>
           <br>
            Trip Title:<br><br>
            <input style="margin-left: 180px; width: 70%;" type="text" class="form-control" id="titleInput" name="title" placeholder="Big Apple Tour" required/>
           <br>
            <div id="cityError" style="color: red;"></div>
           <br>
          <div class="form-group ">
          <label class="control-label  requiredField" for="date">
           Cover Photo Link:
          </label>
            <br><br>
            <input style="margin-left: 180px; width: 70%;" class="form-control" id="linkInput" name="coverPhotoLink" placeholder="http://cdn-image.travelandleisure.com/sites/default/files/styles/1600x1000/public/1444253482/DG2015-new-york.jpg?itok=neFmsUY1" type="text" required/>
           </div>

           <br>
            <div id="dateError" style="color: red;"></div>
           <br>
         <div class="form-group ">
          <label class="control-label">
           Description:
          </label>
            <br><br>
            <input style="margin-left: 180px; width: 70%;" class="form-control" id="descriptionInput" name="description" placeholder="Leisurely tour of New York City" type="text" required />
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
    
    <script>
        
      <%
        ArrayList<String> idLinks = (ArrayList<String>)request.getAttribute("ids");
        ArrayList<String> photoLinks = (ArrayList<String>)request.getAttribute("photoLinks");
        ArrayList<String> descriptions = (ArrayList<String>)request.getAttribute("descriptions");
        ArrayList<String> titles = (ArrayList<String>)request.getAttribute("titles");
        ArrayList<String> mainPlaces = (ArrayList<String>)request.getAttribute("mainPlaces");
      %>
      	var content = "";
        <% for(int i = 0; i < photoLinks.size(); i++){
        %>
	         var id = "<%=idLinks.get(i)%>";
	         var img_link = "<%=photoLinks.get(i)%>";
	         var title = "<%=titles.get(i)%>";
	         var description = "<%=descriptions.get(i)%>";
	         var main_place = "<%=mainPlaces.get(i)%>";
	         
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
			document.getElementById('semantic-results').innerHTML = "You don't have any Trips Yet!";
		}          
   

    </script>
    <!-- Google Maps -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCEOE3jhPysVbJtjukU7Tc3Lkc-Q4fdSEk&libraries=places&callback=initAutocomplete" async defer></script>
    
    
  </body>

</html>