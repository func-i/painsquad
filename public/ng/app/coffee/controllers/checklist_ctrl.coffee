'use strict'

@ChecklistCtrl = @controllerModule.controller "ChecklistCtrl", ($scope, $state) ->

  # add/removes item from $scope.selection array
  # triggers disableAll if 'None' selected
  $scope.disableIfNone = ->
    if @choice.can_disable
      $scope.disableAllChoices()

  $scope.disableAllChoices = ->
    for choice in $scope.question.choices
      unless choice.can_disable
        choice.selected = false
        choice.disabled = !choice.disabled

  $scope.atLeastOne = ->
    inverse = null
    for choice in $scope.question.choices
      if choice.textfield
        inverse = true if choice.selected and choice.value and choice.value.length > 5
      else if choice.selected
        inverse = true
    !inverse

@ChecklistCtrl.$inject = ['$scope', '$state']
