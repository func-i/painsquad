'use strict'

@AppCtrl = @controllerModule.controller 'AppCtrl', ($scope, $rootScope, $state, $ionicModal, $timeout, CONFIG, TokenResource) ->
  $scope.levelUp = {}
  $scope.advice  = {}

  $ionicModal.fromTemplateUrl 'templates/shared/modal.login.html', (modal) ->
    $scope.loginModal = modal
  ,
    scope: $scope
    animation: 'fade-in'
    focusFirstInput: true

  $ionicModal.fromTemplateUrl 'templates/shared/levelup.html', (modal) ->
    $scope.levelupModal = modal
  ,
    scope: $scope
    animation: 'slide-left-right'

  $ionicModal.fromTemplateUrl 'templates/shared/advice.html', (modal) ->
    $scope.adviceModal = modal
  ,
    scope: $scope
    animation: 'slide-left-right'

  $scope.closeModal = ->
    $scope.levelupModal.hide()

  $scope.closeAdvice = ->
    $scope.adviceModal.hide()

  $scope.playLevelupVideo = ->
    path = "#{CONFIG.baseUrl}/videos/ranks/#{$scope.levelUp.image}.m4v"
    $scope.$broadcast 'event:playVideo', path

  saveDeviceToken = ->
    if $rootScope.deviceToken
      TokenResource.update(token: $rootScope.deviceToken)
      # console.log 'Need to save deviceToken on app init, ', $rootScope.deviceToken

  $rootScope.$on 'event:levelup', (event, args) ->
    $scope.levelUp.image     = args.image
    $scope.levelUp.prev_rank = args.prev_rank
    $scope.levelUp.rank      = args.rank
    $scope.levelupModal.show()


  $rootScope.$on 'event:advice', (event, args) ->
    $scope.advice.name = args.name
    $scope.adviceModal.show()
    $timeout ->
      $scope.adviceModal.hide()
    , 2000

  $scope.$on "$destroy", ->
    $scope.loginModal.remove()
    $scope.levelupModal.remove()
    $scope.adviceModal.remove()

  saveDeviceToken()

@AppCtrl.$inject = [ '$scope', '$rootScope', '$state', '$ionicModal', '$timeout', 'CONFIG' ]
