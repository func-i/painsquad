@NewSurveyCtrl = @controllerModule.controller "NewSurveyCtrl", ['$scope', '$state', 'AuthService', 'SubmissionService', 'survey',
  ($scope, $state, AuthService, SubmissionService, survey) ->
    $scope.submission = SubmissionService.getSubmission()

    $scope.startSurvey = () ->
      $scope.questionIndex = 0
      $scope.question = survey.survey.questions[$scope.questionIndex]

    $scope.nextQuestion = () ->
      SubmissionService.addAnswer($scope.question)
      $scope.questionIndex++

      if $scope.questionIndex > survey.survey.questions.length - 1
        $scope.finishSurvey()
      else
        $scope.question = survey.survey.questions[$scope.questionIndex]

    $scope.finishSurvey = () ->
      $state.go('app.survey_complete')
      # $state.go('app.home')

    $scope.getChoicesPartial = (question) ->
      "/templates/surveys/question_types/#{question.choice_type}.html"

    # DEFAULT ACTIONS
    $scope.startSurvey()

]

# resolve this resource before loading the controller
@NewSurveyCtrl.resolve =
  # TODO: return object without root, negating calls for `survey.survey.questions` above
  survey: (Survey, $q) ->
    @resource = Survey.query().$promise
