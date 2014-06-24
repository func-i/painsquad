(function() {
  'use strict';
  this.HomeCtrl = this.controllerModule.controller('HomeCtrl', function($scope, $state, $rootScope, $ionicPopup, $timeout, UserService, userScore) {
    var disableListener, popupListener;
    $scope.currentUser = UserService.currentUser();
    $scope.userScore = userScore;
    $scope.rankBadge = userScore ? "images/achievements/" + userScore.rank + ".png" : "images/achievements/rookie.png";
    $rootScope.sideMenuEnabled = true;
    $scope.showPopup = function() {
      var confirmPopup;
      return confirmPopup = $ionicPopup.show({
        title: 'Do you want pain management advice?',
        template: '<div>Get recommended advice based on your pain case</div>',
        buttons: [
          {
            text: 'No',
            type: 'button-default'
          }, {
            text: 'Yes',
            type: 'button-positive',
            onTap: function(ev) {
              $state.go('app.recommended');
              return disableListener();
            }
          }
        ]
      });
    };
    popupListener = $rootScope.$on('surveyComplete', function(ev) {
      $scope.showPopup();
      return disableListener();
    });
    return disableListener = function() {
      return popupListener();
    };
  });

  this.HomeCtrl.$inject = ['$scope', '$state', '$rootScope', '$ionicPopup', 'UserService', 'userScore'];

}).call(this);
