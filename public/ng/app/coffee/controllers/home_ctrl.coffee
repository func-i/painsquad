'use strict'

@HomeCtrl = @controllerModule.controller 'HomeCtrl', ($scope, $state, $rootScope, $ionicPopup, UserService, userScore, NetworkService, UserAgentService) ->
  $scope.currentUser = UserService.currentUser()
  $scope.userScore   = userScore
  $scope.rankBadge   = if userScore then "images/achievements/#{userScore.rank}.png" else "images/achievements/rookie.png"
  $scope.progress    = if userScore then userScore.percent_completed else 0.01

  $scope.showPopup = ->
    confirmPopup = $ionicPopup.show
      title:    'Do you want pain management advice?'
      template: '<span>Get recommended advice based on your pain case</span>'
      buttons:  [
        {
          text: "<span class='content'>No</span>"
          type: 'button-stable'
        },
        {
          text: "<span class='content'>Yes</span>"
          type: 'button-positive'
          onTap: (ev) ->
            $state.go 'app.recommended'
        }
      ]

  $scope.test = ->
    $rootScope.$broadcast 'event:levelup', { image: 'junior_detective', prev_rank: 'junior_detective', rank: 'junior_detective' }

  init = ->
    # only show popup after transitioning from survey_complete
    if $rootScope.previousState_name is 'app.survey_complete'
      $scope.showPopup()

  init()

@HomeCtrl.$inject = ['$scope', '$state', '$rootScope', '$ionicPopup', 'UserService', 'userScore', 'NetworkService', 'UserAgentService']
