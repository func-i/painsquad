'use strict'

@ChecklistGridCtrl = @controllerModule.controller "ChecklistGridCtrl", ($scope, $state) ->

  $scope.atLeastOne = ->
    inverse = null
    for choice in $scope.question.choices
      if choice.textfield
        inverse = true if choice.selected and choice.value and choice.value.length >= 5
      else if choice.selected
        inverse = true
    !inverse


@ChecklistGridCtrl.$inject = ['$scope', '$state']
