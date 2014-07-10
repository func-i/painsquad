'use strict'

@AppCtrl = @controllerModule.controller 'AppCtrl', ($scope, $rootScope, $state, $ionicModal) ->
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

  $scope.loadModal = ->
    $scope.levelupModal.show()

  $scope.closeModal = ->
    $scope.levelupModal.remove()
    # $scope.levelupModal.hide()

  $rootScope.$on 'event:levelup', (event, args) ->
    console.log "event, args", event, args
    # $scope.levelUp.image     = args.image
    # $scope.levelUp.prev_rank = args.prev_rank
    # $scope.levelUp.rank      = args.rank
    # if $scope.levelupModal
    #   $scope.levelupModal.show()

  # $rootScope.$on 'event:levelup:close', (ev) ->
  #   if $scope.levelupModal
  #     $scope.levelupModal.hide()

  $scope.$on "$destroy", ->
    $scope.loginModal.remove()
    $scope.levelupModal.remove()


@AppCtrl.$inject = [ '$scope', '$rootScope', '$state', '$ionicModal' ]
