'use strict'

@controllerModule.controller "RadioCtrl", ['$scope', '$state', '_', ($scope, $state, _) ->

  $scope.setRadioAnswer = (question, choice) ->
    for c in question.choices
      delete c.selected
    choice.selected = true

]
