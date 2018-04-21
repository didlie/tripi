<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
	<head>
		<title>Tripi - Search</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	</head>
    <style >
        h6, p, a, img{
            max-width: 850px;
        }
        body{
            background-color: #f4c57a
        }
        .se-pre-con {
            position: fixed;
            left: 0px;
            top: 0px;
            width: 100%;
            height: 100%;
            z-index: 9999;
            background: url("img/loader-64x/Preloader_2.gif") center no-repeat #fff;
        }
        #map {
            height: 677px;
            width: 700px;
            margin-left: 578px;
            position: absolute;
            display: none;
       }
        #result2{
            width: 700px;
            height: 675px;
            overflow: auto;
            margin-left: 8px;
        }
        input[type=text] {
            background-color: #f4e8c8;
        }
        #choice {
            background-color: #f4e8c8;
        }
        #hideButton{
        	display: none;
        }

    </style>

	<body style = "background-image: url('./img/auth-bg.jpg'); background-size: cover;">
        
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="#">Tripi</a>
      <div class="search-field" style="margin-left: 40px;">
          <form onsubmit="return search();" action="#">
              <div class="form-row">
                <div class="col-4">
                  <input id="q" type="text" class="form-control" placeholder="Search Events/Accomodations">
                </div>
                <div class="col-2">
                  <input id="location" type="text" class="form-control" placeholder="Location">
                </div>
                <div class="col-3">
                  <input id="date" type="text" class="form-control" name="date" placeholder="YYYY-MM-DD" >
                </div>
              <div class="col-2">
                  <select id="choice" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                    <option value="1" selected>Events</option>
                    <option value="2">Places/Accommodations</option>
                  </select>
                </div>
                <div class="col-1 ">
                  <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </div>
            </form>
            <text id="error" style="color: red;"></text>
      </div>
      <a href="edit?id=<%= request.getParameter("id") %>">
      	<button type="button" class="btn btn-success" style="float: left; margin-left: 190px;">Back to your Itenary</button>
      </a> 
    </nav>

    <!-- results 
       <div id="result" class="container-fluid">
           
        </div>
    -->
    <div id="result" style="display: none;"></div>
     <div class="container">
            <div class="row">
                <div id="result2" class="col-md-6 scrollbar" style="display: none;">
                </div> 
                <div id="map" class="col-md-6"></div>
            </div>
        </div>
        
    <!-- scripts-->
                
        <script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        
        <script src="./js/searchEvent.js"></script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCmhYiSK8JgigmskxIU2uC3xw8Zk-TNbIw"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCEOE3jhPysVbJtjukU7Tc3Lkc-Q4fdSEk&libraries=places&callback=initAutocomplete"
        async defer></script>
        <!--for autocomplete date-->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
        <script>
            
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
	
            
    
    </script>
	</body>
</html>