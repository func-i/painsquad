'use strict'

@HomeCtrl = @controllerModule.controller 'HomeCtrl', ($scope, $state, $rootScope, $ionicPopup, UserService, userScore) ->
  $scope.currentUser = UserService.currentUser()
  $scope.userScore   = userScore
  $scope.rankBadge   = if userScore then "images/achievements/#{userScore.rank}.png" else "images/achievements/rookie.png"

  $rootScope.sideMenuEnabled = true

  $scope.showConfirm = ->
    confirmPopup = $ionicPopup.confirm
      title:    'Do you want pain management advice?'
      template: 'Get recommended advice based on your pain case'
    confirmPopup.then (res) ->
      if res
        console.log 'OK clicked'
        # $state.go ''
      else
        console.log 'Cancel clicked'

  $rootScope.$on 'surveyComplete', (ev) ->
    $scope.showConfirm()

@HomeCtrl.$inject = ['$scope', '$state', '$rootScope', '$ionicPopup', 'UserService', 'userScore']
