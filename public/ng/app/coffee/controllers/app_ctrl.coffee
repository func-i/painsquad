'use strict'

@AppCtrl = @controllerModule.controller 'AppCtrl', ($scope, $state, $ionicModal) ->

  $ionicModal.fromTemplateUrl "templates/shared/login.html", (modal) ->
    $scope.loginModal = modal
  ,
    scope: $scope
    animation: "slide-in-up"
    focusFirstInput: true

  $ionicModal.fromTemplateUrl "templates/shared/levelup.html", (modal) ->
    $scope.levelupModal = modal
  ,
    scope: $scope
    animation: "slide-in-up"
    focusFirstInput: true

  $scope.loadModal = ->
    $scope.levelupModal.show()

  $scope.closeModal = ->
    $scope.levelupModal.hide()

  $scope.$on "$destroy", ->
    $scope.loginModal.remove()
    $scope.levelupModal.remove()


@AppCtrl.$inject = [ '$scope', '$state', '$ionicModal' ]
