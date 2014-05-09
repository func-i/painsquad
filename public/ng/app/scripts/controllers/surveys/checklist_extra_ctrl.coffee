'use strict'

@ChecklistExtraCtrl = @controllerModule.controller "ChecklistExtraCtrl", ($scope, $state, $stateParams) ->

  # convenience method to pass choice object to checklist detail view
  $scope.goToSectionOrDisable = ->
    if @choice.can_disable
      $scope.disableAllChoices()
    else
      $state.go('app.checklist-detail', { 'choice': @choice.id })

  $scope.isNotNone = ->
    if @choice.can_disable then false else true

  $scope.disableAllChoices = ->
    _.each $scope.question.choices, (choice) ->
      unless choice.can_disable
        choice.selected = false
        choice.disabled = !choice.disabled

  $scope.atLeastOne = ->
    atLeastOne = _.some $scope.question.choices, (choice) ->
      choice.selected
    !atLeastOne

  $scope.saveDetailSelection = (choice_id, detailData) ->
    debugger


@ChecklistExtraCtrl.$inject = ['$scope', '$state', '$stateParams']
