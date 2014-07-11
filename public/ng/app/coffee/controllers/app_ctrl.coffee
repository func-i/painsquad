'use strict'

@AppCtrl = @controllerModule.controller 'AppCtrl', ($scope, $state, $ionicModal, NotificationService, NotificationSettingsService) ->
  $scope.levelUp = {}

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

  $scope.closeModal = ->
    $scope.levelupModal.hide()

  $rootScope.$on 'event:levelup', (event, args) ->
    $scope.levelUp.image     = args.image
    $scope.levelUp.prev_rank = args.prev_rank
    $scope.levelUp.rank      = args.rank
    $scope.levelupModal.show()

  $scope.$on "$destroy", ->
    $scope.loginModal.remove()
    $scope.levelupModal.remove()

  # NotificationService.onclick = ->
  #   if window.cordova
  #     NotificationSettingsService.handleClick(id, state, json)

@AppCtrl.$inject = [ '$scope', '$rootScope', '$state', '$ionicModal' ]
