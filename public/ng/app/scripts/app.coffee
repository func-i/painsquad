'use strict'

@painSquad = angular.module 'painSquad', [
  'ionic',
  'painSquad.controllers',
  'painSquad.services',
  'ngResource',
  'ngCookies',
  'ngSanitize'
]

@controllerModule = angular.module 'painSquad.controllers', []
@serviceModule    = angular.module 'painSquad.services', []
@configModule     = angular.module 'painSquad.config', []
# @directiveModule  = angular.module 'painSquad.directives', []
# @filterModule     = angular.module 'painSquad.filters', []

interceptor = ["$location", "$q", "$injector", ($location, $q, $injector) ->
    success = (response) ->
      response
    error = (response) ->
      if response.status is 401
        $injector.get("$state").transitionTo "login"
        $q.reject response
      else
        $q.reject response
    return (promise) ->
      promise.then success, error
]

@painSquad.config ($urlRouterProvider, $stateProvider, $compileProvider, $httpProvider) ->
  $compileProvider.aHrefSanitizationWhitelist /^\s*(https?|ftp|mailto|file|tel):/
  # $httpProvider.responseInterceptors.push(interceptor);
  $urlRouterProvider.otherwise "/app/home"

  $stateProvider

  .state('app',
    url: '/app'
    abstract: true
    templateUrl: 'templates/menu.html'
  )

  .state('app.home'
    url: '/home'
    views:
      menuContent:
        templateUrl: 'templates/home.html'
        controller: 'MainCtrl'
  )

  .state('app.case',
    url: '/case'
    views:
      menuContent:
        templateUrl: 'templates/case/case.html'
        controller: 'CaseCtrl'
  )

@painSquad.run ($ionicPlatform) ->
  $ionicPlatform.ready ->
    StatusBar.styleDefault()  if window.StatusBar
