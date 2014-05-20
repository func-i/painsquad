'use strict'

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

    # STATIC CONTENT
    # about state
    .state('app.about'
      url: '/about'
      views:
        menuContent:
          templateUrl: 'templates/static/about.html'
    )

    # acknowledgements
    .state('app.acknowledgements'
      url: '/acknowledgements'
      views:
        menuContent:
          templateUrl: 'templates/static/acknowledgements.html'
    )

    # intro slideshow
    .state('app.intro'
      url: '/intro'
      views:
        menuContent:
          templateUrl: 'templates/static/intro.html'
    )

    # 'Understanding Pain' template
    .state('app.pain'
      url: '/pain'
      views:
        menuContent:
          templateUrl: 'templates/static/pain.html'
    )

      # understanding pain -> what is pain
      .state('app.what'
        url: '/pain/what'
        views:
          menuContent:
            templateUrl: 'templates/static/pain/what.html'
      )

      # understanding pain -> types of pain
      .state('app.pain_types'
        url: '/pain/type'
        views:
          menuContent:
            templateUrl: 'templates/static/pain/type.html'
      )

      # # understanding pain -> reducing pain
      # .state('app.pain.reduce'
      #   url: '/pain/reduce'
      #   views:
      #     menuContent:
      #       templateUrl: 'templates/static/pain.reduce.html'
      # )

      # # understanding pain -> pain management plan
      # .state('app.pain.plan'
      #   url: '/pain/plan'
      #   views:
      #     menuContent:
      #       templateUrl: 'templates/static/pain.plan.html'
      # )

