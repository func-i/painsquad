'use strict'

@LoginCtrl = @controllerModule.controller 'LoginCtrl',  ($scope, AuthService) ->

  $scope.user = {}

  $scope.login = ->
    AuthService.login($scope.user)

@LoginCtrl.$inject = ['$scope', 'AuthService']