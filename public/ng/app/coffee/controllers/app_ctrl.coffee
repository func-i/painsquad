'use strict'

@AppCtrl = @controllerModule.controller 'AppCtrl', ($scope, $rootScope, $state, $ionicModal, $timeout, CONFIG, TokenResource, ModalService) ->
  $scope.levelUp = {}
  $scope.advice  = {}

  # Register all the modals to be used in this app
  ModalService.registerModals($scope)

  $scope.closeModal = ->
    $scope.levelupModal.hide()

  $scope.closeAdvice = ->
    $scope.adviceModal.hide()

  $scope.playLevelupVideo = ->
    path = "#{CONFIG.baseUrl}/videos/ranks/#{$scope.levelUp.image}.m4v"
    $scope.$broadcast 'event:playVideo', path

  saveDeviceToken = ->
    if $rootScope.deviceToken
      TokenResource.update(device_token: $rootScope.deviceToken)

  $rootScope.$on 'event:levelup', (event, args) ->
    $scope.levelUp.image     = args.image
    $scope.levelUp.prev_rank = args.prev_rank
    $scope.levelUp.rank      = args.rank
    $scope.modals.levelupModal.show()

  $rootScope.$on 'event:advice', (event, args) ->
    $scope.advice.name = args.name
    $scope.modals.adviceModal.show()
    $timeout ->
      $scope.modals.adviceModal.hide()
    , 2000

  $rootScope.$on 'event:medal', (event, args) ->
    $scope.modals.medalModal.show()
    $timeout ->
      $scope.modals.medalModal.hide()
    , 4000

  $scope.$on "$destroy", ->
    $scope.modals.loginModal.remove()
    $scope.modals.levelupModal.remove()
    $scope.modals.adviceModal.remove()

  saveDeviceToken()

@AppCtrl.$inject = [ '$scope', '$rootScope', '$state', '$ionicModal', '$timeout', 'CONFIG' ]
