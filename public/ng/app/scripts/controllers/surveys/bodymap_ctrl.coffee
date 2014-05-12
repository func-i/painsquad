'use strict'

@controllerModule.controller "BodymapCtrl", ['$scope', '$state', 'BodymapService', ($scope, $state, BodymapService) ->
  $scope.selections = BodymapService.getSelections()

  $scope.contentSaved = (painRegion) ->
    anyElements = BodymapService.anyElementsInRegion(painRegion.toLowerCase())
    $scope.$emit 'currentForm:valid' if anyElements
    anyElements

  $scope.saveSelection = (painRegion) ->
    return unless @tempSelections?
    $scope.selections[painRegion] = @tempSelections

  $scope.saveDualSelection = (painRegion) ->
    $scope.$broadcast 'requestSelections'

  $scope.$on 'dualSelections', (event, data) ->
    mergedSelections = data.first.concat data.second
    if mergedSelections.length
      $scope.selections[data.region] = mergedSelections

]
