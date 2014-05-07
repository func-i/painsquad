'use strict'

# TODO: preserve visual selections through partials & state rendering/re-rendering
# TODO: preserve visual selections through ng-switch changes
@controllerModule.controller "BodymapCtrl", ['$scope', '$state', 'BodymapService', ($scope, $state, BodymapService) ->
  $scope.selections     = BodymapService.getSelections()
  # $scope.tempSelections = []

  $scope.contentSaved = (painRegion) ->
    BodymapService.anyElementsInRegion(painRegion.toLowerCase())

  $scope.clearSelection = (painRegion) ->
    BodymapService.clearRegion(painRegion)

  $scope.saveSelection = (painRegion) ->
    $scope.selections[painRegion] = @tempSelections

]
