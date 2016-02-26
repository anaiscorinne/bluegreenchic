// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  $('.parallax').parallax();
	if ("geolocation" in navigator) {
		getUserLocation();
	}
	else {
		alert("Geolocation is not available.")
	}
});

// ----------------------------------------------

// function getUserLocation () {
// 	navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
// }

function successCallback (position) {
	var lat = position.coords.latitude
	var lng = position.coords.longitude
	var origin = (lat, lng)
	displayByClosest(origin);
}


function errorCallback (error) {
	console.log("Getting location failed:", error.message);
}

function displayMap(lat, lng) {
	var latitude = Number(lat);
	var longitude = Number(lng);
	var mapDiv = document.getElementById('map');
        var map = new google.maps.Map(mapDiv, {
          center: {lat: latitude, lng: longitude},
          zoom: 18
        });

}

function getUserLocation() {
  navigator.geolocation.getCurrentPosition(setGeoCookie);
}

function setGeoCookie(position) {
  var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
  document.cookie = "lat_lng=" + escape(cookie_val);
}








