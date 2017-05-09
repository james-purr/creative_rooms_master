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

	o.getSearchResults = function(route){
		debugger
		$http.get('/search_results/' + term + '.json').then(function(data){
	        debugger
	        return data.data
	    });		
	}
	return o;
}])