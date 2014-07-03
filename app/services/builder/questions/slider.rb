module Builder::Questions::Slider

  class << self

    def current_pain survey
      question = survey.questions.create(
        question_type: 'slider',
        content:       'How much <strong>pain</strong> do you have right now?',
        tip:           'Touch the mark and slide it to describe your pain.',
        identifier:    'current_pain',
        extremes:      { least: 'no pain', most: 'worst possible pain' },
        tag:           'intensity',
        report_label:  'Now'
      )
      question.choices.create
    end

    def last_case_worst survey
      question = survey.questions.create(
        question_type: 'slider',
        content:       'What was your pain when it was at its <strong>worst</strong> since your last case?',
        identifier:    'last_case_worst',
        extremes:      { least: 'no pain', most: 'worst possible pain' },
        tag:           'intensity',
        report_label:  'Worst'
      )
      question.choices.create
    end

    def last_case_best survey
      question = survey.questions.create(
        question_type: 'slider',
        content:       'What was your pain when it was at its <strong>least</strong> since your last case?',
        identifier:    'last_case_best',
        extremes:      { least: 'no pain', most: 'worst possible pain' },
        tag:           'intensity',
        report_label:  'Least'
      )
      question.choices.create
    end

    def last_case_average survey
      question = survey.questions.create(
        question_type: 'slider',
        content:       'What was your pain when it was at its <strong>average</strong> since your last case?',
        identifier:    'last_case_average',
        extremes:      { least: 'no pain', most: 'worst possible pain' },
        tag:           'intensity',
        report_label:  'Average'
      )
      question.choices.create
    end

    def last_case_bothersome survey
      question = survey.questions.create(
        question_type: 'slider',
        content:       'How <strong>bothersome</strong> was your pain since your last case?',
        extremes:      { least: 'not at all', most: 'a lot' },
        tag:           'effect',
        report_label:  'Bothersome'
      )
      question.choices.create
    end

    def last_case_sleep survey
      question = survey.questions.create(
        question_type: 'slider',
        content:       'How much did your pain get in the way of your <strong>sleep</strong> since your last case?',
        extremes:      { least: 'not at all', most: 'a lot' },
        tag:           'effect',
        report_label:  'Sleep'
      )
      question.choices.create
    end

    def last_case_activities survey
      question = survey.questions.create(
        question_type: 'slider',
        content:       'How much did your pain get in the way of <strong>things you did</strong> since your last case?',
        extremes:      { least: 'not at all', most: 'a lot' },
        tag:           'effect',
        report_label:  'Things you did'
      )
      question.choices.create
    end

    def last_case_felt survey
      question = survey.questions.create(
        question_type: 'slider',
        content:       'How much did your pain get in the way of <strong>how you felt</strong> since your last case?',
        extremes:      { least: 'not at all', most: 'a lot' },
        tag:           'effect',
        report_label:  'How you felt'
      )
      question.choices.create
    end

    def last_case_walking survey
      question = survey.questions.create(
        question_type: 'slider',
        content:       'How much did your pain get in the way of <strong>walking</strong> since your last case?',
        extremes:      { least: 'not at all', most: 'a lot' },
        tag:           'effect',
        report_label:  'Walking'
      )
      question.choices.create
    end

    def last_case_relationships survey
      question = survey.questions.create(
        question_type: 'slider',
        content:       'How much did your pain get in the way of your <strong>relationships</strong> since your last case?',
        extremes:      { least: 'not at all', most: 'a lot' }
      )
      question.choices.create
    end

    def last_case_school survey
      question = survey.questions.create(
        question_type: 'slider',
        content:       'How much did your pain get in the way of <strong>schoolwork</strong> since your last case?',
        extremes:      { least: 'not at all', most: 'a lot' },
        tag:           'effect',
        report_label:  'Schoolwork'
      )
      question.choices.create
    end

    def last_case_enjoyment survey
      question = survey.questions.create(
        question_type: 'slider',
        content:       'How much did your pain get in the way of <strong>enjoying life</strong> since your last case?',
        extremes:      { least: 'not at all', most: 'a lot' },
        tag:           'effect',
        report_label:  'Enjoying Life'
      )
      question.choices.create
    end

    def strategy_efficacy survey
      question = survey.questions.create(
        question_type: 'slider',
        content:       'How <strong>helpful</strong> was this strategy in reducing pain?',
        extremes:      { least: 'not helpful', most: 'very helpful' }

      )
      question.choices.create
    end

    def pain_control survey
      question = survey.questions.create(
        question_type: 'slider',
        content:       'How much <strong>control</strong> did you feel you had over your pain since your last case?',
        identifier:    'pain_control',
        extremes:      { least: 'not at all', most: 'a lot' }

      )
      question.choices.create
    end

  end
end
