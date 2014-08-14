(function() {
  'use strict';
  this.HomeCtrl = this.controllerModule.controller('HomeCtrl', function($scope, $state, $rootScope, $ionicPopup, UserService, userScore, NetworkService, UserAgentService) {
    var init;
    $scope.currentUser = UserService.currentUser();
    $scope.userScore = userScore;
    $scope.rankBadge = userScore ? "images/achievements/" + userScore.rank + ".png" : "images/achievements/rookie.png";
    $scope.progress = userScore ? userScore.percent_completed : 0.01;
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
    $scope.test = function() {
      return $rootScope.$broadcast('event:levelup', {
        image: 'junior_detective',
        prev_rank: 'junior_detective',
        rank: 'junior_detective'
      });
    };
    init = function() {
      if ($rootScope.previousState_name === 'app.survey_complete') {
        return $scope.showPopup();
      }
    };
    return init();
  });

  this.HomeCtrl.$inject = ['$scope', '$state', '$rootScope', '$ionicPopup', 'UserService', 'userScore', 'NetworkService', 'UserAgentService'];

}).call(this);
