'use strict'

@controllerModule.controller "BodymapCtrl", ['$scope', '$state', 'BodymapService', ($scope, $state, BodymapService) ->
  $scope.selections = BodymapService.getSelections()

  $scope.contentSaved = (painRegion) ->
    anyElements = BodymapService.anyElementsInRegion(painRegion.toLowerCase())
    $scope.$emit 'currentForm:valid' if anyElements
    anyElements

  $scope.saveSelection = (painRegion) ->
    return if _.isUndefined(@tempSelections)
    $scope.selections[painRegion] = @tempSelections

  # TODO: Fix bug where region is re-selected and 'save' is clicked with nothing selected, resets selections to nothing
  # SHITTY BUG YO
  $scope.saveDualSelection = (painRegion) ->
    # choose-your-own-hacky-child-scope-lookup-adventure :((
    # tempObj    = $scope.$$childTail.tempSelections
    childElement = angular.element(document).find('body-map-dual').scope().$parent
    tempObj      = childElement.tempSelections
    # return if _.isEmpty(tempObj.first) && _.isEmpty(tempObj.second)
    mergedSelections = tempObj.first.concat tempObj.second
    $scope.selections[painRegion] = mergedSelections

]
