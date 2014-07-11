'use strict'

@AppCtrl = @controllerModule.controller 'AppCtrl', ($scope, $rootScope, $state, $ionicModal) ->
  console.log 'rootScope.showLevelupModal: ', $rootScope.showLevelupModal
  $scope.levelUp = {}
  $rootScope.showLevelupModal = false

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
    $rootScope.showLevelupModal = false

  $rootScope.$on 'event:levelup', (event, args) ->
    $scope.levelUp.image     = args.image
    $scope.levelUp.prev_rank = args.prev_rank
    $scope.levelUp.rank      = args.rank
    if $scope.levelupModal and $rootScope.showLevelupModal
      $scope.levelupModal.show()

  $scope.$on "$destroy", ->
    $scope.loginModal.remove()
    $scope.levelupModal.remove()


@AppCtrl.$inject = [ '$scope', '$rootScope', '$state', '$ionicModal' ]
