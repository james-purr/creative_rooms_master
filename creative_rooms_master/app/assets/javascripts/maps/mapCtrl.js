angular.module('creativeRooms')
.controller('MapCtrl', [
'$scope', 
'properties',
'NgMap',
function($scope, properties, NgMap){
    $scope.featuredProperties = properties.featuredProperties

}])