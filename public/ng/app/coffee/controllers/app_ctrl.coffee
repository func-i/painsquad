'use strict'

@AppCtrl = @controllerModule.controller 'AppCtrl', ($scope, $state, $ionicModal) ->

  $ionicModal.fromTemplateUrl "templates/shared/login.html", (modal) ->
    $scope.loginModal = modal
  ,
    scope: $scope
    animation: "slide-in-up"
    focusFirstInput: true

  $scope.$on "$destroy", ->
    $scope.loginModal.remove()

@AppCtrl.$inject = [ '$scope', '$state', '$ionicModal' ]
