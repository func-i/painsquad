'use strict'

@controllerModule.controller "BodymapCtrl", ['$scope', '$state', 'BodymapService', ($scope, $state, BodymapService) ->
  $scope.selections     = BodymapService.getSelections()

  $scope.contentSaved = (painRegion) ->
    BodymapService.anyElementsInRegion(painRegion.toLowerCase())

  $scope.saveSelection = (painRegion) ->
    return if _.isUndefined(@tempSelections)
    $scope.selections[painRegion] = @tempSelections

  $scope.saveDualSelection = (painRegion) ->
    # should we use $emit instead of accessing $$childTail (incorrect!)
    tempObj                       = $scope.$$childTail.tempSelections
    mergedSelections              = tempObj.first.concat tempObj.second
    $scope.selections[painRegion] = mergedSelections

]
