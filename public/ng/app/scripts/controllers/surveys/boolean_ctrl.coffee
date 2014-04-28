'use strict'

@controllerModule.controller "BooleanCtrl", ['$scope', '$state', ($scope, $state) ->

  $scope.painCheck = (hasPain) ->
    $scope.submission.has_pain = hasPain
    if hasPain then $scope.nextQuestion(false) else $scope.finishSurvey()

]
