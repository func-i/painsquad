'use strict'

@LoginCtrl = @controllerModule.controller 'LoginCtrl',  ($scope, AuthService) ->
  $scope.credentials = {}

  $scope.login = ->
    AuthService.login($scope.credentials)

@LoginCtrl.$inject = ['$scope', 'AuthService']