angular.module('painSquad.controllers', [])

.controller('IntroCtrl', function($scope, $state, $window, $ionicSlideBoxDelegate) {
  // Called to navigate to the main app
  $scope.startApp = function() {
    $state.go('home');
  };

  $scope.next = function() {
    $ionicSlideBoxDelegate.next();
  };

  $scope.previous = function() {
    $ionicSlideBoxDelegate.previous();
  };

  // Called each time the slide changes
  $scope.slideChanged = function(index) {
    $scope.slideIndex = index;
  };

  $scope.goBack = function() {
    $window.history.back();
  };
})

.controller('MenuCtrl', function($scope, $rootScope, $window, $location, $ionicSideMenuDelegate) {
  $scope.goToPage = function(page) {
    // console.log($rootScope.isTablet);
    if (!$rootScope.isTablet) {
      $ionicSideMenuDelegate.toggleLeft(false);
    }
    $location.url('/' + page);
  };

  $scope.closeSideMenu = function() {
    $ionicSideMenuDelegate.close();
  };

  $scope.goBack = function() {
    $window.history.back();
  };

  $scope.openLeftPanel = function() {
    $ionicSideMenuDelegate.toggleLeft();
  };
})

.controller('CaseCtrl', function($scope, $stateParams) {
})

.controller('HomeCtrl', function($scope, $state, $stateParams) {
})

.controller('AboutCtrl', function($scope, $state, $stateParams) {
  $scope.toIntro = function() {
    $state.go('intro');
  }
})

.controller('ReportsCtrl', function($scope, $stateParams) {
})

.controller('SettingsCtrl', function($scope, $state, $stateParams) {
})


