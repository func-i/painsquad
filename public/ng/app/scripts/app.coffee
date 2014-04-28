'use strict'

@painSquad = angular.module 'painSquad', [
  'ionic',
  'painSquad.controllers',
  'painSquad.resources',
  'painSquad.services',
  'painSquad.config',
  'ngResource',
  'ngCookies',
  'ngSanitize',
  'underscore'
]

@controllerModule = angular.module 'painSquad.controllers', []
@resourceModule   = angular.module 'painSquad.resources', []
@serviceModule    = angular.module 'painSquad.services', []
@directiveModule  = angular.module 'painSquad.directives', []
@configModule     = angular.module 'painSquad.config', []
@filterModule     = angular.module 'painSquad.filters', []

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
  # $httpProvider.responseInterceptors.push(interceptor)
  $urlRouterProvider.otherwise "/app/home"

  $stateProvider
  .state('app',
    url: '/app'
    abstract: true
    templateUrl: 'templates/menu.html'
  )

  .state('app.login'
    url: '/login'
    views:
      menuContent:
        templateUrl: 'templates/login.html'
        controller: 'LoginCtrl'
  )

  .state('app.home'
    url: '/home'
    views:
      menuContent:
        templateUrl: 'templates/home.html'
        controller: 'HomeCtrl'
  )

  .state('app.new_survey'
    url: '/surveys/new'
    views:
      menuContent:
        templateUrl: 'templates/surveys/new.html'
        controller: 'SurveyCtrl'
        resolve: SurveyCtrl.resolve
  )

  .state('app.survey_complete'
    url: '/surveys/complete'
    views:
      menuContent:
        templateUrl: 'templates/surveys/complete.html'
        controller: 'CompleteSurveyCtrl'
  )

@painSquad.run ($ionicPlatform) ->
  $ionicPlatform.ready ->
    StatusBar.styleDefault() if window.StatusBar