'use strict'

@HomeCtrl = @controllerModule.controller 'HomeCtrl', ($scope, $state, $rootScope, $ionicPopup, UserService, userScore, NetworkService) ->
  $scope.currentUser         = UserService.currentUser()
  $scope.userScore           = userScore
  $scope.rankBadge           = if userScore then "images/achievements/#{userScore.rank}.png" else "images/achievements/rookie.png"
  $scope.progress            = if userScore then 100 * (userScore.score / userScore.points_for_next_rank) else 0
  $rootScope.sideMenuEnabled = true

  $scope.showPopup = ->
    confirmPopup = $ionicPopup.show
      title:    'Do you want pain management advice?'
      template: '<span>Get recommended advice based on your pain case</span>'
      buttons:  [
        {
          text: 'No'
          type: 'button-default'
        },
        {
          text: 'Yes'
          type: 'button-positive'
          onTap: (ev) ->
            $state.go 'app.recommended'
        }
      ]

  init = ->
    # only show popup after transitioning from survey_complete
    if $rootScope.previousState_name is 'app.survey_complete'
      $scope.showPopup()

  init()

@HomeCtrl.$inject = ['$scope', '$state', '$rootScope', '$ionicPopup', 'UserService', 'userScore', 'NetworkService']
