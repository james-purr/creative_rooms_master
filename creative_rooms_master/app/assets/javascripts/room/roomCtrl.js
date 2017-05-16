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
		$scope.room = data.data;
		$scope.images = data.data.images;
	});
	$scope.slickConfig = {
	    enabled: true,
	    autoplay: true,
	    draggable: false,
	    autoplaySpeed: 3000,
	    method: {},
	    event: {
	        beforeChange: function (event, slick, currentSlide, nextSlide) {
	        },
	        afterChange: function (event, slick, currentSlide, nextSlide) {
	        }
	    }
	};
}]);