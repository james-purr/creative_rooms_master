angular.module('creativeRooms')
.controller('SearchCtrl', [
'$scope', 
'$timeout', 
'$log',
'$stateParams',
'$state',
function($scope, $timeout, $log, $stateParams, $state){
	$scope.searchString = $stateParams.searchString;
	debugger
}]);