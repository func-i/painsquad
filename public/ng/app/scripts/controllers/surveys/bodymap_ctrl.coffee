'use strict'

# TODO: preserve visual selections through partials & state rendering/re-rendering
# TODO: preserve visual selections through ng-switch changes
@controllerModule.controller "BodymapCtrl", ['$scope', '$state', 'BodymapService', ($scope, $state, BodymapService) ->
  selectedFill      = "#1CAFD5"
  unselectedFill    = "#DDC9B2"
  $scope.selections = BodymapService.getSelections()

  # TODO: preserve selections for partials (switching between front/back doesn't preserve state)
  $scope.toggleSelection = () ->
    return unless event.target
    parentNode = event.target.parentNode.id
    element    = event.target.id
    if BodymapService.elementInSelection(parentNode, element)
      BodymapService.removeSelection(parentNode, element)
      event.target.setAttribute('fill', unselectedFill)
    else
      BodymapService.addSelection(parentNode, element)
      event.target.setAttribute('fill', selectedFill)

  $scope.contentSaved = (region) ->
    BodymapService.anyElementsInRegion(region.toLowerCase())

  $scope.clearSelection = (pain_region) ->
    BodymapService.clearRegion(pain_region)

]
