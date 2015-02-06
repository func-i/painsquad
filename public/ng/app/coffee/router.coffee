'use strict'

@painSquad.config ($urlRouterProvider, $stateProvider, $compileProvider, $httpProvider, CONFIG) ->
  $compileProvider.aHrefSanitizationWhitelist /^\s*(https?|ftp|mailto|file|tel):/
  $httpProvider.interceptors.push('LoadingInterceptor')
  $httpProvider.responseInterceptors.push('AuthInterceptor')
  $httpProvider.responseInterceptors.push('EventInterceptor')

  $urlRouterProvider.otherwise '/app/home'

  currentUser = JSON.parse localStorage.getItem 'current_user'
  if currentUser?
    $httpProvider.defaults.headers.common['Authorization'] = "Token token=#{currentUser.access_token}"

  $stateProvider
    # abstract sidemenu state/template
    .state('app'
      url:         '/app'
      abstract:    true
      templateUrl: 'templates/layout/menu.html'
      controller:  'AppCtrl'
    )

    # root template
    .state('app.home'
      url: '/home?popup'
      views:
        menuContent:
          templateUrl: 'templates/shared/home.html'
          controller:  'HomeCtrl'
          resolve:
            currentUserResponse: (User, $q) ->
              User.query().$promise
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
      url: '/surveys/new/'
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

    .state('app.new_survey_by_type'
      url: '/surveys/new/:type'
      views:
        menuContent:
          templateUrl: 'templates/surveys/main.html'
          controller:  'SurveyCtrl'
          resolve:
            survey: (Survey, $q, $stateParams) ->
              defer = $q.defer()
              Survey.query {type: $stateParams.type}, (response) ->
                defer.resolve response.survey
              defer.promise
    )

    .state('app.survey_complete'
      url: '/surveys/complete?popup'
      views:
        menuContent:
          templateUrl: 'templates/surveys/complete.html'
          controller: 'CompleteSurveyCtrl'
          resolve:
            surveyResult: (SurveyResults, $q) ->
              defer = $q.defer()
              SurveyResults.query (response) ->
                defer.resolve response.survey_results
              defer.promise

            currentUserResponse: (User, $q) ->
              User.query().$promise
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

    # settings state
    .state('app.settings'
      url: '/settings'
      views:
        menuContent:
          templateUrl: 'templates/static/settings.html'
          controller:  'SettingsCtrl'
          resolve:
            settings: (SettingResource, $q) ->
              defer = $q.defer()
              SettingResource.query (response) ->
                defer.resolve response.alerts
              defer.promise

    )


    .state('app.reports'
      url: '/reports/'
      views:
        menuContent:
          templateUrl: 'templates/reports/main.html'
    )

    # Action Report state
    .state('app.action_report'
      url: '/reports/action'
      views:
        menuContent:
          templateUrl: 'templates/reports/tabbed_report.html',
          controller: "ActionReportCtrl",
          resolve:
            report: (Report, $q) ->
              defer = $q.defer()
              Report.get report_id: 'action', (response) ->
                defer.resolve response.report
              defer.promise
    )

    # Cause Report state
    .state('app.cause_report'
      url: '/reports/cause'
      views:
        menuContent:
          templateUrl: 'templates/reports/report.html',
          controller: "CauseReportCtrl",
          resolve:
            report: (Report, $q) ->
              defer = $q.defer()
              Report.get report_id: 'cause', (response) ->
                defer.resolve response.report
              defer.promise
    )

    # Effect Report state
    .state('app.effect_report'
      url: '/reports/effect'
      views:
        menuContent:
          templateUrl: 'templates/reports/report.html',
          controller: "EffectReportCtrl",
          resolve:
            report: (Report, $q) ->
              defer = $q.defer()
              Report.get report_id: 'effect', (response) ->
                defer.resolve response.report
              defer.promise
    )

    # Pain Report state
    .state('app.pain_report'
      url: '/reports/pain'
      views:
        menuContent:
          templateUrl: 'templates/reports/report.html',
          controller: "PainReportCtrl",
          resolve:
            report: (Report, $q) ->
              defer = $q.defer()
              Report.get report_id: 'pain', (response) ->
                defer.resolve response.report
              defer.promise
    )

############################ STATIC CONTENT ####################################

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

    # no connection
    .state('app.notconnected'
      url: '/not_connected'
      views:
        menuContent:
          templateUrl: 'templates/static/not_connected.html'
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

    # understanding pain -> pain management plan
    .state('app.physical'
      url: '/pain/static/physical'
      views:
        menuContent:
          templateUrl: 'templates/static/pain/physical.html'
    )

    # understanding pain -> pain management plan
    .state('app.pharmacological'
      url: '/pain/static/pharmacological'
      views:
        menuContent:
          templateUrl: 'templates/static/pain/pharmacological.html'
    )

    # understanding pain -> pain management plan
    .state('app.psychological'
      url: '/pain/static/psychological'
      views:
        menuContent:
          templateUrl: 'templates/static/pain/psychological.html'
    )

    .state('app.help',
      url: '/help',
      views:
        menuContent:
          templateUrl: 'templates/static/help.html'
          controller: 'HelpCtrl'
    )
