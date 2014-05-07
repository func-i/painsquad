'use strict'

@controllerModule.controller 'ChecklistDetailCtrl', ['$scope', '$state', '$stateParams', ($scope, $state, $stateParams) ->

  $scope.choice = $stateParams.choice

  $scope.detailData =
    isOther:         (if $scope.choice is 'Other' then true else false)
    otherMedication: ""
    currentValue:    1
    sliderDisable:   false

  # how do this properly? emit/watch? shared service?
  $scope.saveSelection = () ->
    if @detailData.sliderDisable
      # TODO: save this selections 'value' as nil/NA ?
      console.log "Saving value as N/A"
    else
      # TODO: save selections value as slider value
      console.log "Saving value as #{@detailData.currentValue}"

]
