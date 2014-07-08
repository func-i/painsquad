'use strict'

@BodymapCtrl = @controllerModule.controller "BodymapCtrl",  ($scope, $state, $ionicModal, BodymapService) ->
  $scope.selections     = BodymapService.getSelections()
  $scope.modalSelection =
    choice:         {}
    tempSelections: []

  $ionicModal.fromTemplateUrl "templates/surveys/questions/modal.bodymap.html",
    scope: $scope
    animation: "slide-left-right"
  .then (modal) ->
    $scope.modal = modal

  $scope.$on '$destroy', ->
    $scope.modal.remove()

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
    "templates/surveys/questions/bodymap.#{getPainRegion()}.html"

  # convenience method to pass around pain region
  getPainRegion = ->
    $scope.modalSelection.choice.content.toLowerCase()

  # resets modalSelection on modal.hide event
  resetModalSelection = ->
    $scope.modalSelection =
      choice:         {}
      tempSelections: []

  # INIT
  $scope.$emit 'currentForm:invalid'

@BodymapCtrl.$inject = ['$scope', '$state', '$ionicModal', 'BodymapService']