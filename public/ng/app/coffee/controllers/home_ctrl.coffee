'use strict'

@HomeCtrl = @controllerModule.controller 'HomeCtrl', ($scope, $state, UserService, userScore) ->
  $scope.currentUser = UserService.currentUser()
  $scope.userScore   = userScore
  $scope.rankBadge   = if userScore then "images/achievements/#{userScore.rank}.png" else "images/achievements/rookie.png"

@HomeCtrl.$inject = ['$scope', '$state', 'UserService', 'userScore']
