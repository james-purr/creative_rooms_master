angular.module('creativeRooms')
.controller('NavCtrl', [
'$scope',
'Auth',
'$rootScope',
function($scope, Auth, $rootScope){
	$scope.signedIn = Auth.isAuthenticated;
	$scope.logout = Auth.logout;

	Auth.currentUser().then(function (user){
		$scope.user = user;
	});
	$scope.$on('devise:new-registration', function (e, user){
		debugger
		$rootScope.user = user
		$scope.user = user;
	});

	$scope.$on('devise:login', function (e, user){
		debugger
		$rootScope.user = user
		$scope.user = user;
	});

	$scope.$on('devise:logout', function (e, user){
		$scope.user = {};
	});
}]);