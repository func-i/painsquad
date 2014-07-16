'use strict'

@AppCtrl = @controllerModule.controller 'AppCtrl', ($scope, $rootScope, $state, $ionicModal, $ionicBackdrop, $timeout) ->
  $scope.levelUp = {}
  $scope.advice  = {}

  $ionicModal.fromTemplateUrl 'templates/shared/login.html', (modal) ->
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

@AppCtrl.$inject = [ '$scope', '$rootScope', '$state', '$ionicModal', '$timeout' ]
