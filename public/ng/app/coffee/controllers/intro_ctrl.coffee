'use strict'

@IntroCtrl = @controllerModule.controller 'IntroCtrl', ($scope, $rootScope, $state, $ionicSlideBoxDelegate, UserService) ->
  $scope.data =
    hideNavBar: true
    showLogin:  true

  $scope.next = ->
    $ionicSlideBoxDelegate.next()

  $scope.previous = ->
    $ionicSlideBoxDelegate.previous()

  $scope.goHome = ->
    $state.go 'app.home'

  # $scope.login = ->
  #   $rootScope.firstLaunch = false
  #   $state.go 'app.login'

  init = ->
    if $rootScope.previousState_name is 'app.about' and UserService.isLoggedIn()
      $scope.data.hideNavBar = false
      $scope.data.showLogin  = false
    # else if !$rootScope.firstLaunch
    #   $scope.goHome()

  init()

@IntroCtrl.$inject = [ '$scope', '$rootScope', '$state', '$ionicSlideBoxDelegate' ]
