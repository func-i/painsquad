'use strict'

# Parent controller responsible for handling survey navigation
# Survey question-specific logic delegated to sub-controllers
@SurveyCtrl = @controllerModule.controller "SurveyCtrl", ['$scope', '$state', '$stateParams', 'AuthService', 'SubmissionService', 'survey',
  ($scope, $state, $stateParams, AuthService, SubmissionService, survey) ->
    console.log("Survey Controller Instantiated")

    $scope.startSurvey = () ->
      $scope.submission    = SubmissionService.init(survey.id)
      $scope.questionIndex = 0
      $scope.question      = survey.questions[$scope.questionIndex]

    $scope.nextQuestion = (save = true) ->
      SubmissionService.prepareAnswer($scope.question) if save
      $scope.questionIndex++

      if $scope.questionIndex > survey.questions.length - 1
        $scope.finishSurvey()
      else
        $scope.question = survey.questions[$scope.questionIndex]

    $scope.getChoicesPartial = (question) ->
      "/templates/surveys/question_types/#{question.question_type}.html"

    $scope.finishSurvey = () ->
      $state.go('app.survey_complete')

    # DEFAULT ACTIONS
    $scope.startSurvey()
    $scope.showNext = false
]

# resolve this resource before loading the controller
@SurveyCtrl.resolve =
  survey: (Survey, $q) ->
    deferred = $q.defer()

    Survey.query (response) ->
      deferred.resolve response.survey

    deferred.promise
