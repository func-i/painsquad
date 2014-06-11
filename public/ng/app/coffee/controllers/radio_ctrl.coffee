'use strict'

@RadioCtrl = @controllerModule.controller "RadioCtrl", ($scope, $state) ->

  $scope.deselectOtherSelections = (selectedChoice) ->
    for choice in $scope.question.choices
      choice.selected = false unless choice is selectedChoice


@RadioCtrl.$inject = ['$scope', '$state']
