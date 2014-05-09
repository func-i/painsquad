'use strict'

@controllerModule.controller 'ChecklistDetailCtrl', ['$scope', '$state', '$stateParams', ($scope, $state, $stateParams) ->
  console.log "Checklist Detail Ctrl instantiated"

  $scope.choice = $stateParams.choice

  $scope.detailData =
    isOther:         (if $scope.choice is 'Other' then true else false)
    otherMedication: ""
    currentValue:    1
    sliderDisabled:  false

  # how do this properly? emit/watch? shared service?
  $scope.saveSelection = () ->
    $scope.$emit 'saveDetails', @detailData
    # if @detailData.sliderDisable
    #   # TODO: save this selections 'value' as nil/NA ?
    #   console.log "Saving value as N/A"
    # else
    #   # TODO: save selections value as slider value
    #   console.log "Saving value as #{@detailData.currentValue}"

]
