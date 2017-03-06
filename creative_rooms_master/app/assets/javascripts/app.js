angular.module('creativeRooms', ['ui.router', 'templates', 'Devise'])
.config([
	'$stateProvider',
	'$urlRouterProvider',
	'$locationProvider',
	function($stateProvider, $urlRouterProvider, $locationProvider) {

	$locationProvider.html5Mode({
		enabled: true,
		requireBase: false
	});
}])