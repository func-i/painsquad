'use strict'

@HeadCtrl = @controllerModule.controller "HeadCtrl", ($scope, $state) ->
  console.log "Modal Head Ctrl"
  $scope.selections = {}

@HeadCtrl.$inject = ['$scope', '$state', '$ionicModal', 'BodymapService']
