'use strict'

@controllerModule.controller "ChecklistCtrl", ['$scope', '$state', ($scope, $state) ->
  $scope.disableAll = false

  # de-selects and disables all
  $scope.toggleDisableAll = () ->
    _.each $scope.question.choices, (choice) ->
      choice.selected = false
    $scope.disableAll = !$scope.disableAll

]
