angular.module('creativeRooms')
.controller('RoomCtrl', [
'$scope', 
'$stateParams',
'$state',
'$http',
'NgMap',
'$rootScope',
function($scope, $stateParams, $state, $http, NgMap, $rootScope){
	var roomId = $stateParams.roomId;
	$http.get('/rooms/' + roomId + '.json').then(function(data){
		$scope.room = data.data;
		$scope.images = data.data.images;
		$rootScope.viewData = $scope.images;

	    $scope.slickPanels = {
	      method: {},
	      dots:true,
	      infinite: false,
	      speed: 300,
	      slidesToShow: 1,
	      lazyLoad: 'ondemand',
	      slidesToScroll: 1,
	      autoPlay: false,
	      adaptiveHeight: true,
	      event: {
	        beforeChange: function() {
	          console.log("before change called");
	        },
	        afterChange: function() {
	          console.log("after called");
	        }
	      }
	    };
	    $rootScope.updateView = function() {
	      $rootScope.viewLoaded = false;
	      $rootScope.viewData.push({
	        text: "My View" + $rootScope.viewData.length
	      });
	      $timeout(function() {
	        $rootScope.viewLoaded = true;
	      });
	    };
	    $rootScope.viewLoaded = true;
	});
}]);