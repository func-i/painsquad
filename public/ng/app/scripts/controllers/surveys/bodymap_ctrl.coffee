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

  $scope.saveDualSelection = (painRegion) ->
    # choose-your-own-hacky-child-scope-lookup-adventure :((
    # tempObj        = $scope.$$childTail.tempSelections
    childElement     = angular.element(document).find('body-map-dual').scope().$parent # <-- the worst
    tempObj          = childElement.tempSelections
    mergedSelections = tempObj.first.concat tempObj.second
    if mergedSelections.length
      $scope.selections[painRegion] = mergedSelections

]