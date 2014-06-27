'use strict'

interceptor = ($q, $injector) ->
  success = (response) ->
    response
  error = (response) ->
    if response.status is 401
      $injector.get("$state").transitionTo "app.login"
      $q.reject response
    else
      $q.reject response
  (promise) ->
    promise.then success, error

interceptor.$inject = ['$q', '$injector']

@painSquad.config ($urlRouterProvider, $stateProvider, $compileProvider, $httpProvider, CONFIG) ->
  $compileProvider.aHrefSanitizationWhitelist /^\s*(https?|ftp|mailto|file|tel):/
  $httpProvider.responseInterceptors.push(interceptor)
  $urlRouterProvider.otherwise '/app/home'

  currentUser = JSON.parse localStorage.getItem 'current_user'
  if currentUser?
    $httpProvider.defaults.headers.common['Authorization'] = "Token token=#{currentUser.access_token}"

  $stateProvider
    # abstract sidemenu state/template
    .state('app'
      url: '/app'
      abstract: true
      templateUrl: 'templates/layout/menu.html'
    )

    # root template
    .state('app.home'
      url: '/home'
      views:
        menuContent:
          templateUrl: 'templates/shared/home.html'
          controller:  'HomeCtrl'
          resolve:
            userScore: (User, $q) ->
              defer = $q.defer()
              User.query (response) ->
                defer.resolve response.user
              defer.promise
    )

    .state('app.home.complete'
      url: '/:action'
      views:
        menuContent:
          templateUrl: 'templates/shared/home.html'
          controller:  'HomeCtrl'
    )

    .state('app.login',
      url: '/login',
      views:
        menuContent:
          templateUrl: 'templates/shared/login.html'
          controller: 'LoginCtrl'
    )

    # pain-case template - render individual questions as partials
    .state('app.new_survey'
      url: '/surveys/new'
      views:
        menuContent:
          templateUrl: 'templates/surveys/main.html'
          controller:  'SurveyCtrl'
          resolve:
            survey: (Survey, $q) ->
              defer = $q.defer()
              Survey.query (response) ->
                defer.resolve response.survey
              defer.promise
    )

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
          controller:  'AchievementsCtrl'
          resolve:
            achievements: (Achievement, $q) ->
              defer = $q.defer()
              Achievement.query (response) ->
                defer.resolve response.achievements
              defer.promise
    )


    # advice state
    .state('app.advice'
      url: '/advice'
      views:
        menuContent:
          templateUrl: 'templates/advice/main.html'
    )

    # advice -> recommended state
    .state('app.recommended'
      url: '/recommended'
      views:
        menuContent:
          templateUrl: 'templates/advice/recommended.html'
          controller:  'RecommendationsCtrl'
          resolve:
            recommendations: (Recommendation, $q) ->
              defer = $q.defer()
              Recommendation.query (response) ->
                defer.resolve response.recommendations
              defer.promise
    )

    # advice -> favorites state
    .state('app.favorites'
      url: '/favorites'
      views:
        menuContent:
          templateUrl: 'templates/advice/favorites.html'
          controller:  'FavoritesCtrl'
          resolve:
            favorites: (Favorites, $q) ->
              defer = $q.defer()
              Favorites.query (response) ->
                defer.resolve response.favorites
              defer.promise
    )

    # recommended -> advice steps slidebox
    .state('app.advice_steps'
      url: '/recommended/steps/'
      views:
        menuContent:
          templateUrl: 'templates/advice/steps.html'
    )

    # advice -> prevent pain state
    .state('app.prevent_pain'
      url: '/advice/prevent'
      views:
        menuContent:
          templateUrl: 'templates/advice/prevent.html'
          controller: 'PreventCtrl'
          resolve:
            PreventionRecommendations: ($q, $http) ->
              defer = $q.defer()
              $http({method: 'GET', url: "#{CONFIG.apiUrl}/recommendations/prevent/"})
              .success (response) ->
                defer.resolve response.recommendations
              .error (data) ->
                return false
              defer.promise
    )

    # advice -> manage pain state
    .state('app.manage_pain'
      url: '/advice/manage'
      views:
        menuContent:
          templateUrl: 'templates/advice/manage.html'
          controller: 'ManageCtrl'
          resolve:
            ManagementRecommendations: ($q, $http) ->
              defer = $q.defer()
              $http({method: 'GET', url: "#{CONFIG.apiUrl}/recommendations/manage/"})
              .success (response) ->
                defer.resolve response.recommendations
              .error (data) ->
                return false
              defer.promise
    )

    # reducing pain -> pharmacological pain
    .state('app.pain_pharmacological'
      url: '/pain/pharmacological'
      views:
        menuContent:
          templateUrl: 'templates/advice/pharmacological.html'
          controller: "PharmacologicalPainCtrl"
    )

    # reducing pain -> physical pain
    .state('app.pain_physical'
      url: '/pain/physical'
      views:
        menuContent:
          templateUrl: 'templates/advice/physical.html'
          controller: "PhysicalPainCtrl"
    )

    # reducing pain -> psychological pain
    .state('app.pain_psychological'
      url: '/pain/psychological'
      views:
        menuContent:
          templateUrl: 'templates/advice/psychological.html'
          controller: "PsychologicalPainCtrl"
    )

############################ STATIC CONTENT ####################################
    # settings state
    .state('app.settings'
      url: '/settings'
      views:
        menuContent:
          templateUrl: 'templates/static/settings.html'
    )

    # reports state
    .state('app.action_report'
      url: '/reports/action'
      views:
        menuContent:
          templateUrl: 'templates/static/reports/action.html',
          controller: "ActionReportCtrl",
          resolve:
            report: (Report, $q) ->
              defer = $q.defer()
              Report.get report_id: 'action', (response) ->
                defer.resolve response.report
              defer.promise
    )

    .state('app.cause_report'
      url: '/reports/cause'
      views:
        menuContent:
          templateUrl: 'templates/static/reports/cause.html',
          controller: "CauseReportCtrl",
          resolve:
            report: (Report, $q) ->
              defer = $q.defer()
              Report.get report_id: 'cause', (response) ->
                defer.resolve response.report

              defer.promise
    )

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

    # terms of use
    .state('app.terms'
      url: '/terms'
      views:
        menuContent:
          templateUrl: 'templates/static/terms.html'
    )

    # contact us
    .state('app.contact'
      url: '/contact'
      views:
        menuContent:
          templateUrl: 'templates/static/contact.html'
    )

    # privacy
    .state('app.privacy'
      url: '/privacy'
      views:
        menuContent:
          templateUrl: 'templates/static/privacy.html'
    )

    # intro slideshow
    .state('app.intro'
      url: '/intro'
      views:
        menuContent:
          templateUrl: 'templates/static/intro.html'
          controller:  'IntroCtrl'
    )

    # 'Understanding Pain' template
    .state('app.pain'
      url: '/pain'
      views:
        menuContent:
          templateUrl: 'templates/static/understanding_pain.html'
    )

    # understanding pain -> what is pain
    .state('app.pain_what'
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

    # understanding pain -> reducing pain
    .state('app.pain_reduce'
      url: '/pain/reduce'
      views:
        menuContent:
          templateUrl: 'templates/static/pain/reduce.html'
    )

    # understanding pain -> pain management plan
    .state('app.pain_plan'
      url: '/pain/plan'
      views:
        menuContent:
          templateUrl: 'templates/static/pain/plan.html'
    )
