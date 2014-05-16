'use strict'

@ChecklistGridCtrl = @controllerModule.controller "ChecklistGridCtrl", ($scope, $state) ->

  # TODO: remove underscore depencency and clean this up
  $scope.atLeastOne = ->
    atLeastOne = _.some $scope.question.choices, (choice) ->
      if choice.textfield
        choice.selected && choice.value && choice.value.length > 5
      else
        choice.selected
    !atLeastOne

@ChecklistGridCtrl.$inject = ['$scope', '$state']
