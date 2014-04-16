'use strict';

angular.module('painSquad.controllers', []);
angular.module('painSquad.services', []);
// angular.module('painSquad.directives', []);

var painSquad = angular.module('painSquad', [
  'ionic',
  'painSquad.controllers',
  'painSquad.services'
])

painSquad.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    if(window.StatusBar) {
      // org.apache.cordova.statusbar required
      StatusBar.styleDefault();
    }
  });
})

painSquad.config(function($stateProvider, $urlRouterProvider) {

  $urlRouterProvider
    // convenience method to re-route to app/home, not needed!
    // .when('/home', '/app/home')

    // if none of the above states are matched, use this as the fallback
    // $urlRouterProvider.otherwise('/intro');
    .otherwise('/home');

  // Learn more here: https://github.com/angular-ui/ui-router
  $stateProvider

    // HOME VIEW
    .state('home', {
      url: '/home',
      templateUrl: 'templates/home.html',
      controller: 'HomeCtrl'
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
    })

    .state('pain', {
      url: '/pain',
      templateUrl: 'templates/static/pain.html'
    });

    // .state('intro', {
    //   url: '/intro',
    //   templateUrl: 'views/intro.html',
    //   controller: 'IntroCtrl'
    // })


    // .state('about.home', {
    //   url: "/home",
    //   views: {
    //     'about-view': {
    //       templateUrl: "views/about.html",
    //       controller: "IntroCtrl"
    //     }
    //   }
    // })

    // .state('about.intro', {
    //   url: "/intro",
    //   views: {
    //     'about-view': {
    //       templateUrl: "views/slides.html",
    //       controller: "IntroCtrl"
    //     }
    //   }
    // })

    // app intro path
    // .state('intro', {
    //   url: '/intro',
    //   templateUrl: 'views/slides.html',
    //   controller: 'IntroCtrl'
    // })
});
