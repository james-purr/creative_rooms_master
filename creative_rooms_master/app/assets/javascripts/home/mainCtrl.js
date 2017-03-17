angular.module('creativeRooms')
.controller('MainCtrl', [
'$scope', 
'$timeout', 
'$mdSidenav', 
'$log',
'properties',
'NgMap',
function($scope, $timeout, $mdSidenav, $log, properties, NgMap){
    $scope.featuredProperties = properties.featuredProperties
}])