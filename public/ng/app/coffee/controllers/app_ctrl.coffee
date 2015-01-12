'use strict'

@AppCtrl = @controllerModule.controller 'AppCtrl', ($scope, $rootScope, $state, $ionicModal, $ionicPopup, $timeout, CONFIG, TokenResource, ModalService, AuthService) ->
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

  $scope.isMobile = ->
    ionic.Platform.isIOS() or ionic.Platform.isAndroid()

  saveDeviceToken = ->    
    if $rootScope.deviceToken
      TokenResource.update(device_token: $rootScope.deviceToken)

  $scope.logout = ->
    confirmPopup = $ionicPopup.confirm(
     title: 'Log out',
     template: 'Are you sure you want to log out?'
     buttons:  [
      {
        text: "<span class='content'>No</span>"
        type: 'button-stable'
      },
      {
        text: "<span class='content'>Yes</span>"
        type: 'button-positive'
        onTap: (ev) ->
          AuthService.logout()
      }
    ])

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
    , 3000

  $scope.$on "$destroy", ->
    $scope.modals.loginModal.remove() if $scope.modals.loginModal
    $scope.modals.levelupModal.remove() if $scope.modals.levelupModal
    $scope.modals.genericModal.remove() if $scope.modals.genericModal
  
  $rootScope.$watch "deviceToken", (token) ->
    saveDeviceToken()

@AppCtrl.$inject = [ '$scope', '$rootScope', '$state', '$ionicModal', '$ionicPopup', '$timeout', 'CONFIG', 'TokenResource', 'ModalService', 'AuthService' ]
