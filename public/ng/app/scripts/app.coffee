'use strict'

@painSquad = angular.module 'painSquad', [
  'ionic',
  'painSquad.controllers',
  'painSquad.directives',
  'painSquad.resources',
  'painSquad.services',
  'painSquad.filters',
  'painSquad.config',
  'ngResource',
  'ngCookies',
  'ngSanitize',
  'underscore'
]

@controllerModule = angular.module 'painSquad.controllers', []
@directiveModule  = angular.module 'painSquad.directives', []
@resourceModule   = angular.module 'painSquad.resources', []
@serviceModule    = angular.module 'painSquad.services', []
@filterModule     = angular.module 'painSquad.filters', []
@configModule     = angular.module 'painSquad.config', []

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

  .state('app.checklist-detail'
    url: '/surveys/checklist/detail/:choice'
    views:
      menuContent:
        templateUrl: 'templates/surveys/question_types/checklist-detail.html'
        controller: 'ChecklistDetailCtrl'
  )

  .state('app.survey_complete'
    url: '/surveys/complete'
    views:
      menuContent:
        templateUrl: 'templates/surveys/complete.html'
        controller: 'CompleteSurveyCtrl'
  )

@painSquad.run ($ionicPlatform, $rootScope, $state, $stateParams) ->
  $rootScope.$state       = $state
  $rootScope.$stateParams = $stateParams
  $rootScope.$on "$stateChangeSuccess", (event, toState, toParams, fromState, fromParams) ->
    # to be used for back button *won't work when page is reloaded.
    $rootScope.previousState_name   = fromState.name
    $rootScope.previousState_params = fromParams

  #back button function called from back button's ng-click="back()"
  $rootScope.back = ->
    $state.go $rootScope.previousState_name, $rootScope.previousState_params

  $ionicPlatform.ready ->
    StatusBar.styleDefault() if window.StatusBar