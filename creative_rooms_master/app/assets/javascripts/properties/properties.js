angular.module('creativeRooms')
.factory('properties', [
'$http', 
function($http){
	
	var o = {
		featuredProperties: [],
		comments: [],
	};
	o.getFeatured = function() {
		return $http.get('/featured_properties.json').then(function(data){
	        angular.copy(data.data, o.featuredProperties);
	    });
	};
	return o;
}])