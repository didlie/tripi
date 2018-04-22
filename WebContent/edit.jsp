<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ page import="csci201.tripi.trips.Item" %> 
<%@ page import="java.util.List" %>
    
<!doctype html>

<html>
  <head>
    <title>Tripi - <%= request.getAttribute("title") %></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/trip.css">
  </head>
  
  <body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container">
        <a class="navbar-brand" href="./home.jsp">Tripi</a>
        
        <ul class="navbar-nav ml-auto">
          <%
          if (request.getSession().getAttribute("user_id") == null) {
            %>
               <li class="nav-item"><a class="nav-link" href="./login">Log In</a></li>
              <li class="nav-item"><a class="nav-link" href="./signup">Sign Up</a></li>
            <% } else {  %>
              <li class="nav-item"><a class="nav-link" href="./profile">Hello <%= request.getSession().getAttribute("displayname") %></a></li>
          <% } %>
        </ul>
      </div>
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
            	  String icon = "";
            	  
            	  if (i.getType().equals("hotel")) {
            		  icon = "<i class='fas fa-h-square icon'></i> ";
            	  } else if (i.getType().equals("place")) {
            		  icon = "<i class='fas fa-map-pin icon'></i> ";
            	  } else {
            		  icon = "<i class='fas fa-calendar icon'></i> ";
            	  }
              %>
              <div class="card trip-item" data-longitude="<%= i.getLongitude() %>" data-latitude="<%= i.getLatitude() %>" data-time="<%= i.getTime() %>" data-type="<%= i.getType() %>">
              <div class="card-body item-<%= i.getType() %>">
                <h5 class="card-title"><%= icon %><%= i.getTitle() %></h5>
                <h6 class="card-subtitle address"><%= i.getAddress() %></h6>
                <p class="card-text"><%= i.getDescription() %></p>
                
                <hr> 
                
                <h6 class="card-subtitle time"><%= i.getFormattedTime() %></h6>
                
                <% if (!i.getLink().trim().equals("")) { %>
                  <a href="<%= i.getLink() %>" class="card-link">See More</a>
                <% } %>
              </div>
            </div>
              <%
            }
            %>
            
            <div class="container">
            	<div class="row">
            		<a class="btn btn-primary col-md-2" href="#" id="addItemModalShow">Add Item</a>
            		<a class="btn btn-primary col-md-5" style="margin-left: 30px;" href="./searchEvent.jsp?id=<%= request.getAttribute("tripId") %>" >Find Event/Accommodations</a>
            	</div>
            </div>
          </div>
        </div>
      </div>      
    </div>
    
    <!-- Add Item Modal -->
    <div class="modal fade" id="addItemModal" tabindex="-1" role="dialog" aria-labelledby="addItemModal" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="addItemModalTitle">Add Trip Item</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <div class="alert alert-primary item-form-alert" role="alert">
						  You have entered invalid info! Please fill out all the required fields
						</div>

		        <form method="post" action="./edit/additem?id=<%= request.getAttribute("tripId") %>" name="addItemForm" id="addItemForm">
						  <div class="form-group">
						    <label>Title</label>
						    <input type="text" class="form-control" id="itemTitle" name="title" placeholder="The Eiffel Tower">
						  </div>
						  
						  <div class="form-group">
                <label>Description</label>
                <textarea class="form-control" id="itemDescription" name="description">A pretty tower in Paris, not many people know about it</textarea>
              </div>
              
              <div class="form-group">
                <label>Address</label>
                <input type="text" class="form-control" id="itemAddress" placeholder="5 Avenue Anatole, France, Paris" name="address">
                <input type="hidden" id="itemLatitude" name="latitude">
                <input type="hidden" id="itemLongitude" name="longitude">
              </div>
              
              <div class="form-group">
                <label>Date and Time (Format: MM/DD/YYYY HH:MM)</label><br>
                <input type="text" id="itemTime" class="form-control" data-format="YYYY-MM-DD HH:mm:00" data-template="MM / DD / YYYY     HH : mm" name="time">
              </div>
              
              <div class="form-group">
                <label>Type</label>
                
                <select class="form-control" id="itemType" name="type">
								  <option value="hotel">Hotel</option>
								  <option value="place">Place</option>
								  <option value="event">Event</option>
								</select>
              </div>
              
              <div class="form-group">
                <label>Link (Optional)</label>
                <input type="url" class="form-control" id="itemLink" placeholder="https://en.wikipedia.org/wiki/Eiffel_Tower" name="link">
              </div>
              
						  <button type="submit" class="btn btn-primary">Submit</button>
						</form>
		      </div>
		    </div>
		  </div>
		</div>
    
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.js"></script>
    <script src="./js/combodate.js"></script>
    <script src="./js/trip.js"></script>
    
    <script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
    <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB6J_Nh39Z6ExGReql27-RJv7wY8IjPLY8&libraries=places&callback=initMap">
      </script>
  </body>
</html>