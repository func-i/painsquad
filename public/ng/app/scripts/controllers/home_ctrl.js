(function() {
  'use strict';
  this.HomeCtrl = this.controllerModule.controller('HomeCtrl', function($scope, $state, $rootScope, $ionicPopup, UserService, userScore) {
    $scope.currentUser = UserService.currentUser();
    $scope.userScore = userScore;
    $scope.rankBadge = userScore ? "images/achievements/" + userScore.rank + ".png" : "images/achievements/rookie.png";
    $rootScope.sideMenuEnabled = true;
    $scope.showConfirm = function() {
      var confirmPopup;
      confirmPopup = $ionicPopup.confirm({
        title: 'Do you want pain management advice?',
        template: 'Get recommended advice based on your pain case'
      });
      return confirmPopup.then(function(res) {
        if (res) {
          return console.log('OK clicked');
        } else {
          return console.log('Cancel clicked');
        }
      });
    };
    return $rootScope.$on('surveyComplete', function(ev) {
      return $scope.showConfirm();
    });
  });

  this.HomeCtrl.$inject = ['$scope', '$state', '$rootScope', '$ionicPopup', 'UserService', 'userScore'];

}).call(this);
