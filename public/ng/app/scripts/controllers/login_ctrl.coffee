'use strict'

@controllerModule.controller 'LoginCtrl', ['$scope', 'AuthService', ($scope, AuthService) ->

  $scope.user = {}

  $scope.login = ->
    AuthService.login($scope.user)
]