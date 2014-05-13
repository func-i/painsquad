'use strict'

@BodymapCtrl = @controllerModule.controller "BodymapCtrl", ($scope, $state, $ionicModal, BodymapService) ->
  console.log "Bodymap Ctrl Instantiated"
  $scope.selections = BodymapService.getSelections()

  # register modal and setup scope
  $ionicModal.fromTemplateUrl "templates/surveys/question_types/bodymap-modal.html", (modal) ->
    $scope.modal = modal
  ,
    animation: "slide-in-up"
    scope: $scope

  $scope.$on '$destroy', ->
    $scope.modal.remove()

  $scope.$on 'saveSelections', (event, painRegion, selectionData) ->
    return unless selectionData?
    $scope.selections[painRegion] = selectionData

  # set current selection into 'painRegion' scope so modal can access it
  $scope.loadModal = (painRegion) ->
    $scope.painRegion = painRegion
    $scope.modal.show()

  # checks if elements in painRegion to display valid selections checkmark
  $scope.contentSaved = (painRegion) ->
    return unless painRegion?
    if BodymapService.anyElementsInRegion(painRegion.content.toLowerCase())
      $scope.$emit 'currentForm:valid'
      true

  # loads svg partial based on painRegion
  $scope.getBodymapPartial = ->
    return unless $scope.painRegion?
    switch $scope.painRegion.content
      when 'Head'
        "templates/surveys/question_types/bodymap/head.html"
      when 'Legs'
        "templates/surveys/question_types/bodymap/legs.html"
      when 'Torso'
        "templates/surveys/question_types/bodymap/torso.html"
      when 'Arms'
        "templates/surveys/question_types/bodymap/arms.html"

  $scope.saveTempSelections = (painRegion) ->
    # $scope.$emit 'saveSelections', painRegion, $scope.tempSelections[painRegion]
    $scope.modal.hide()

  $scope.discardTempSelections = (painRegion)->
    # $scope.tempSelections = angular.copy($scope.$parent.selections)
    $scope.modal.hide()

@BodymapCtrl.$inject = ['$scope', '$state', '$ionicModal', 'BodymapService']
