angular.module('creativeRooms')
.factory('properties', [
'$http', 
function($http){
	
	var o = {
		featuredProperties: [],
		comments: [],
		searchResults: [],
	};
	o.getFeatured = function() {
		return $http.get('/featured_properties.json').then(function(data){
	        angular.copy(data.data, o.featuredProperties);
	    });
	};

	o.getSearchResults = function(term){

// return $.ajax({
//     url: "http://services.gisgraphy.com//geocoding/geocode?address=" + reg + "&country=" + cntry_code + "&format=json",
//     async: false,
//     dataType: 'jsonp',
//     success: function (data) {
//            var lat = data.result[0].lat;
//            console.log(lat);
//            var lng = data.result[0].lng;
//            console.log(lng);
//        }
// });	
		// $http.get('/someUrl').then(successCallback, errorCallback);
		return $http.get("http://services.gisgraphy.com//geocoding/geocode?address=%22" + term + "%22&format=json", {dataType: 'jsonp'}).then(function(data){
			debugger
	        angular.copy(data.data, o.searchResults);
	    });		
	}
	return o;
}])