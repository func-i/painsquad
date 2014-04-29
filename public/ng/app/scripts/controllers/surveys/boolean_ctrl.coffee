'use strict'

@controllerModule.controller "BooleanCtrl", ['$scope', '$state', ($scope, $state) ->

  $scope.submitForm = (hasPain) ->
    if hasPain then $scope.nextQuestion(false) else $scope.finishSurvey()

]
