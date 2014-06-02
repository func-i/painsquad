'use strict'

@ChecklistExtraCtrl = @controllerModule.controller "ChecklistExtraCtrl", ($scope, $state, $stateParams, $ionicModal) ->
  $scope.detailData =
    currentChoice = {}

  $ionicModal.fromTemplateUrl "templates/surveys/question_types/modals/checklist-detail.html", (modal) ->
    $scope.modal = modal
  ,
    animation: "slide-in-up"
    scope: $scope

  # $scope.$on '$destroy', ->
  $scope.$on '$stateChangeStart', ->
    $scope.modal.remove()

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
    for choice in $scope.question.choices
      unless choice.can_disable
        choice.selected = false
        choice.disabled = !choice.disabled

  # TODO: remove underscore depencency and clean this up
  $scope.atLeastOne = ->
    atLeastOne = _.some $scope.question.choices, (choice) ->
      if choice.textfield
        choice.selected && choice.custom_text && choice.custom_text.length > 5
      else
        choice.selected
    !atLeastOne

@ChecklistExtraCtrl.$inject = ['$scope', '$state', '$stateParams', '$ionicModal']
