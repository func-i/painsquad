(function() {
  'use strict';
  this.HomeCtrl = this.controllerModule.controller('HomeCtrl', function($scope, $state, $rootScope, UserService, userScore) {
    $scope.currentUser = UserService.currentUser();
    $scope.userScore = userScore;
    $scope.rankBadge = userScore ? "images/achievements/" + userScore.rank + ".png" : "images/achievements/rookie.png";
    return $rootScope.sideMenuEnabled = true;
  });

  this.HomeCtrl.$inject = ['$scope', '$state', '$rootScope', 'UserService', 'userScore'];

}).call(this);
