'use strict'

@ChecklistGridCtrl = @controllerModule.controller "ChecklistGridCtrl", ($scope, $state, $ionicScrollDelegate) ->

  $scope.resizeIfOther = ->
    if @choice.textfield
      $ionicScrollDelegate.resize()
      $ionicScrollDelegate.scrollBottom()

  $scope.atLeastOne = ->
    inverse = null
    for choice in $scope.question.choices
      if choice.textfield
        inverse = true if choice.selected and choice.custom_text and choice.custom_text.length >= 1
      else if choice.selected
        inverse = true
    !inverse


@ChecklistGridCtrl.$inject = [ '$scope', '$state', '$ionicScrollDelegate' ]
