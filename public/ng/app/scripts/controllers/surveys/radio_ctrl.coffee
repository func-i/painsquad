'use strict'

@controllerModule.controller "RadioCtrl", ['$scope', '$state', ($scope, $state) ->
  console.log("Radio Controller Instantiated")

  # testFunc = () ->
  #   debugger

  # testFunc()


  $scope.setRadioAnswer = (question, choice) ->
    for c in question.choices
      delete c.selected
    choice.selected = true

]
