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

]
