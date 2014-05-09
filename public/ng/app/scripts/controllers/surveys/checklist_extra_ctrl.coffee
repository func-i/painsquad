'use strict'

@controllerModule.controller "ChecklistExtraCtrl", ['$scope', '$state', '$stateParams', ($scope, $state, $stateParams) ->
  console.log "Checklist Extra Ctrl instantiated"

  # convenience method to pass choice object to dynamic checklist detail view
  $scope.goToSectionOrDisable = () ->
    if @choice.can_disable
      $scope.disableAllChoices()
    else
      $state.go('app.checklist-detail', { 'choice': @choice.content })

  $scope.isNotNone = () ->
    if @choice.can_disable then false else true

  $scope.disableAllChoices = () ->
    _.each $scope.question.choices, (choice) ->
      unless choice.can_disable
        choice.selected = false
        choice.disabled = !choice.disabled

  $scope.atLeastOne = () ->
    atLeastOne = _.some $scope.question.choices, (choice) ->
      choice.selected
    !atLeastOne

  $scope.$on 'saveDetails', (event, data) ->
    debugger

]
