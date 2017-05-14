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
    });	
    $scope.highlightOnMap = function(e){
    	debugger
    };

    $scope.normalIcon = function() {
      return 'http://www.iconsdb.com/icons/preview/color/B2E87B/marker-xxl.png';
    };

    $scope.highlightlIcon = function() {
      return {
        url: 'http://www.iconsdb.com/icons/preview/color/009E4A/marker-xxl.png'
      };
    }

}]);