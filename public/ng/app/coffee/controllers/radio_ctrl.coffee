'use strict'

@RadioCtrl = @controllerModule.controller "RadioCtrl", ($scope, $state) ->

  $scope.deselectOther = (selectedChoice) ->
    for choice in $scope.question.choices
      choice.selected = false unless choice is selectedChoice

  $scope.preventDeselect = (selectedChoice) ->
    return true if selectedChoice.selected


@RadioCtrl.$inject = ['$scope', '$state']
