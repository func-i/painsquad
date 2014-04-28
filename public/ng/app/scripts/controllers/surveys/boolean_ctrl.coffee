'use strict'

@controllerModule.controller "BooleanCtrl", ['$scope', '$state', ($scope, $state) ->
  console.log("Boolean Controller Instantiated")

  $scope.hasPain = () ->
    $scope.submission.has_pain = true
    $scope.nextQuestion(false)

  $scope.noPain = () ->
    $scope.submission.has_pain = true
    $scope.finishSurvey()

]
