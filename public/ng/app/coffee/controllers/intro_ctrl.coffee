'use strict'

@IntroCtrl = @controllerModule.controller 'IntroCtrl', ($scope, $rootScope, $state, $ionicSlideBoxDelegate) ->

  $scope.next = ->
    $ionicSlideBoxDelegate.next()

  $scope.previous = ->
    $ionicSlideBoxDelegate.previous()

  $scope.goHome = ->
    $state.go 'app.home'

  $rootScope.sideMenuEnabled = false

@IntroCtrl.$inject = [ '$scope', '$rootScope', '$state', '$ionicSlideBoxDelegate' ]
