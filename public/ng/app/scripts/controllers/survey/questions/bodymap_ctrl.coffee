'use strict'

@BodymapCtrl = @controllerModule.controller "BodymapCtrl", ($scope, $state, $ionicModal, BodymapService) ->
  $scope.selections = BodymapService.getSelections()
  $scope.tempSelections =
    {}

  $ionicModal.fromTemplateUrl "templates/surveys/question_types/bodymap-modal.html", (modal) ->
    $scope.modal = modal
  ,
    animation: "slide-in-up"
    scope: $scope

  $scope.$on '$destroy', ->
    $scope.modal.remove()

  $scope.loadModal = (painRegion) ->
    $scope.tempSelections = painRegion
    $scope.modal.show()

  $scope.saveTempSelections = (tempSelections) ->
    debugger
    $scope.modal.hide()

  $scope.discardTempSelections = ->
    $scope.modal.hide()

  $scope.getBodymapPartial = (painRegion) ->
    if painRegion.content is 'Head' || painRegion.content is 'Legs'
      "templates/surveys/question_types/bodymap/bodymap-single.html"
    else if painRegion.content is 'Torso' || painRegion.content is 'Arms'
      "templates/surveys/question_types/bodymap/bodymap-dual.html"
    else
      # do nothing

  $scope.contentSaved = (painRegion) ->
    anyElements = BodymapService.anyElementsInRegion(painRegion.toLowerCase())
    $scope.$emit 'currentForm:valid' if anyElements
    anyElements

  $scope.saveSelection = (painRegion) ->
    return if _.isUndefined(@tempSelections)
    $scope.selections[painRegion] = @tempSelections

  $scope.saveDualSelection = (painRegion) ->
    $scope.$broadcast 'requestSelections'

  $scope.$on 'dualSelections', (event, data) ->
    mergedSelections = data.first.concat data.second
    if mergedSelections.length
      $scope.selections[data.region] = mergedSelections

@BodymapCtrl.$inject = ['$scope', '$state', '$ionicModal', 'BodymapService']
