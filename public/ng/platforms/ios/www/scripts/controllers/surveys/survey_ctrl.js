(function() {
  'use strict';
  this.SurveyCtrl = this.controllerModule.controller("SurveyCtrl", function($scope, $state, $rootScope, $ionicScrollDelegate, $timeout, survey, SubmissionResource, AuthService, SubmissionService, BodymapService) {
    $scope.startSurvey = function() {
      $scope.submission = SubmissionService.init(survey);
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
      return $scope.submit(false);
    };
    $scope.nextQuestion = function() {
      if (!$scope.showNext) {
        return;
      }
      SubmissionService.prepareSubmissionAnswer($scope.question);
      return $scope.continueSurvey();
    };
    $scope.continueSurvey = function() {
      return $timeout(function() {
        $scope.questionIndex++;
        if ($scope.questionIndex === ($scope.totalQuestions - 1)) {
          $scope.showNextButton = false;
          $scope.showSubmitButton = true;
          $scope.question = survey.questions[$scope.questionIndex];
        } else {
          $scope.$broadcast('resetQuestion');
          $scope.question = survey.questions[$scope.questionIndex];
        }
        return $scope.reloadScroll();
      }, 100);
    };
    $scope.reloadScroll = function() {
      return $timeout(function() {
        $ionicScrollDelegate.scrollTop();
        return $ionicScrollDelegate.resize();
      }, 50);
    };
    $scope.submit = function(popup) {
      if (popup == null) {
        popup = true;
      }
      SubmissionService.prepareSubmissionAnswer($scope.question);
      SubmissionResource.save({
        submission: $scope.submission
      });
      return $state.go('app.survey_complete', {
        popup: popup
      });
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

  this.SurveyCtrl.$inject = ['$scope', '$state', '$rootScope', '$ionicScrollDelegate', '$timeout', 'survey', 'AuthService', 'SubmissionService', 'BodymapService'];

}).call(this);
