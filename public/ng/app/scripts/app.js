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

  $stateProvider
    .state('app', {
      url: '/app',
      abstract: true,
      templateUrl: 'templates/menu.html',
      controller: 'MainCtrl'
    })

    // .state('app.home', {
    //   url: '/home',
    //   views: {
    //     'menuContent' :{
    //       templateUrl: 'templates/home.html',
    //       controller: 'MainCtrl'
    //     }
    //   }
    // })

    .state('app.cases', {
      url: '/cases',
      views: {
        'menuContent' :{
          templateUrl: 'templates/cases.html',
          controller: 'CaseCtrl'
        }
      }
    })

    .state('case', {
      url: '/cases',
      views: {
        'menuContent' :{
          templateUrl: 'templates/cases.html',
          controller: 'CaseCtrl'
        }
      }
    })

    .state('case.progress', {
      url: '/progress',
      views: {
        'menuContent' :{
          templateUrl: 'templates/case/case-progress.html',
          controller: 'CaseCtrl'
        }
      }
    })

    .state('app.new_case', {
      url: '/new_case',
      views: {
        'menuContent' :{
          templateUrl: 'templates/new_case.html',
          controller: 'CaseCtrl'
        }
      }
    })

    // .state('app.case', {
    //   url: '/cases/:caseId',
    //   views: {
    //     'menuContent' :{
    //       templateUrl: 'templates/case.html',
    //       controller: 'CaseCtrl'
    //     }
    //   }
    // })


    // // ABOUT SECTION VIEWS
    // .state('about', {
    //   url: '/about',
    //   templateUrl: 'templates/static/about.html',
    //   controller: 'AboutCtrl'
    // })

    // .state('intro', {
    //   url: '/intro',
    //   templateUrl: 'templates/static/intro.html',
    //   controller: 'IntroCtrl'
    // });

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

    $urlRouterProvider.otherwise('/app/cases');

});

painSquad.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    if(window.StatusBar) {
      // org.apache.cordova.statusbar required
      StatusBar.styleDefault();
    }
  });
});
