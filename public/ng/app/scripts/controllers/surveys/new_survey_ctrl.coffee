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

# MUST COMPLETE BEFORE CONTROLLER LOAD
@NewSurveyCtrl.resolve =
  survey: (Survey, $q) ->
    # TODO: Uncomment this
    #$scope.survey = Survey.query(user_id: AuthService.getCurrentUser.token)

    questions: [
      {
        title: "Do you have pain?"
        choice_type: 'radio'
        choices: [
          { value: 'Yes' }
          { value: 'No' }
        ]
      },
      {
        title: "Are you sure?"
        choice_type: 'radio'
        choices: [
          { value: 'Yes' }
          { value: 'No' }
        ]
      },
      {
        title: "Are you REALLY sure?"
        choice_type: 'radio'
        choices: [
          { value: 'Yes' }
          { value: 'No' }
        ]
      }
    ]