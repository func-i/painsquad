'use strict'

@controllerModule.controller "BooleanCtrl", ['$scope', '$state', ($scope, $state) ->

  $scope.submitData = (hasPain) ->
    if (hasPain is "true") then $scope.nextQuestion(false) else $scope.finishSurvey()

]
