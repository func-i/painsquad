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
      SurveyService.prepareSubmissionAnswer($scope.question);
      return $scope.continueSurvey();
    };
    $scope.continueSurvey = function() {
      $scope.questionIndex++;
      if ($scope.questionIndex > $scope.totalQuestions - 1) {
        $scope.showSubmit = true;
        return $scope.finishSurvey();
      } else {
        $scope.$broadcast('resetQuestion');
        $scope.question = survey.questions[$scope.questionIndex];
        return $ionicScrollDelegate.scrollTop();
      }
    };
    $scope.finishSurvey = function() {
      return $state.go('app.survey_complete');
    };
    $scope.$on('currentForm:valid', function(ev) {
      $scope.showNext = true;
      return console.log($scope.showNext);
    });
    $scope.$on('currentForm:invalid', function(ev) {
      $scope.showNext = false;
      return console.log($scope.showNext);
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
    $scope.startSurvey();
    $scope.showSubmit = false;
    return $scope.showNextButton = false;
  });

  this.SurveyCtrl.$inject = ['$scope', '$state', '$stateParams', '$ionicScrollDelegate', 'survey', 'AuthService', 'SurveyService', 'SubmissionService', 'BodymapService'];

}).call(this);
