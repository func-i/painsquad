'use strict'

@controllerModule.controller "BodymapCtrl", ['$scope', '$state', 'BodymapService', ($scope, $state, BodymapService) ->
  $scope.selections = BodymapService.getSelections()

  $scope.contentSaved = (painRegion) ->
    BodymapService.anyElementsInRegion(painRegion.toLowerCase())

  $scope.saveSelection = (painRegion) ->
    return if _.isUndefined(@tempSelections)
    $scope.selections[painRegion] = @tempSelections

  $scope.saveDualSelection = (painRegion) ->
    # hacky scope lookup :/
    # tempObj        = $scope.$$childTail.tempSelections
    childElement     = angular.element(document).find('body-map-dual').scope().$parent
    tempObj          = childElement.tempSelections
    mergedSelections = tempObj.first.concat tempObj.second
    $scope.selections[painRegion] = mergedSelections

]
