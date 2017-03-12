angular.module('creativeRooms', ['ui.router', 'templates', 'Devise', 'ngSanitize', 'ui.select', 'ngMaterial'])
.config([
	'$stateProvider',
	'$urlRouterProvider',
	'$locationProvider',
	function($stateProvider, $urlRouterProvider, $locationProvider) {
	$stateProvider
	    .state('home', {
	      url: '/home',
		  templateUrl: 'home/_home.html',
	      controller: 'MainCtrl',
	      resolve: {
	        propertyFeaturedPromise: ['posts', function(posts){
	          return properties.getFeatured();
	        }]
	      },
	    })
	    .state('login', {
	      onEnter: ['$state', 'Auth', function($state, Auth) {
	        Auth.currentUser().then(function (){
	          $state.go('home');
	        })
	      }],
	      url: '/login',
	      templateUrl: 'auth/_login.html',
	      controller: 'AuthCtrl'
	    })
	    .state('register', {
	      onEnter: ['$state', 'Auth', function($state, Auth) {
	        Auth.currentUser().then(function (){
	          $state.go('home');
	        })
	      }],
	      url: '/register',
	      templateUrl: 'auth/_register.html',
	      controller: 'AuthCtrl'
	    });
	$urlRouterProvider.otherwise(function($injector) {
		var $state = $injector.get('$state');
		$state.go('home');
	});
	$locationProvider.html5Mode({
		enabled: true,
		requireBase: false
	});
}])