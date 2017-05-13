angular.module('creativeRooms')
.controller('MainCtrl', [
'$scope', 
'$timeout',  
'$log',
'properties',
'$state',
function($scope, $timeout, $log, properties, $state){

	$scope.search = function(term) {
		$state.go('search', { searchString: term });
	};	


}]);