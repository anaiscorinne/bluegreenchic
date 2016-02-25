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

function getUserLocation () {
	navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
}

function successCallback (position) {
	var lat = position.coords.latitude
	var lng = position.coords.longitude

	// displayMap(latitude, longitude);
	// console.log("Lat:", position.coords.latitude);
	// console.log("Long:", position.coords.longitude);
	// $(".js-lat-value").text(position.coords.latitude);
	// $(".js-lng-value").text(position.coords.longitude);
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

