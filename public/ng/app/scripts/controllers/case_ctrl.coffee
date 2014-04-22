'use strict'

@CaseCtrl = @controllerModule.controller 'CaseCtrl', ($scope, $stateParams, ApiService) ->
  $scope.cases = [
    {
      title: 'Pain'
      id: 1
    }
    {
      title: 'Fever'
      id: 2
    }
    {
      title: 'Aches'
      id: 3
    }
  ]

  $scope.pain = {}
