angular.module('creativeRooms')
.controller('SearchCtrl', [
'$scope', 
'$timeout', 
'$log',
'$stateParams',
'$state',
'$q',
'properties',
function($scope, $timeout, $log, $stateParams, $state, $q, properties){
	$scope.searchString = $stateParams.searchString;
	$q.all([
	      properties.getSearchResults($scope.searchString),
	    ]).then(function(data){
	      debugger
	 });
}]);