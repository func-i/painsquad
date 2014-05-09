'use strict'

@ChecklistDetailCtrl = @controllerModule.controller 'ChecklistDetailCtrl', ($scope, $state, $stateParams, ChecklistExtraService) ->

  findById = (id) ->
    $scope.choiceItem = ChecklistExtraService.findById(id)

  $scope.saveSelection = ->
    ChecklistExtraService.saveDetailInformation($scope.choiceItem.id, $scope.detailData)

  findById($stateParams.choice)

  $scope.detailData =
    isOther:         if $scope.choiceItem.textfield then true else false
    otherMedication: ""
    currentValue:    1
    sliderDisabled:  false

@ChecklistDetailCtrl.$inject = ['$scope', '$state', '$stateParams', 'ChecklistExtraService']
