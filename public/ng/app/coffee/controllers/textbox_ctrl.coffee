'use strict'

@TextboxCtrl = @controllerModule.controller "TextboxCtrl", ($scope, $state, $stateParams) ->
  $scope.showSubmitButton = true
  $scope.showNextButton   = false

@TextboxCtrl.$inject = ['$scope', '$state', '$stateParams']
