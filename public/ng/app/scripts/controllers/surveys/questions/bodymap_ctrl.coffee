'use strict'

@BodymapCtrl = @controllerModule.controller "BodymapCtrl",  ($scope, $state, $ionicModal, BodymapService) ->
  $scope.selections     = BodymapService.getSelections()
  $scope.modalSelection =
    choice:         {}
    tempSelections: []

  $ionicModal.fromTemplateUrl("templates/surveys/question_types/modals/bodymap-modal.html",
    scope: $scope
    animation: "slide-in-up"
  ).then (modal) ->
    $scope.modal = modal

  $scope.contentSaved = (painRegion) ->
    if BodymapService.anyElementsInRegion(painRegion.toLowerCase())
      $scope.$emit 'currentForm:valid'
      true

  # $scope.saveSelection = (painRegion) ->
  #   return unless @tempSelections?
  #   $scope.selections[painRegion] = @tempSelections

  # $scope.saveDualSelection = (painRegion) ->
  #   $scope.$broadcast 'requestSelections'

  # $scope.$on 'dualSelections', (event, data) ->
  #   mergedSelections = data.first.concat data.second
  #   if mergedSelections.length
  #     $scope.selections[data.region] = mergedSelections

  # MODAL STUFF
  $scope.openModal = (choice) ->
    $scope.modalSelection.choice = choice
    # load persisted selections, if any
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

  $scope.renderBodymapPartial = ->
    return unless $scope.modalSelection.choice.content?
    "templates/surveys/question_types/bodymap/#{getPainRegion()}.html"

  getPainRegion = ->
    $scope.modalSelection.choice.content.toLowerCase()

  resetModalSelection = ->
    $scope.modalSelection =
      choice:         {}
      tempSelections: []

  $scope.$on "$destroy", ->
    $scope.modal.remove()

@BodymapCtrl.$inject = ['$scope', '$state', '$ionicModal', 'BodymapService']
