'use strict';

angular.module('painSquad.controllers', []);
angular.module('painSquad.services', []);
// angular.module('painSquad.directives', []);

var painSquad = angular.module('painSquad', [
  'ionic',
  'painSquad.controllers',
  'painSquad.storageService',
  'painSquad.apiService',
  'ngResource',
  'ngCookies',
  'ngSanitize'
]);

var interceptor = ['$location', '$q', '$injector', function($location, $q, $injector) {
  function success(response) {
    return response;
  }

  function error(response) {
    if(response.status === 401) {
      $injector.get('$state').transitionTo('login');
      return $q.reject(response);
    }
    else {
      return $q.reject(response);
    }
  }

  return function(promise) {
    return promise.then(success, error);
  };
}];

painSquad.config(function($urlRouterProvider, $stateProvider, $compileProvider, $httpProvider) {
  $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|file|tel):/);
  // $httpProvider.responseInterceptors.push(interceptor);
  $httpProvider.defaults.port = 3000;

  $urlRouterProvider
    // fallback route
    .otherwise('/');

  // Learn more here: https://github.com/angular-ui/ui-router
  $stateProvider
    // root
    .state('root', {
      url: '/',
      templateUrl: 'templates/home.html',
      controller: 'MainCtrl'
    })

    // HOME VIEW
    .state('home', {
      url: '/home',
      templateUrl: 'templates/home.html',
      controller: 'MainCtrl'
    })

    // LOGIN VIEW
    .state('login', {
      url: '/login',
      templateUrl: 'templates/users/new.html',
      controller: 'UserCtrl'
    })

    // REPORTS VIEW
    .state('reports', {
      url: '/reports',
      templateUrl: 'templates/reports.html',
      controller: 'ReportsCtrl'
    })

    // SETTINGS VIEW
    .state('settings', {
      url: '/settings',
      templateUrl: 'templates/settings.html',
      controller: 'SettingsCtrl'
    })

    // NEW PAIN CASE VIEW
    .state('case', {
      url: '/case',
      templateUrl: 'templates/case.html',
      controller: 'CaseCtrl'
    })

    // ABOUT SECTION VIEWS
    .state('about', {
      url: '/about',
      templateUrl: 'templates/static/about.html',
      controller: 'AboutCtrl'
    })

    .state('intro', {
      url: '/intro',
      templateUrl: 'templates/static/intro.html',
      controller: 'IntroCtrl'
    });

    // .state('pain', {
    //   url: '/pain',
    //   templateUrl: 'templates/static/pain.html'
    // });

    // .state('intro', {
    //   url: '/intro',
    //   templateUrl: 'views/intro.html',
    //   controller: 'IntroCtrl'
    // })

    // .state('about.home', {
    //   url: '/home',
    //   views: {
    //     'about-view': {
    //       templateUrl: 'views/about.html',
    //       controller: 'IntroCtrl'
    //     }
    //   }
    // })

    // .state('about.intro', {
    //   url: '/intro',
    //   views: {
    //     'about-view': {
    //       templateUrl: 'views/slides.html',
    //       controller: 'IntroCtrl'
    //     }
    //   }
    // })

    // // app intro path
    // .state('intro', {
    //   url: '/intro',
    //   templateUrl: 'views/slides.html',
    //   controller: 'IntroCtrl'
    // })
});

painSquad.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    if(window.StatusBar) {
      // org.apache.cordova.statusbar required
      StatusBar.styleDefault();
    }
  });
});
