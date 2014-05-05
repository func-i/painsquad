'use strict'

@controllerModule.controller "BodymapCtrl", ['$scope', '$state', 'BodymapService', ($scope, $state, BodymapService) ->
  selectedFill      = "#1CAFD5"
  unselectedFill    = "#DDC9B2"
  $scope.selections = BodymapService.getSelections()

  # TODO: preserve selections for partials (switching between front/back doesn't preserve state)
  $scope.toggleSelection = () ->
    return unless event.target
    parentNode = event.target.parentNode.id
    element    = event.target.id
    debugger
    if BodymapService.elementInSelection(parentNode, element)
      BodymapService.removeSelection(parentNode, element)
      event.target.setAttribute('fill', unselectedFill)
    else
      BodymapService.addSelection(parentNode, element)
      event.target.setAttribute('fill', selectedFill)

  $scope.clearSelection = (pain_region) ->
    BodymapService.clearRegion(pain_region)

]
