'use strict'

@BodymapModalCtrl = @controllerModule.controller "BodymapModalCtrl", ($scope, $state) ->
  console.log "Bodymap Modal Ctrl Instantiated"
  $scope.tempSelections =
    head:  []
    torso: []
    arms:  []
    legs:  []

  # loads svg partial based on painRegion
  $scope.getBodymapPartial = ->
    return unless $scope.painRegion?
    switch $scope.painRegion.content
      when 'Head'
        "templates/surveys/question_types/bodymap/head.html"
      when 'Legs'
        "templates/surveys/question_types/bodymap/legs.html"
      when 'Torso'
        "templates/surveys/question_types/bodymap/torso.html"
      when 'Arms'
        "templates/surveys/question_types/bodymap/arms.html"

  $scope.saveTempSelections = (painRegion) ->
    $scope.$emit 'saveSelections', painRegion, $scope.tempSelections[painRegion]
    $scope.modal.hide()

  $scope.discardTempSelections = (painRegion)->
    $scope.tempSelections = angular.copy($scope.$parent.selections)
    $scope.modal.hide()

  # $scope.$on 'setModalSelections', (event, data) ->
  #   return unless data?
  #   debugger
  #   $scope.tempSelections[data.region] = data.payload

@BodymapModalCtrl.$inject = ['$scope', '$state', '$ionicModal', 'BodymapService']
