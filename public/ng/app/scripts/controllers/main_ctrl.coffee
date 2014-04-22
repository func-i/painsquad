'use strict'

@MainCtrl = @controllerModule.controller 'MainCtrl', ($scope, $stateParams, ApiService) ->

  ApiService.getThing(1)
  .success (data) ->
    $scope.data = data
  .error (data) ->
    $scope.data = data

  # ApiService.getThings()
  # .success (data) ->
  #   $scope.data = data
  # .error (data) ->
  #   $scope.data = data
