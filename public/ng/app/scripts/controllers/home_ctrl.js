(function() {
  'use strict';
  this.HomeCtrl = this.controllerModule.controller('HomeCtrl', function($scope, $state, UserService, userScore) {
    $scope.currentUser = UserService.currentUser();
    $scope.userScore = userScore;
    return $scope.rankBadge = userScore ? "images/achievements/" + userScore.rank + ".png" : "images/achievements/rookie.png";
  });

  this.HomeCtrl.$inject = ['$scope', '$state', 'UserService', 'userScore'];

}).call(this);
