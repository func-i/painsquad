module Builder::Questions::Other

  class << self

    def boolean_has_pain survey
      question = survey.questions.create!(
        question_type: 'boolean',
        content:       'Did you have <strong>pain</strong> since your last case?',
        name:          'has_pain'
      )
      question.choices.create! content: 'Yes', value: 'true'
      question.choices.create! content: 'No', value: 'false'
    end

    def radio_pain_duration survey
      question = survey.questions.create!(
        question_type: 'radio',
        content:       'When you had pain since your last case, how long did it <strong>usually</strong> last?',
        name:          'pain_duration'
      )
      question.choices.create! content: 'Just a few minutes'
      question.choices.create! content: 'About an hour'
      question.choices.create! content: '1-3 hours'
      question.choices.create! content: '4-6 hours'
      question.choices.create! content: '7-9 hours'
      question.choices.create! content: '10-12 hours'
    end

    def bodymap survey
      question = survey.questions.create!(
        question_type: 'bodymap',
        content:       '<strong>Where did it hurt</strong> since your last case?',
        tip:           'Touch the area of the body and then select parts in that area',
        name:          'bodymap'
      )
      question.choices.create! content: 'Head'
      question.choices.create! content: 'Torso'
      question.choices.create! content: 'Arms'
      question.choices.create! content: 'Legs'
    end

    def textbox survey
      question = survey.questions.create!(
        question_type: 'textbox',
        content:       'Tell us anything else about your pain since your last case',
        name:          'pain_info'
      )
      question.choices.create! textfield: true
    end

  end

end
