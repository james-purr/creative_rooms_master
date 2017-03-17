angular.module('creativeRooms')
.controller('MapCtrl', [
'$scope', 
'properties',
'NgMap',
function($scope, properties, NgMap){
	// function to get properties(just postcodes) within bounds of map
	// need to get bounds, and pass that to the factory function so it knows the coordinates to look within
	// either convert postcodes to lat/lng objects in ruby, or do it in the factory. We basically need a list of lat/lng coordinates to return here
	// limit the query to 20 properties at a time maybe? Think of ways to limit the load time to get the properties

}])