@BooleanCtrl = @controllerModule.controller "BooleanCtrl", ['$scope', '$state', ($scope, $state) ->

  $scope.painCheck = (hasPain) ->
    if hasPain
      $scope.submission.answers.push(has_pain: true)
      $scope.nextQuestion()
    else
      $scope.submission.answers.push(has_pain: false)
      $state.go("app.survey_complete")

]
