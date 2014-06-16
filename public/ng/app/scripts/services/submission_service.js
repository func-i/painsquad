(function() {
  'use strict';
  this.SubmissionService = this.serviceModule.service('SubmissionService', function(BodymapService) {
    return {
      init: function(survey_id) {
        return this.submission = {
          survey_id: survey_id,
          has_pain: null,
          answers_attributes: []
        };
      },
      getSubmission: function() {
        return this.submission;
      },
      addAnswer: function(answerObj) {
        return this.submission.answers_attributes.push(answerObj);
      },
      prepareAnswer: function(answerObj, regionSelections) {
        if (regionSelections == null) {
          regionSelections = null;
        }
        switch (answerObj.question_type) {
          case 'checklist':
          case 'radio':
          case 'checklist-grid':
          case 'checklist-extra':
            return this.addSelectionAnswer(answerObj);
          case 'slider':
            return this.addSliderAnswer(answerObj);
          case 'textbox':
            return this.addTextboxAnswer(answerObj);
          case 'bodymap':
            this.addBodymapAnswer(answerObj, regionSelections);
            return BodymapService.reset();
          case 'boolean':
            break;
          default:
            return console.log("invalid question type detected: " + answerObj.question_type);
        }
      },
      addSelectionAnswer: function(answerObj) {
        var resultObj, selectedChoices;
        selectedChoices = _.where(answerObj.choices, {
          selected: true
        });
        if (selectedChoices.length > 1) {
          return this.recursiveExtractAnswers(answerObj, selectedChoices);
        } else {
          resultObj = {
            question_id: answerObj.question_id,
            choice_id: selectedChoices[0].id,
            value: selectedChoices[0].value
          };
          return this.addAnswer(resultObj);
        }
      },
      recursiveExtractAnswers: function(answerObj, selectedChoices) {
        var item, resultObj;
        if (!selectedChoices.length) {
          return;
        }
        item = selectedChoices.shift();
        resultObj = {
          question_id: answerObj.question_id,
          choice_id: item.id,
          value: (item.slider_disabled ? "N/A" : item.value),
          custom_text: item.custom_text
        };
        this.addAnswer(resultObj);
        return this.recursiveExtractAnswers(answerObj, selectedChoices);
      },
      addSliderAnswer: function(answerObj) {
        var resultObj;
        resultObj = {
          question_id: answerObj.question_id,
          value: parseInt(answerObj.choices[0].value)
        };
        return this.addAnswer(resultObj);
      },
      addTextboxAnswer: function(answerObj) {
        var resultObj;
        resultObj = {
          question_id: answerObj.question_id,
          custom_text: answerObj.choices[0].value
        };
        return this.addAnswer(resultObj);
      },
      addBodymapAnswer: function(answerObj, regionSelections) {
        var resultObj;
        resultObj = {
          question_id: answerObj.question_id,
          bodymap_data: regionSelections
        };
        return this.addAnswer(resultObj);
      }
    };
  });

  this.SubmissionService.$inject = ['BodymapService'];

}).call(this);