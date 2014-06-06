'use strict'

@IntroCtrl = @controllerModule.controller 'IntroCtrl', ($scope, $state, $ionicSlideBoxDelegate) ->
  console.log "Intro Controller"

  $scope.next = ->
    $ionicSlideBoxDelegate.next()

  $scope.previous = ->
    $ionicSlideBoxDelegate.previous()

  $scope.slideChange = (slideIndex) ->
    console.log "Changing slides to index: ", slideIndex


@IntroCtrl.$inject = [ '$scope', '$state', '$ionicSlideBoxDelegate' ]
