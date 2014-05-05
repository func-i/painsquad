'use strict'

@controllerModule.controller "BodymapCtrl", ['$scope', '$state', 'BodymapService', ($scope, $state, BodymapService) ->
  selectedFill      = "#1CAFD5"
  unselectedFill    = "#DDC9B2"

  $scope.init = () ->
    debugger
    $scope.selections = BodymapService.init()

  # TODO: preserve selections for partials (switching between front/back doesn't preserve state)
  # toggles selected regions in SVGs
  $scope.toggleSelection = () ->
    return unless event.target
    parentNode = event.target.parentNode.parentNode.id.toLowerCase()
    element    = event.target.id
    if BodymapService.elementInSelection(parentNode, element)
      BodymapService.removeSeletion(parentNode, element)
      event.target.setAttribute('fill', unselectedFill)
    else
      BodymapService.addSelection(parentNode, element)
      event.target.setAttribute('fill', selectedFill)

  # start er up
  $scope.init()

]
