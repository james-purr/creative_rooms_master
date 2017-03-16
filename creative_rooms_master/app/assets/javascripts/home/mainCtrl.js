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
    $scope.googleMapsUrl = "https://maps.googleapis.com/maps/api/js?key=AIzaSyAzyjerX1bvtZ6Hgjn9fLOm0Le_eR4a888"
    debugger
}])