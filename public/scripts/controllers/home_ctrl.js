(function() {
  'use strict';
  this.HomeCtrl = this.controllerModule.controller('HomeCtrl', function($scope, $state, $stateParams, $rootScope, $ionicPopup, UserService, currentUserResponse) {
    var currentUser, init;
    currentUser = currentUserResponse.user;
    UserService.set(currentUser);
    $scope.currentUser = currentUser;
    $scope.userScore = currentUser;
    $scope.rankBadge = currentUser ? "images/achievements/" + currentUser.rank + ".png" : "images/achievements/rookie.png";
    $scope.progress = currentUser ? currentUser.percent_completed : 0.01;
    $scope.showPopup = function() {
      var confirmPopup;
      return confirmPopup = $ionicPopup.show({
        title: 'Do you want pain management advice?',
        template: '<span>Get recommended advice based on your pain case</span>',
        buttons: [
          {
            text: "<span class='content'>No</span>",
            type: 'button-stable'
          }, {
            text: "<span class='content'>Yes</span>",
            type: 'button-positive',
            onTap: function(ev) {
              return $state.go('app.recommended');
            }
          }
        ]
      });
    };
    init = function() {
      if ($rootScope.previousState_name === 'app.survey_complete' && $stateParams.popup === "true") {
        return $scope.showPopup();
      }
    };
    return init();
  });

  this.HomeCtrl.$inject = ['$scope', '$state', '$rootScope', '$ionicPopup', 'UserService', 'currentUser'];

}).call(this);
