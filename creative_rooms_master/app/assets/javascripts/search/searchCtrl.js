angular.module('creativeRooms')
.controller('SearchCtrl', [
'$scope', 
'$timeout', 
'$log',
'$stateParams',
'$state',
'properties',
'$http',
'NgMap',
function($scope, $timeout, $log, $stateParams, $state, properties,$http,NgMap){
	$scope.searchString = $stateParams.searchString;
	$http.get('/search_results/' + $scope.searchString + '.json').then(function(data){
        $scope.properties =  data.data[0];
        $scope.properties = Object.keys($scope.properties).length ? $scope.properties : null

        $scope.noProperties = $scope.properties ? null : 'No rooms found for ' + $scope.searchString + '. Try searching again or get notified when rooms in ' + $scope.searchString + ' become available.'
        $scope.mapCenter = data.data[1];
        $scope.markers = {};
		angular.forEach($scope.properties, function(value, key){
			$scope.markers[value.id] = {position: value.position, icon: $scope.normalIcon()};
		});
    });	
    $scope.highlightOnMap = function(passedScope, id){
    	passedScope.markers[id]["icon"] = $scope.highlightlIcon();	
    };
    $scope.removeHighlightOnMap = function(passedScope, id){
    	passedScope.markers[id]["icon"] = $scope.normalIcon();	
    };

    $scope.normalIcon = function() {
      return 'http://i.imgur.com/21xqxv7.png';
    };

    $scope.highlightlIcon = function() {
      return 'http://i.imgur.com/E9zbxLQ.png';
    }

}]);