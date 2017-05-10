angular.module('creativeRooms')
.controller('SearchCtrl', [
'$scope', 
'$timeout', 
'$log',
'$stateParams',
'$state',
'properties',
'$http',
function($scope, $timeout, $log, $stateParams, $state, properties,$http){
	$scope.searchString = $stateParams.searchString;
	$http.get('/search_results/' + $scope.searchString + '.json').then(function(data){
		debugger
        $scope.properties =  data.data;
    });	
    debugger
}]);