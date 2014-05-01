'use strict'

@controllerModule.controller "ChecklistCtrl", ['$scope', '$state', ($scope, $state) ->

  # add/removes item from $scope.selection array
  # triggers disableAll if 'None' selected
  $scope.disableIfChosenNone = (choice) ->
    if choice.content is 'None'
      $scope.toggleAllChoiceDisabled()

  $scope.toggleAllChoiceDisabled = () ->
    _.each $scope.question.choices, (choice) ->
      choice.disabled = !choice.disabled if choice.content isnt 'None'
    $scope.deselectElements()

  $scope.deselectElements = () ->
    _.each $scope.question.choices, (choice) ->
      if choice.content isnt 'None'
        choice.selected = false

  $scope.atLeastOneSelected = (choices) ->
    atLeastOne = _.some choices, (choice) ->
      choice.selected
    !atLeastOne
]
