angular.module('creativeRooms')
.controller('RoomCtrl', [
'$scope', 
'$stateParams',
'$state',
'$http',
'NgMap',
'$rootScope',
'Auth',
function($scope, $stateParams, $state, $http, NgMap, $rootScope, Auth){
	var roomId = $stateParams.roomId;
	var user = $rootScope.user;
	$http.get('/rooms/' + roomId + '.json').then(function(data){
		$scope.room = data.data;
		$scope.interests = Object.values($scope.room.owner_interests);
		$scope.images = data.data.images;
		$rootScope.viewData = $scope.images;
		$scope.options = {
	    	applyClass: 'btn-green',
	    	locale: {
	    		applyLabel: "Select",
	        	fromLabel: "From",
	        	format: "YYYY-MM-DD", 
	        	toLabel: "To",
	        	cancelLabel: 'Cancel',
	      	},
	      	minDate: moment(),
	      	minDate: new Date,
	      	// THIS IS WHERE YOU'D GET THE DATES YOU CAN'T USE
			isInvalidDate: function (date) {
			    var formatted = date.format('MM/DD/YYYY');
			    return ["05/22/2017","05/23/2017"].indexOf(formatted) > -1;
			},
		};

	    $scope.slickPanels = {
	      method: {},
	      dots:false,
	      infinite: false,
	      speed: 300,
	      slidesToShow: 1,
	      lazyLoad: 'ondemand',
	      slidesToScroll: 1,
	      autoPlay: false,
	      adaptiveHeight: true,
	      arrows: true,
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

	$scope.requestBooking = function(passedScope, room){
		if(passedScope.user){
			// grab the selected date information and pass it up to the booking controllers
			var config = {
			    params: {
			        startDate: passedScope.date.startDate["_d"],
			        endDate: passedScope.date.endDate["_d"],
			        room: room,
			    }
			}
			debugger
			$http.get('/booking-request', config).then(function(data){
				debugger
			});
		}else{
			// go to login/register page - change to modal
		}
	}
}]);