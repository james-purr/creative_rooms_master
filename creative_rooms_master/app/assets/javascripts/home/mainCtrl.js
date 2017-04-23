angular.module('creativeRooms')
.controller('MainCtrl', [
'$scope', 
'$timeout',  
'$log',
'properties',
'$state',
'NgMap',
function($scope, $timeout, $log, properties, $state, NgMap){

	$scope.search = function(term) {
		$state.go('search', { searchString: term });
	};	


}]);