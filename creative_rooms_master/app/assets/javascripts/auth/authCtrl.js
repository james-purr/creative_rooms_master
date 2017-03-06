angular.module('creativeRooms')
.controller('AuthCtrl', [
'$scope',
'$state',
'Auth',
function($scope, $state, Auth){
  $scope.login = function() {
    Auth.login($scope.user).then(function(){
      $state.go('home');
    });
  };

  $scope.register = function() {
    $scope.user.role_enum = parseInt($scope.user.role_enum)
    Auth.register($scope.user).then(function(){
      $state.go('home');
    });
  };
}]);