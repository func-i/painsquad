'use strict'

@controllerModule.controller "ChecklistCtrl", ['$scope', '$state', ($scope, $state) ->

  # add/removes item from $scope.selection array
  # triggers disableAll if 'None' selected
  $scope.disableIfNone = () ->
    if @choice.content is 'None'
      $scope.disableAllChoices()

  $scope.disableAllChoices = () ->
    _.each $scope.question.choices, (choice) ->
      unless choice.content is 'None'
        choice.disabled = !choice.disabled
      # choice.disabled = !choice.disabled unless choice.content is 'None'

  # $scope.toggleSelections = (choices) ->
  #   _.each choices, (choice) ->
  #     if choice.content isnt 'None'
  #       choice.selected = false
  #       choice.disabled = !choice.disabled

  $scope.atLeastOne = () ->
    atLeastOne = _.some $scope.question.choices, (choice) ->
      choice.selected
    !atLeastOne

]
