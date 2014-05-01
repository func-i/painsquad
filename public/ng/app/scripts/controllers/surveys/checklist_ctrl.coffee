'use strict'

@controllerModule.controller "ChecklistCtrl", ['$scope', '$state', ($scope, $state) ->
  $scope.selection  = []
  $scope.disableAll = false

  # add/removes item from $scope.selection array
  # triggers disableAll if 'None' selected
  $scope.toggleSelection = (choice) ->
    idx = $scope.selection.indexOf(choice)
    if idx > -1
      $scope.selection.splice(idx, 1)
    else
      $scope.selection.push(choice)
    $scope.disableAllSelections() if choice.content is 'None'
    console.log $scope.selection

  $scope.disableAllSelections = () ->
    $scope.disableAll = !$scope.disableAll
    $scope.deselectElements()
    $scope.removeFromSelection()

  # removes elements from selection array
  $scope.removeFromSelection = () ->
    _.each $scope.selection, (item) ->
      if item.content isnt 'None'
        idx = $scope.selection.indexOf(item)
        $scope.selection.splice(idx, 1)

  # deselects elements in the actual form
  $scope.deselectElements = () ->
    _.each $scope.question.choices, (choice) ->
      if choice.content isnt 'None'
        choice.selected = false


    # $scope.toggleDisableAll() if choice.content is 'None'

  # disables all checkboxes except the 'None'
  # removes them from $scope.selection
  # $scope.toggleDisableAll = () ->
  #   $scope.disableAll = !$scope.disableAll
  #   $scope.disableAllSelections()

  # $scope.disableAllSelections = () ->
  #   _.each $scope.question.choices, (choice) ->
  #     if choice.content is 'None'
  #       $scope.addToSelection(choice)
  #     else
  #       choice.selected = false

  # $scope.addToSelection = (choice) ->
  #   $scope.selection.push(choice)

]
