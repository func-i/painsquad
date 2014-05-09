'use strict'

@controllerModule.controller "ChecklistExtraCtrl", ['$scope', '$state', '$stateParams', ($scope, $state, $stateParams) ->
  console.log "Checklist Extra Ctrl instantiated"

  # convenience method to pass choice object to dynamic checklist detail view
  $scope.goToSectionOrDisable = () ->
    if @choice.content is 'None'
      $scope.disableAllChoices()
    else
      $state.go('app.checklist-detail', { 'choice': @choice.content })

  $scope.isNotNone = () ->
    if @choice.content is 'None' then false else true

  $scope.disableAllChoices = () ->
    _.each $scope.question.choices, (choice) ->
      if choice.content isnt 'None'
        choice.selected = false
        choice.disabled = !choice.disabled

  $scope.atLeastOne = () ->
    atLeastOne = _.some $scope.question.choices, (choice) ->
      choice.selected
    !atLeastOne

  $scope.$on 'saveDetails', (event, data) ->
    debugger

]
