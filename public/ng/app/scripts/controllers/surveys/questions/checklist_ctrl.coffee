'use strict'

@controllerModule.controller "ChecklistCtrl", ['$scope', '$state', ($scope, $state) ->

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

  # TODO: remove underscore depencency and clean this up
  $scope.atLeastOne = ->
    atLeastOne = _.some $scope.question.choices, (choice) ->
      if choice.textfield
        choice.selected && choice.value && choice.value.length > 5
      else
        choice.selected
    !atLeastOne

]
