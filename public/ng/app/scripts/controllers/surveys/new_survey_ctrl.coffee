@NewSurveyCtrl = @controllerModule.controller "NewSurveyCtrl", ['$scope', '$state', 'AuthService', 'survey',
  ($scope, $state, AuthService, survey) ->

    $scope.startSurvey = () ->
      $scope.questionIndex = 0
      $scope.question = survey.questions[$scope.questionIndex]

    $scope.nextQuestion = () ->
      $scope.questionIndex++

      if $scope.questionIndex > survey.questions.length - 1
        $scope.finishSurvey()
      else
        $scope.question = survey.questions[$scope.questionIndex]

    $scope.finishSurvey = () ->
      $state.go('app.home')

    $scope.getChoicesPartial = (question) ->
      "/templates/surveys/question_types/#{question.choice_type}.html"

    # DEFAULT ACTIONS
    $scope.startSurvey()

]

# resolve this resource before loading the controller
@NewSurveyCtrl.resolve =
  survey: (Survey, $q) ->
    Survey.query().$promise
