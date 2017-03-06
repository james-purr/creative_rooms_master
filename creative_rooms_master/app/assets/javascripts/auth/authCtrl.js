angular.module('creativeRooms')
.controller('AuthCtrl', [
'$scope',
'$state',
'Auth',
function($scope, $state, Auth){
    $scope.itemArray = [
        {id: 0, name: 'Homeowner'},
        {id: 1, name: 'Artist'},
    ];

    $scope.selected = { value: $scope.itemArray[0] };
    
  $scope.login = function() {
    Auth.login($scope.user).then(function(){
      $state.go('home');
    });
  };

  $scope.register = function() {

    $scope.user.role_enum = $scope.user.role_enum.id
    Auth.register($scope.user).then(function(){
      $state.go('home');
    });

  };
}]);