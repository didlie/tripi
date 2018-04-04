
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
        var city = document.getElementById('cityInput');
        var date = document.getElementById('dateInput');
        var country = document.getElementById('countryInput');
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
    