'use strict'

@BodymapCtrl = @controllerModule.controller "BodymapCtrl",  ($scope, $state, $ionicModal, BodymapService) ->
  $scope.selections     = BodymapService.getSelections()
  $scope.modalSelection =
    choice:         {}
    tempSelections: []

  $ionicModal.fromTemplateUrl "templates/surveys/question_types/modals/bodymap-modal.html",
    scope: $scope
    animation: "slide-in-up"
  .then (modal) ->
    $scope.modal = modal

  $scope.contentSaved = (painRegion) ->
    return unless painRegion?
    if BodymapService.anyElementsInRegion(painRegion.toLowerCase())
      $scope.$emit 'currentForm:valid'
      true

  $scope.openModal = (choice) ->
    $scope.modalSelection.choice = choice
    $scope.modalSelection.tempSelections = angular.copy($scope.selections[getPainRegion()])
    $scope.modal.show()

  # saves modalSelections to master selections
  $scope.saveModalSelections = ->
    $scope.selections[getPainRegion()] = $scope.modalSelection.tempSelections
    resetModalSelection()
    $scope.modal.hide()

  # resets modalSelection object and close modal
  $scope.discardModalSelections = ->
    resetModalSelection()
    $scope.modal.hide()

  # render bodymap partial from selected pain region
  $scope.renderBodymapPartial = ->
    return unless $scope.modalSelection.choice.content?
    "templates/surveys/question_types/bodymap/#{getPainRegion()}.html"

  # convenience method to pass around pain region
  getPainRegion = ->
    $scope.modalSelection.choice.content.toLowerCase()

  # resets modalSelection on modal.hide event
  resetModalSelection = ->
    $scope.modalSelection =
      choice:         {}
      tempSelections: []

  # removes modal from memory when finished
  $scope.$on "$destroy", ->
    $scope.modal.remove()

@BodymapCtrl.$inject = ['$scope', '$state', '$ionicModal', 'BodymapService']
