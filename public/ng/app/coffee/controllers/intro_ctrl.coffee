'use strict'

@IntroCtrl = @controllerModule.controller 'IntroCtrl', ($scope, $rootScope, $state, $ionicSlideBoxDelegate, UserService) ->
  $rootScope.sideMenuEnabled = false
  $scope.data =
    hideNavBar: true
    showLogin:  true

  $scope.next = ->
    $ionicSlideBoxDelegate.next()

  $scope.previous = ->
    $ionicSlideBoxDelegate.previous()

  $scope.login = ->
    $state.go 'app.login'

  $scope.goHome = ->
    $state.go 'app.home'

  init = ->
    if UserService.isLoggedIn()
      $scope.data.hideNavBar = false
      $scope.data.showLogin  = false

  init()
  console.log $scope.data.hideNavBar

@IntroCtrl.$inject = [ '$scope', '$rootScope', '$state', '$ionicSlideBoxDelegate' ]
