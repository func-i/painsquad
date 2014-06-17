(function() {
  'use strict';
  this.SurveyCtrl = this.controllerModule.controller("SurveyCtrl", function($scope, $state, $stateParams, $ionicScrollDelegate, survey, AuthService, SurveyService, SubmissionService, BodymapService) {
    $scope.startSurvey = function() {
      $scope.submission = SubmissionService.init(survey.id);
      $scope.questionIndex = 0;
      $scope.totalQuestions = survey.questions.length;
      return $scope.question = survey.questions[$scope.questionIndex];
    };
    $scope.hasPain = function() {
      $scope.submission.has_pain = true;
      $scope.showNextButton = true;
      return $scope.continueSurvey();
    };
    $scope.noPain = function() {
      $scope.submission.has_pain = false;
      return $scope.finishSurvey();
    };
    $scope.nextQuestion = function() {
      if (!$scope.showNext) {
        return;
      }
      SurveyService.prepareSubmissionAnswer($scope.question);
      return $scope.continueSurvey();
    };
    $scope.continueSurvey = function() {
      $scope.questionIndex++;
      if ($scope.questionIndex === ($scope.totalQuestions - 1)) {
        $scope.showNextButton = false;
        $scope.showSubmitButton = true;
        $scope.question = survey.questions[$scope.questionIndex];
      } else {
        $scope.$broadcast('resetQuestion');
        $scope.question = survey.questions[$scope.questionIndex];
      }
      return $ionicScrollDelegate.scrollTop();
    };
    $scope.submit = function() {
      SurveyService.prepareSubmissionAnswer($scope.question);
      return $state.go('app.survey_complete');
    };
    $scope.$on('currentForm:valid', function(ev) {
      return $scope.showNext = true;
    });
    $scope.$on('currentForm:invalid', function(ev) {
      return $scope.showNext = false;
    });
    $scope.$watch('questionIndex', function() {
      var surveyLength;
      surveyLength = survey.questions.length - 1;
      return $scope.surveyProgress = ($scope.questionIndex / surveyLength) * 100;
    });
    $scope.progressWidth = function() {
      return {
        width: "" + $scope.surveyProgress + "%"
      };
    };
    return $scope.startSurvey();
  });

  this.SurveyCtrl.$inject = ['$scope', '$state', '$stateParams', '$ionicScrollDelegate', 'survey', 'AuthService', 'SurveyService', 'SubmissionService', 'BodymapService'];

}).call(this);
