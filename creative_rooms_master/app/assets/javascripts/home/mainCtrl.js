angular.module('creativeRooms')
.controller('MainCtrl', [
'$scope', 
'$timeout', 
'$mdSidenav', 
'$log',
'properties',
function($scope, $timeout, $mdSidenav, $log, properties){
    $scope.featuredProperties = properties.featuredProperties
}])