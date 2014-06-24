'use strict'

@HomeCtrl = @controllerModule.controller 'HomeCtrl', ($scope, $state, $rootScope, UserService, userScore) ->
  $scope.currentUser = UserService.currentUser()
  $scope.userScore   = userScore
  $scope.rankBadge   = if userScore then "images/achievements/#{userScore.rank}.png" else "images/achievements/rookie.png"

  $rootScope.sideMenuEnabled = true

@HomeCtrl.$inject = ['$scope', '$state', '$rootScope', 'UserService', 'userScore']
