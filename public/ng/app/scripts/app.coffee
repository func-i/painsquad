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
  'underscore',
  'angularMoment'
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

    # abstract sidemenu state/template
    .state('app',
      url: '/app'
      abstract: true
      templateUrl: 'templates/layout/menu.html'
    )

    # root template 1
    .state('app.login'
      url: '/login'
      views:
        menuContent:
          templateUrl: 'templates/shared/login.html'
          controller: 'LoginCtrl'
    )

    # root template 2
    .state('app.home'
      url: '/home'
      views:
        menuContent:
          templateUrl: 'templates/shared/home.html'
          controller: 'HomeCtrl'
    )

    # pain-case template - render individual questions as partials
    .state('app.new_survey'
      url: '/surveys/new'
      views:
        menuContent:
          templateUrl: 'templates/surveys/new.html'
          controller: 'SurveyCtrl'
          resolve: SurveyCtrl.resolve
    )

    # temporary state - REMOVE DIS
    .state('app.survey_complete'
      url: '/surveys/complete'
      views:
        menuContent:
          templateUrl: 'templates/surveys/complete.html'
          controller: 'CompleteSurveyCtrl'
    )


    # achievements state
    .state('app.achievements'
      url: '/achievements'
      views:
        menuContent:
          templateUrl: 'templates/achievements/main.html'
          controller: 'AchievementsCtrl'
    )

    # advice state
    .state('app.advice'
      url: '/advice'
      views:
        menuContent:
          templateUrl: 'templates/advice/main.html'
          controller: 'AdviceCtrl'
    )

      # advice -> recommended state
      .state('app.recommended'
        url: '/recommended'
        views:
          menuContent:
            templateUrl: 'templates/advice/recommended.html'
            controller: 'AdviceCtrl'
      )

      # advice -> favorites state
      .state('app.favorites'
        url: '/favorites'
        views:
          menuContent:
            templateUrl: 'templates/advice/favorites.html'
            controller: 'AdviceCtrl'
      )

      # advice -> prevent pain state
      .state('app.prevent'
        url: '/prevent'
        views:
          menuContent:
            templateUrl: 'templates/advice/prevent.html'
            controller: 'AdviceCtrl'
      )

      # advice -> manage pain state
      .state('app.manage'
        url: '/manage'
        views:
          menuContent:
            templateUrl: 'templates/advice/manage.html'
            controller: 'AdviceCtrl'
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