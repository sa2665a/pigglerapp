// var current_marker;
// var geocodeLatLng = function(map, latlng) {
//   geocoder.geocode({'position': latlng}, function(results, status) {
//     if (status === google.maps.GeocoderStatus.OK) {
//       if (results[1]) {
//         current_marker = new google.maps.Marker({
//           position: latlng,
//           animation: google.maps.Animation.DROP,
//           map: map
//         });

//         document.getElementById('source').value = results[1].formatted_address;
//         source_place_id = results[1].place_id;
//         source_location = latlng.lat() + ',' + latlng.lng();

//       } else {
//         window.alert('No results found');
//       }
//     } else {
//       window.alert('Geocoder failed due to: ' + status);
//     }
//   });
// }