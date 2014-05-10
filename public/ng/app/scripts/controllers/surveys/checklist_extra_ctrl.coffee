'use strict'

@ChecklistExtraCtrl = @controllerModule.controller "ChecklistExtraCtrl", ($scope, $state, $stateParams, $ionicModal) ->
  $scope.detailData =
    currentChoice = {}

  $ionicModal.fromTemplateUrl "templates/surveys/question_types/checklist-detail.html", (modal) ->
    $scope.modal = modal
  ,
    animation: "slide-in-up"
    scope: $scope

  # convenience method to pass choice object to checklist detail view
  $scope.goToSectionOrDisable = (choice) ->
    if @choice.can_disable
      $scope.disableAllChoices()
    else
      $scope.detailData.currentChoice = choice
      $scope.modal.show()

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

  $scope.saveDetails = (choice) ->
    choice.selected = true
    $scope.modal.hide()

  $scope.discardDetails = (choice) ->
    choice.selected = false
    $scope.modal.hide()


@ChecklistExtraCtrl.$inject = ['$scope', '$state', '$stateParams', '$ionicModal']
