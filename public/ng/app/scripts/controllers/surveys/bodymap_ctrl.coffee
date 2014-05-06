'use strict'

# TODO: preserve visual selections through partials & state rendering/re-rendering
# TODO: preserve visual selections through ng-switch changes
@controllerModule.controller "BodymapCtrl", ['$scope', '$state', 'BodymapService', ($scope, $state, BodymapService) ->
  $scope.selections = BodymapService.getSelections()

  $scope.contentSaved = (region) ->
    BodymapService.anyElementsInRegion(region.toLowerCase())

  $scope.clearSelection = (pain_region) ->
    BodymapService.clearRegion(pain_region)

  $scope.saveSelection = (pain_region, currentSelections) ->
    console.log "here is where we save selections to BodymapService"
    console.log pain_region
    console.log currentSelections

]
