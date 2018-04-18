
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
        
    function validateCreate() {
    		shortenPlace();
    		return true;
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

    var autocomplete;

	function initAutocomplete() {
        // Create the autocomplete object, restricting the search to geographical
        // location types.
        autocomplete = new google.maps.places.Autocomplete(
            /** @type {!HTMLInputElement} */(document.getElementById('placeInput')),
            {types: ['geocode']});
    }
	
	function shortenPlace(){
		var searchTerm = document.querySelector('#placeInput').value;
		searchTerm = searchTerm.trim();
		var place = autocomplete.getPlace();
		var short_name = place.address_components[0]["short_name"]	
		document.querySelector('#placeInput').value = short_name;
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
    