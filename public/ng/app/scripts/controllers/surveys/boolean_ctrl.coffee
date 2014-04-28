'use strict'

@controllerModule.controller "BooleanCtrl", ['$scope', '$state', ($scope, $state) ->

  $scope.hasPain = () ->
    $scope.submission.has_pain = true
    $scope.nextQuestion(false)

  $scope.noPain = () ->
    $scope.submission.has_pain = true
    $scope.finishSurvey()

]
