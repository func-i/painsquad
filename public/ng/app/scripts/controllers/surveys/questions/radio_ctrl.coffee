'use strict'

@RadioCtrl = @controllerModule.controller "RadioCtrl", ($scope, $state) ->

  $scope.setRadioAnswer = (question, choice) ->
    for c in question.choices
      delete c.selected
    choice.selected = true

@RadioCtrl.$inject = ['$scope', '$state']
