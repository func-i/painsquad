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
    console.log "device token", $rootScope.deviceToken
    if $rootScope.deviceToken
      TokenResource.update(device_token: $rootScope.deviceToken)

  $rootScope.$on 'event:levelup', (event, args) ->
    $scope.levelUp.image     = args.image
    $scope.levelUp.prev_rank = args.prev_rank
    $scope.levelUp.rank      = args.rank
    $scope.modals.levelupModal.show()

  $rootScope.$on 'event:genericModal', (event, args) ->
    $scope.modalContent = args.modal_content

    $scope.modals.genericModal.show()
    $timeout ->
      $scope.modals.genericModal.hide()
    , 2000

  $scope.$on "$destroy", ->
    $scope.modals.loginModal.remove()
    $scope.modals.levelupModal.remove()
    $scope.modals.genericModal.remove()

  saveDeviceToken()

@AppCtrl.$inject = [ '$scope', '$rootScope', '$state', '$ionicModal', '$timeout', 'CONFIG' ]
