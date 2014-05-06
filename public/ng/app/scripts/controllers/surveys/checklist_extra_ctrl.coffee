'use strict'

@controllerModule.controller "ChecklistExtraCtrl", ['$scope', '$state', '$stateParams', ($scope, $state, $stateParams) ->

  # convenience method to pass choice object to dynamic checklist detail view
  $scope.goToDetailedView = () ->
    if @choice.content is 'None'
      $scope.deselectAll()
    else
      $state.go('app.checklist-detail', { 'choice': choice.content })

  $scope.deselectAll = () ->
  _.each $scope.question.choices, (choice) ->
    choice.selected = false unless choice.content is 'None'

  $scope.isNotNone = () ->
    if @choice.content is 'None' then false else true

  # $scope.deselectElements = () ->
  #   debugger
  #   _.each $scope.question.choices, (choice) ->
  #     if choice.content isnt 'None'
  #       choice.selected = false

  # # add/removes item from $scope.selection array
  # # triggers disableAll if 'None' selected
  # $scope.disableIfChosenNone = (choice) ->
  #   if choice.content is 'None'
  #     $scope.toggleAllChoiceDisabled()

  # $scope.toggleAllChoiceDisabled = () ->
  #   _.each $scope.question.choices, (choice) ->
  #     choice.disabled = !choice.disabled if choice.content isnt 'None'
  #   $scope.deselectElements()

  # $scope.deselectElements = () ->
  #   _.each $scope.question.choices, (choice) ->
  #     if choice.content isnt 'None'
  #       choice.selected = false

  # $scope.atLeastOneSelected = (choices) ->
  #   atLeastOne = _.some choices, (choice) ->
  #     choice.selected
  #   !atLeastOne

]
