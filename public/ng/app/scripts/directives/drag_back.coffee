'use strict'

@directiveModule.directive 'dragBack', ($ionicGesture, $state) ->
  restrict: "A"
  link: (scope, elem, attr) ->
    $ionicGesture.on "swipe", ((event) ->
      console.log "Got swiped!"
      event.preventDefault()
      window.history.back()
    ), elem
