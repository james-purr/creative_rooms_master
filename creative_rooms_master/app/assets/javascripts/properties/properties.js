angular.module('creativeRooms')
.factory('properties', [
'$http', 
'$route',
function($http, $route){
	
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

	o.getSearchResults = function(){
		debugger		
		return $http.get('/search_results/' + term + '.json').then(function(data){
			debugger
	        angular.copy(data.data, o.searchResults);
	    });		
	};
	return o;
}])