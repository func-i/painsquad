'use strict'

@LoginCtrl = @controllerModule.controller 'LoginCtrl',  ($scope, AuthService) ->
  $scope.credentials = {}

  $scope.login = ->
    console.log "Sending credentials to AuthService => ", $scope.credentials
    AuthService.login($scope.credentials)

@LoginCtrl.$inject = ['$scope', 'AuthService']