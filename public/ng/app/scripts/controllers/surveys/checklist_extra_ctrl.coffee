'use strict'

@controllerModule.controller "ChecklistExtraCtrl", ['$scope', '$state', '$stateParams', ($scope, $state, $stateParams) ->

  # convenience method to pass choice object to dynamic checklist detail view
  $scope.goToDetailedView = (choice) ->
    if choice.content is 'None'
      $scope.deselectElements()
      console.log "None selected, doing stuff here"
    else
      $state.go('app.checklist-detail', { 'choice': choice.content })

  # $scope.isNotNone = (choice) ->
  #   debugger
  #   choice.content isnt 'None'
  $scope.isNotNone = () ->
    if @choice.content is 'None'
      false
    else
      true

  $scope.deselectElements = () ->
    _.each $scope.question.choices, (choice) ->
      if choice.content isnt 'None'
        choice.selected = false

  # console.log "Checklist Extra Ctrl instantiated!"
  # $scope.choice = $stateParams.choice
]
