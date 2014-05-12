'use strict'

@controllerModule.controller "ChecklistCtrl", ['$scope', '$state', ($scope, $state) ->

  # add/removes item from $scope.selection array
  # triggers disableAll if 'None' selected
  $scope.disableIfNone = ->
    if @choice.can_disable
      $scope.disableAllChoices()

  $scope.disableAllChoices = ->
    _.each $scope.question.choices, (choice) ->
      unless choice.can_disable
        choice.selected = false
        choice.disabled = !choice.disabled

  $scope.atLeastOne = ->
    atLeastOne = _.some $scope.question.choices, (choice) ->
      if choice.textfield
        choice.selected && choice.value && choice.value.length > 5
      else
        choice.selected
    !atLeastOne

]
