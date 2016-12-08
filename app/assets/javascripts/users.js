
window.onload = function(){
	var map;
	var marker;

	// $('#piggy').on ('click', function(event) {
	// 	event.preventDefault();
	// 	var searchTerm = $('#input-search').val();
	// 	var myUrl = "/users/bookings";
	// 	$.ajax ({
	// 		type: "GET",
	// 		url: myUrl,
	// 		success: ,
	// 		error: onError
	// 	});
	// });


		if ("geolocation" in navigator){
		  navigator.geolocation.getCurrentPosition(onLocation, onError);
		}

		function onLocation(position){

		  var myPosition = {
		    lat: position.coords.latitude,
		    lng: position.coords.longitude
		  };

		  createMap(myPosition);
		  setupAutocomplete();
			}

		function onError(err){
		  console.log("What are you using, IE 7??", err);
		}
		

		function createMap(position){
		  var mapOptions = {
		    center: position,
		    zoom: 15
		  };

		  map = new google.maps.Map($('#map')[0], mapOptions);
		  createMarker(position);

		}

		function createMarker(position) {
		  var marker = new google.maps.Marker({
		    position: position,
		    map: map 
		  })	
		
		}

		function setupAutocomplete(){
		  var input = $('#get-places')[0];
		  var autocomplete = new google.maps.places.Autocomplete(input);

		  autocomplete.addListener('place_changed', function(){

		    var place = autocomplete.getPlace();
		    if (place.geometry.location) {
		      map.setCenter(place.geometry.location);
		      createMarker(place.geometry.location);
		      map.setZoom(12);   

		    } else {
		      alert("The place has no location...?")
		    }


				var locations = [];
					locations.push ( {latlng: new google.maps.LatLng(40.419989, -3.688194)});
					locations.push ( {latlng: new google.maps.LatLng(40.429989, -3.688194)});
					locations.push ( {latlng: new google.maps.LatLng(40.452191, -3.687864)});
					locations.push ( {latlng: new google.maps.LatLng(40.433290,	-3.686585)});
					locations.push ( {latlng: new google.maps.LatLng(40.416729,	-3.703817)});
					locations.push ( {latlng: new google.maps.LatLng(40.415768,	-3.713479)});
					locations.push ( {latlng: new google.maps.LatLng(40.430968,	-3.683810)});
					locations.push ( {latlng: new google.maps.LatLng(40.433794,	-3.691406)});
					locations.push ( {latlng: new google.maps.LatLng(40.407529,	-3.690567)});
					locations.push ( {latlng: new google.maps.LatLng(40.451237,	-3.698281)});
					locations.push ( {latlng: new google.maps.LatLng(40.417644,	-3.700006)});
					locations.push ( {latlng: new google.maps.LatLng(40.466755,	-3.688540)});
					locations.push ( {latlng: new google.maps.LatLng(40.427217,	-3.696137)});
					locations.push ( {latlng: new google.maps.LatLng(40.419385,	-3.692875)});
					locations.push ( {latlng: new google.maps.LatLng(40.413921,	-3.692116)});
					locations.push ( {latlng: new google.maps.LatLng(40.401888,	-3.720646)});

				var deliveryLocations = randomLocations(locations);
				console.log(deliveryLocations);
				
				

				
				var bounds= new google.maps.LatLngBounds();

				for (var i=0; i<deliveryLocations.length;i++){
					var marker = new google.maps.Marker({position:deliveryLocations[i].latlng, map:map});
					bounds.extend(deliveryLocations[i].latlng);
				}
				 map.fitBounds(bounds);


		  });

		}

		function randomLocations(locations){

	    for (var i = locations.length - 1; i > 0; i--) {
	        var j = Math.floor(Math.random() * (i + 1));
	        var temp = locations[i];
	        locations[i] = locations[j];
	        locations[j] = temp;
			}
			return locations.slice(0,6);
		}
		

}