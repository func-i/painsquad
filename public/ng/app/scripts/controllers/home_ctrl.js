(function() {
  'use strict';
  this.HomeCtrl = this.controllerModule.controller('HomeCtrl', function($scope, $state, $rootScope, $ionicPopup, UserService, userScore, NetworkService) {
    var init;
    $scope.currentUser = UserService.currentUser();
    $scope.userScore = userScore;
    $scope.rankBadge = userScore ? "images/achievements/" + userScore.rank + ".png" : "images/achievements/rookie.png";
    $scope.progress = userScore ? userScore.percent_completed : 1;
    $rootScope.sideMenuEnabled = true;
    $scope.showPopup = function() {
      var confirmPopup;
      return confirmPopup = $ionicPopup.show({
        title: 'Do you want pain management advice?',
        template: '<span>Get recommended advice based on your pain case</span>',
        buttons: [
          {
            text: 'No',
            type: 'button-default'
          }, {
            text: 'Yes',
            type: 'button-positive',
            onTap: function(ev) {
              return $state.go('app.recommended');
            }
          }
        ]
      });
    };
    init = function() {
      if ($rootScope.previousState_name === 'app.survey_complete') {
        return $scope.showPopup();
      }
    };
    $scope.fireEvent = function() {
      return $rootScope.$broadcast('event:adviceAward');
    };
    return init();
  });

  this.HomeCtrl.$inject = ['$scope', '$state', '$rootScope', '$ionicPopup', 'UserService', 'userScore', 'NetworkService'];

}).call(this);
