angular.module('creativeRooms')
.controller('RoomCtrl', [
'$scope', 
'$stateParams',
'$state',
'$http',
'NgMap',
function($scope, $stateParams, $state, $http, NgMap){
	var roomId = $stateParams.roomId;
	$http.get('/rooms/' + roomId + '.json').then(function(data){
		debugger
	});
}]);