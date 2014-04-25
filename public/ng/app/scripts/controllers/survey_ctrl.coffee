@SurveyCtrl = @controllerModule.controller "SurveyCtrl", ['$scope', '$state', 'AuthService', 'SubmissionService', 'survey',
  ($scope, $state, AuthService, SubmissionService, survey) ->
    $scope.submission = SubmissionService.getSubmission()

    $scope.startSurvey = () ->
      $scope.questionIndex = 0
      $scope.question = survey.questions[$scope.questionIndex]

    $scope.painCheck = (hasPain) ->
      if hasPain
        $scope.submission.answers.push(has_pain: true)
        $scope.nextQuestion()
      else
        $scope.submission.answers.push(has_pain: false)
        $state.go("app.survey_complete")

    $scope.saveAnswer = () ->
      SubmissionService.addAnswer($scope.question)

    $scope.nextQuestion = () ->
      $scope.questionIndex++

      if $scope.questionIndex > survey.questions.length - 1
        $scope.finishSurvey()
      else
        $scope.question = survey.questions[$scope.questionIndex]

    $scope.getChoicesPartial = (question) ->
      "/templates/surveys/question_types/#{question.choice_type}.html"

    $scope.setRadioAnswer = (question, choice) ->
      for c in question.choices
        delete c.selected
      choice.selected = true

    $scope.finishSurvey = () ->
      $state.go('app.survey_complete')
      # $state.go('app.home')

    # DEFAULT ACTIONS
    $scope.startSurvey()

]

# resolve this resource before loading the controller
@SurveyCtrl.resolve =
  survey: (Survey, $q) ->
    deferred = $q.defer()

    Survey.query (response) ->
      deferred.resolve response.survey

    deferred.promise
