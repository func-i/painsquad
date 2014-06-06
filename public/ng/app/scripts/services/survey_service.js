(function() {
  'use strict';
  this.SurveyService = this.serviceModule.service('SurveyService', function(SubmissionService, BodymapService) {
    return {
      prepareSubmissionAnswer: function(question) {
        if (question.question_type === 'bodymap') {
          return SubmissionService.prepareAnswer(question, BodymapService.getSelections());
        } else {
          return SubmissionService.prepareAnswer(question);
        }
      }
    };
  });

  this.SurveyService.$inject = ['SubmissionService', 'BodymapService'];

}).call(this);
