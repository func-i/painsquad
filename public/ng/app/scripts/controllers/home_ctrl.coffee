'use strict'

@HomeCtrl = @controllerModule.controller 'HomeCtrl', ($scope, $state, UserService) ->
  $scope.currentUser = UserService.currentUser()

@HomeCtrl.$inject = ['$scope', '$state', 'UserService']
