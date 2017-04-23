angular.module('creativeRooms')
.controller('SearchCtrl', [
'$scope', 
'$timeout', 
'$log',
'$stateParams',
'$state',
'properties',
function($scope, $timeout, $log, $stateParams, $state, properties){
	$scope.searchString = $stateParams.searchString;
	var searchResults = properties.getSearchResults($scope.searchString);
	debugger
}]);