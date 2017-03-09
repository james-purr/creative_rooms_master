angular.module('creativeRooms')
.controller('AuthCtrl', [
'$scope',
'$state',
'Auth',
function($scope, $state, Auth){
    $scope.errors = null;
    $scope.itemArray = [
        {id: 0, name: 'Homeowner'},
        {id: 1, name: 'Artist'},
    ];
    $scope.hello = "hello"

    $scope.selected = { value: $scope.itemArray[0] };
    
  $scope.login = function() {
    Auth.login($scope.user).then(function(){
      $state.go('home');
    });
  };

  $scope.register = function() {

    $scope.user.role_enum = $scope.user.role_enum.id
    Auth.register($scope.user)
    .then(function(){ 
      $state.go('home');
    })
    .catch(function (data) {
        var error = "";
        for (var i = 0; i < Object.keys(data.data.errors).length; i++) {
          var key = Object.keys(data.data.errors)[i]
          error = error + key.replace("_", " ") + " " + data.data.errors[key]
        };
        $scope.errors = error;
    });

  };
}]);