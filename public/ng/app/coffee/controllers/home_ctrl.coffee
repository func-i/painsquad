'use strict'

@HomeCtrl = @controllerModule.controller 'HomeCtrl', ($scope, $state, $rootScope, $ionicPopup, UserService, userScore, NetworkService) ->
  $scope.currentUser         = UserService.currentUser()
  $scope.userScore           = userScore
  $scope.rankBadge           = if userScore then "images/achievements/#{userScore.rank}.png" else "images/achievements/rookie.png"
  $rootScope.sideMenuEnabled = true

  $scope.$on "$destroy", ->
    $rootScope.$broadcast 'event:levelup:close'

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

  init = ($rootScope) ->
    # only show popup after transitioning from survey_complete
    if $rootScope.previousState_name is 'app.survey_complete'
      $scope.showPopup()
    # fire levelup modal is user reached next rank
    if $scope.userScore and $scope.userScore.has_ranked_up
      $rootScope.$broadcast 'event:levelup', { image: $scope.userScore.rank, prev_rank: $scope.userScore.prev_rank, rank: $scope.userScore.display_rank }

  init($rootScope)

@HomeCtrl.$inject = ['$scope', '$state', '$rootScope', '$ionicPopup', 'UserService', 'userScore', 'NetworkService']
