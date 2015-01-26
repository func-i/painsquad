(function() {
  'use strict';
  this.painSquad.config(function($urlRouterProvider, $stateProvider, $compileProvider, $httpProvider, CONFIG) {
    var currentUser;
    $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|file|tel):/);
    $httpProvider.interceptors.push('LoadingInterceptor');
    $httpProvider.responseInterceptors.push('AuthInterceptor');
    $httpProvider.responseInterceptors.push('EventInterceptor');
    $urlRouterProvider.otherwise('/app/home');
    currentUser = JSON.parse(localStorage.getItem('current_user'));
    if (currentUser != null) {
      $httpProvider.defaults.headers.common['Authorization'] = "Token token=" + currentUser.access_token;
    }
    return $stateProvider.state('app', {
      url: '/app',
      abstract: true,
      templateUrl: 'templates/layout/menu.html',
      controller: 'AppCtrl'
    }).state('app.home', {
      url: '/home?popup',
      views: {
        menuContent: {
          templateUrl: 'templates/shared/home.html',
          controller: 'HomeCtrl',
          resolve: {
            currentUserResponse: function(User, $q) {
              return User.query().$promise;
            }
          }
        }
      }
    }).state('app.login', {
      url: '/login',
      views: {
        menuContent: {
          templateUrl: 'templates/shared/login.html',
          controller: 'LoginCtrl'
        }
      }
    }).state('app.new_survey', {
      url: '/surveys/new/',
      views: {
        menuContent: {
          templateUrl: 'templates/surveys/main.html',
          controller: 'SurveyCtrl',
          resolve: {
            survey: function(Survey, $q) {
              var defer;
              defer = $q.defer();
              Survey.query(function(response) {
                return defer.resolve(response.survey);
              });
              return defer.promise;
            }
          }
        }
      }
    }).state('app.new_survey_by_type', {
      url: '/surveys/new/:type',
      views: {
        menuContent: {
          templateUrl: 'templates/surveys/main.html',
          controller: 'SurveyCtrl',
          resolve: {
            survey: function(Survey, $q, $stateParams) {
              var defer;
              defer = $q.defer();
              Survey.query({
                type: $stateParams.type
              }, function(response) {
                return defer.resolve(response.survey);
              });
              return defer.promise;
            }
          }
        }
      }
    }).state('app.survey_complete', {
      url: '/surveys/complete?popup',
      views: {
        menuContent: {
          templateUrl: 'templates/surveys/complete.html',
          controller: 'CompleteSurveyCtrl',
          resolve: {
            surveyResult: function(SurveyResults, $q) {
              var defer;
              defer = $q.defer();
              SurveyResults.query(function(response) {
                return defer.resolve(response.survey_results);
              });
              return defer.promise;
            },
            currentUserResponse: function(User, $q) {
              return User.query().$promise;
            }
          }
        }
      }
    }).state('app.achievements', {
      url: '/achievements',
      views: {
        menuContent: {
          templateUrl: 'templates/achievements/main.html',
          controller: 'AchievementsCtrl',
          resolve: {
            achievements: function(Achievement, $q) {
              var defer;
              defer = $q.defer();
              Achievement.query(function(response) {
                return defer.resolve(response.achievements);
              });
              return defer.promise;
            }
          }
        }
      }
    }).state('app.advice', {
      url: '/advice',
      views: {
        menuContent: {
          templateUrl: 'templates/advice/main.html'
        }
      }
    }).state('app.recommended', {
      url: '/recommended',
      views: {
        menuContent: {
          templateUrl: 'templates/advice/recommended.html',
          controller: 'RecommendationsCtrl',
          resolve: {
            recommendations: function(Recommendation, $q) {
              var defer;
              defer = $q.defer();
              Recommendation.query(function(response) {
                return defer.resolve(response.recommendations);
              });
              return defer.promise;
            }
          }
        }
      }
    }).state('app.favorites', {
      url: '/favorites',
      views: {
        menuContent: {
          templateUrl: 'templates/advice/favorites.html',
          controller: 'FavoritesCtrl',
          resolve: {
            favorites: function(Favorites, $q) {
              var defer;
              defer = $q.defer();
              Favorites.query(function(response) {
                return defer.resolve(response.favorites);
              });
              return defer.promise;
            }
          }
        }
      }
    }).state('app.advice_steps', {
      url: '/recommended/steps/',
      views: {
        menuContent: {
          templateUrl: 'templates/advice/steps.html'
        }
      }
    }).state('app.prevent_pain', {
      url: '/advice/prevent',
      views: {
        menuContent: {
          templateUrl: 'templates/advice/prevent.html',
          controller: 'PreventCtrl',
          resolve: {
            PreventionRecommendations: function($q, $http) {
              var defer;
              defer = $q.defer();
              $http({
                method: 'GET',
                url: "" + CONFIG.apiUrl + "/recommendations/prevent/"
              }).success(function(response) {
                return defer.resolve(response.recommendations);
              }).error(function(data) {
                return false;
              });
              return defer.promise;
            }
          }
        }
      }
    }).state('app.manage_pain', {
      url: '/advice/manage',
      views: {
        menuContent: {
          templateUrl: 'templates/advice/manage.html',
          controller: 'ManageCtrl',
          resolve: {
            ManagementRecommendations: function($q, $http) {
              var defer;
              defer = $q.defer();
              $http({
                method: 'GET',
                url: "" + CONFIG.apiUrl + "/recommendations/manage/"
              }).success(function(response) {
                return defer.resolve(response.recommendations);
              }).error(function(data) {
                return false;
              });
              return defer.promise;
            }
          }
        }
      }
    }).state('app.pain_pharmacological', {
      url: '/pain/pharmacological',
      views: {
        menuContent: {
          templateUrl: 'templates/advice/pharmacological.html',
          controller: "PharmacologicalPainCtrl"
        }
      }
    }).state('app.pain_physical', {
      url: '/pain/physical',
      views: {
        menuContent: {
          templateUrl: 'templates/advice/physical.html',
          controller: "PhysicalPainCtrl"
        }
      }
    }).state('app.pain_psychological', {
      url: '/pain/psychological',
      views: {
        menuContent: {
          templateUrl: 'templates/advice/psychological.html',
          controller: "PsychologicalPainCtrl"
        }
      }
    }).state('app.settings', {
      url: '/settings',
      views: {
        menuContent: {
          templateUrl: 'templates/static/settings.html',
          controller: 'SettingsCtrl',
          resolve: {
            settings: function(SettingResource, $q) {
              var defer;
              defer = $q.defer();
              SettingResource.query(function(response) {
                return defer.resolve(response.alerts);
              });
              return defer.promise;
            }
          }
        }
      }
    }).state('app.reports', {
      url: '/reports/',
      views: {
        menuContent: {
          templateUrl: 'templates/reports/main.html'
        }
      }
    }).state('app.action_report', {
      url: '/reports/action',
      views: {
        menuContent: {
          templateUrl: 'templates/reports/report.html',
          controller: "ActionReportCtrl",
          resolve: {
            report: function(Report, $q) {
              var defer;
              defer = $q.defer();
              Report.get({
                report_id: 'action'
              }, function(response) {
                return defer.resolve(response.report);
              });
              return defer.promise;
            }
          }
        }
      }
    }).state('app.cause_report', {
      url: '/reports/cause',
      views: {
        menuContent: {
          templateUrl: 'templates/reports/report.html',
          controller: "CauseReportCtrl",
          resolve: {
            report: function(Report, $q) {
              var defer;
              defer = $q.defer();
              Report.get({
                report_id: 'cause'
              }, function(response) {
                return defer.resolve(response.report);
              });
              return defer.promise;
            }
          }
        }
      }
    }).state('app.effect_report', {
      url: '/reports/effect',
      views: {
        menuContent: {
          templateUrl: 'templates/reports/report.html',
          controller: "EffectReportCtrl",
          resolve: {
            report: function(Report, $q) {
              var defer;
              defer = $q.defer();
              Report.get({
                report_id: 'effect'
              }, function(response) {
                return defer.resolve(response.report);
              });
              return defer.promise;
            }
          }
        }
      }
    }).state('app.pain_report', {
      url: '/reports/pain',
      views: {
        menuContent: {
          templateUrl: 'templates/reports/report.html',
          controller: "PainReportCtrl",
          resolve: {
            report: function(Report, $q) {
              var defer;
              defer = $q.defer();
              Report.get({
                report_id: 'pain'
              }, function(response) {
                return defer.resolve(response.report);
              });
              return defer.promise;
            }
          }
        }
      }
    }).state('app.about', {
      url: '/about',
      views: {
        menuContent: {
          templateUrl: 'templates/static/about.html'
        }
      }
    }).state('app.acknowledgements', {
      url: '/acknowledgements',
      views: {
        menuContent: {
          templateUrl: 'templates/static/acknowledgements.html'
        }
      }
    }).state('app.terms', {
      url: '/terms',
      views: {
        menuContent: {
          templateUrl: 'templates/static/terms.html'
        }
      }
    }).state('app.contact', {
      url: '/contact',
      views: {
        menuContent: {
          templateUrl: 'templates/static/contact.html'
        }
      }
    }).state('app.privacy', {
      url: '/privacy',
      views: {
        menuContent: {
          templateUrl: 'templates/static/privacy.html'
        }
      }
    }).state('app.notconnected', {
      url: '/not_connected',
      views: {
        menuContent: {
          templateUrl: 'templates/static/not_connected.html'
        }
      }
    }).state('app.intro', {
      url: '/intro',
      views: {
        menuContent: {
          templateUrl: 'templates/static/intro.html',
          controller: 'IntroCtrl'
        }
      }
    }).state('app.pain', {
      url: '/pain',
      views: {
        menuContent: {
          templateUrl: 'templates/static/understanding_pain.html'
        }
      }
    }).state('app.pain_what', {
      url: '/pain/what',
      views: {
        menuContent: {
          templateUrl: 'templates/static/pain/what.html'
        }
      }
    }).state('app.pain_types', {
      url: '/pain/type',
      views: {
        menuContent: {
          templateUrl: 'templates/static/pain/type.html'
        }
      }
    }).state('app.pain_reduce', {
      url: '/pain/reduce',
      views: {
        menuContent: {
          templateUrl: 'templates/static/pain/reduce.html'
        }
      }
    }).state('app.pain_plan', {
      url: '/pain/plan',
      views: {
        menuContent: {
          templateUrl: 'templates/static/pain/plan.html'
        }
      }
    }).state('app.physical', {
      url: '/pain/static/physical',
      views: {
        menuContent: {
          templateUrl: 'templates/static/pain/physical.html'
        }
      }
    }).state('app.pharmacological', {
      url: '/pain/static/pharmacological',
      views: {
        menuContent: {
          templateUrl: 'templates/static/pain/pharmacological.html'
        }
      }
    }).state('app.psychological', {
      url: '/pain/static/psychological',
      views: {
        menuContent: {
          templateUrl: 'templates/static/pain/psychological.html'
        }
      }
    }).state('app.help', {
      url: '/help',
      views: {
        menuContent: {
          templateUrl: 'templates/static/help.html',
          controller: 'HelpCtrl'
        }
      }
    });
  });

}).call(this);
