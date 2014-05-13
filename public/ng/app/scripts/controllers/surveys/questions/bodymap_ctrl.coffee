'use strict'

@BodymapCtrl = @controllerModule.controller "BodymapCtrl", ($scope, $state, BodymapService, $ionicModal) ->
  $scope.selections = BodymapService.getSelections()

   # register modal and setup scope
  $ionicModal.fromTemplateUrl "templates/surveys/question_types/modals/bodymap-modal.html", (modal) ->
    $scope.modal = modal
  ,
    animation: "slide-in-up"
    scope: $scope

  $scope.$on '$destroy', ->
    $scope.modal.remove()

  # set current selection into 'painRegion' scope so modal can access it
  # loads existing selections from $scope.selections (if any) or creates empty array
  $scope.loadModal = (painRegion) ->
    $scope.painRegion = painRegion
    $scope.painRegion.tempSelections = []
    # $scope.painRegion.tempSelections = $scope.selections[painRegion.content.toLowerCase()] || []
    $scope.modal.show()

  # loads svg partial based on painRegion
  $scope.getBodymapPartial = (painRegion) ->
    return unless painRegion?
    switch painRegion.content
      when 'Head'
        "templates/surveys/question_types/bodymap/head.html"
      when 'Legs'
        "templates/surveys/question_types/bodymap/legs.html"
      when 'Torso'
        "templates/surveys/question_types/bodymap/torso.html"
      when 'Arms'
        "templates/surveys/question_types/bodymap/arms.html"

  $scope.contentSaved = (painRegion) ->
    false
    # anyElements = BodymapService.anyElementsInRegion(painRegion.toLowerCase())
    # $scope.$emit 'currentForm:valid' if anyElements
    # anyElements

  $scope.saveChanges = (painRegion) ->
    return unless painRegion?
    region = painRegion.content.toLowerCase()
    $scope.selections[region] = painRegion.tempSelections
    $scope.modal.hide()

  $scope.discardChanges = (painRegion) ->
    $scope.modal.hide()


  # $scope.saveSelection = (painRegion) ->
  #   return unless @tempSelections?
  #   $scope.selections[painRegion] = @tempSelections

  # $scope.saveDualSelection = (painRegion) ->
  #   $scope.$broadcast 'requestSelections'

  # $scope.$on 'dualSelections', (event, data) ->
  #   mergedSelections = data.first.concat data.second
  #   if mergedSelections.length
  #     $scope.selections[data.region] = mergedSelections

@BodymapCtrl.$inject = ['$scope', '$state', 'BodymapService', '$ionicModal']
