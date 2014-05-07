'use strict'

# TODO: preserve visual selections through partials & state rendering/re-rendering
# TODO: preserve visual selections through ng-switch changes
@controllerModule.controller "BodymapCtrl", ['$scope', '$state', 'BodymapService', ($scope, $state, BodymapService) ->
  $scope.selections = BodymapService.getSelections()
  #$scope.headSelections = {}

  $scope.contentSaved = (region) ->
    BodymapService.anyElementsInRegion(region.toLowerCase())

  $scope.clearSelection = (pain_region) ->
    BodymapService.clearRegion(pain_region)

  $scope.saveSelection = (pain_region, currentSelections) ->
    $scope.selections = _.clone $scope.currentSelections
    $scope.currentSelections.length = 0

]
