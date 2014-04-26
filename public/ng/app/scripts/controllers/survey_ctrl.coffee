'use strict'

# Parent controller responsible for handling survey navigation
# Survey question-specific logic delegated to sub-controllers
@SurveyCtrl = @controllerModule.controller "SurveyCtrl",
  ['$scope', '$state', '$stateParams', '$ionicModal', 'AuthService', 'SubmissionService', 'survey',
  ($scope, $state, $stateParams, $ionicModal, AuthService, SubmissionService, survey) ->

    $scope.startSurvey = () ->
      console.log "START SURVEY CALLED, initializing new submission"
      # $scope.submission = new SubmissionService
      $scope.submission = SubmissionService.init()
      $scope.questionIndex = 0
      $scope.question = survey.questions[$scope.questionIndex]

    $scope.saveAnswer = () ->
      # $scope.submission.answers.push($scope.question)
      SubmissionService.addAnswer($scope.question)

    $scope.nextQuestion = () ->
      $scope.questionIndex++

      if $scope.questionIndex > survey.questions.length - 1
        $scope.finishSurvey()
      else
        $scope.question = survey.questions[$scope.questionIndex]

    $scope.getChoicesPartial = (question) ->
      "/templates/surveys/question_types/#{question.choice_type}.html"

    $scope.finishSurvey = () ->
      $state.go('app.survey_complete')

    # needs its own controller
    $scope.setRadioAnswer = (question, choice) ->
      for c in question.choices
        delete c.selected
      choice.selected = true

    # needs its own controller
    $scope.painCheck = (hasPain) ->
      if hasPain
        $scope.submission.answers.push(has_pain: true)
        $scope.nextQuestion()
      else
        $scope.submission.answers.push(has_pain: false)
        $scope.finishSurvey()

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
