'use strict';

angular.module('painSquad.controllers')

.controller('MainCtrl', function($scope, $rootScope, $window, $location, $ionicSideMenuDelegate, $http) {

  $http.get('http://localhost:3000/api/v1/greet.json')
    .success(function(data) {
      $scope.message = data;
    })
    .error(function(data, status, headers, config) {
      $scope.message = status + " " + data + " " + headers + " " + config;
    });

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

});

// 'use strict';
// var MainCtrl,
//   __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

// MainCtrl = (function() {
//   function MainCtrl($scope, webService, storageService) {
//     this.$scope = $scope;
//     this.webService = webService;
//     this.storageService = storageService;
//     this.error = __bind(this.error, this);
//     this.setPosts = __bind(this.setPosts, this);
//     this.success = __bind(this.success, this);
//     this.setup();
//   }

//   MainCtrl.prototype.setup = function() {
//     return this.getData();
//   };

//   MainCtrl.prototype.getData = function() {
//     var anotherPromise, promise;
//     promise = this.webService.getGreeting();
//     promise.then(this.success, this.error);
//     anotherPromise = this.webService.getPosts();
//     return anotherPromise.then(this.setPosts, this.error);
//   };

//   MainCtrl.prototype.success = function(response) {
//     this.$scope.$broadcast("notify", {
//       message: "Welcome back :)"
//     });
//     return this.$scope.message = response.data.message;
//   };

//   MainCtrl.prototype.setPosts = function(response) {
//     return this.$scope.posts = response.data;
//   };

//   MainCtrl.prototype.error = function(response) {
//     return this.$scope.message = "Error while retrieving data from server!";
//   };

//   return MainCtrl;

// })();

// MainCtrl.$inject = ["$scope", "webService", "storageService"];

// angular.module("ebenezerApp").controller("MainCtrl", MainCtrl);
