'use strict'

@controllerModule.controller "BodymapCtrl", ['$scope', '$state', ($scope, $state) ->
  selectedFill      = "#1CAFD5"
  unselectedFill    = "#DDC9B2"
  $scope.clickEvent = ""
  $scope.selections = []

  $scope.onMouseDown = (event) ->
    $scope.clickEvent = getElementCoordinates(event)

  $scope.toggleSelection = () ->
    return unless event.target
    element = event.target.id
    if elementInSelection element
      $scope.selections.splice $scope.selections.indexOf(element), 1
      event.target.setAttribute('fill', unselectedFill)
    else
      $scope.selections.push element
      event.target.setAttribute('fill', selectedFill)

  elementInSelection = (element) ->
    _.contains($scope.selections, element)

  getElementCoordinates = (mouseEvent) ->
    result =
      x: 0
      y: 0

    mouseEvent = window.event  unless mouseEvent
    if mouseEvent.pageX or mouseEvent.pageY
      result.x = mouseEvent.pageX
      result.y = mouseEvent.pageY
    else if mouseEvent.clientX or mouseEvent.clientY
      result.x = mouseEvent.clientX + document.body.scrollLeft + document.documentElement.scrollLeft
      result.y = mouseEvent.clientY + document.body.scrollTop + document.documentElement.scrollTop
    if mouseEvent.target
      offEl = mouseEvent.target
      offX = 0
      offY = 0
      unless typeof (offEl.offsetParent) is "undefined"
        while offEl
          offX += offEl.offsetLeft
          offY += offEl.offsetTop
          offEl = offEl.offsetParent
      else
        offX = offEl.x
        offY = offEl.y
      result.x -= offX
      result.y -= offY
    result

]
