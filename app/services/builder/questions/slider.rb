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
        report_label:  'Now',
        name:          'slider current pain'
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
        report_label:  'Worst',
        name:          'slider last case worst pain'
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
        report_label:  'Least',
        name:          'slider last case best pain'
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
        report_label:  'Average',
        name:          'slider last case average pain'
      )
      question.choices.create
    end

    def last_case_bothersome survey
      question = survey.questions.create(
        question_type: 'slider',
        content:       'How <strong>bothersome</strong> was your pain since your last case?',
        extremes:      { least: 'not at all', most: 'a lot' },
        tag:           'effect',
        report_label:  'Bothersome',
        name:          'slider last case bothersome pain'
      )
      question.choices.create
    end

    def last_case_sleep survey
      question = survey.questions.create(
        question_type: 'slider',
        content:       'How much did your pain get in the way of your <strong>sleep</strong> since your last case?',
        extremes:      { least: 'not at all', most: 'a lot' },
        tag:           'effect',
        report_label:  'Sleep',
        name:          'slider last case sleep interference'
      )
      question.choices.create
    end

    def last_case_activities survey
      question = survey.questions.create(
        question_type: 'slider',
        content:       'How much did your pain get in the way of <strong>things you did</strong> since your last case?',
        extremes:      { least: 'not at all', most: 'a lot' },
        tag:           'effect',
        report_label:  'Things you did',
        name:          'slider last case pain activity interference'
      )
      question.choices.create
    end

    def last_case_felt survey
      question = survey.questions.create(
        question_type: 'slider',
        content:       'How much did your pain get in the way of <strong>how you felt</strong> since your last case?',
        extremes:      { least: 'not at all', most: 'a lot' },
        tag:           'effect',
        report_label:  'How you felt',
        name:          'slider last case pain emotional interference'
      )
      question.choices.create
    end

    def last_case_walking survey
      question = survey.questions.create(
        question_type: 'slider',
        content:       'How much did your pain get in the way of <strong>walking</strong> since your last case?',
        extremes:      { least: 'not at all', most: 'a lot' },
        tag:           'effect',
        report_label:  'Walking',
        name:          'slider last case pain walking interference'
      )
      question.choices.create
    end

    def last_case_relationships survey
      question = survey.questions.create(
        question_type: 'slider',
        content:       'How much did your pain get in the way of your <strong>relationships</strong> since your last case?',
        extremes:      { least: 'not at all', most: 'a lot' },
        name:          'slider last case pain relationship interference'

      )
      question.choices.create
    end

    def last_case_school survey
      question = survey.questions.create(
        question_type: 'slider',
        content:       'How much did your pain get in the way of <strong>schoolwork</strong> since your last case?',
        extremes:      { least: 'not at all', most: 'a lot' },
        tag:           'effect',
        report_label:  'Schoolwork',
        name:          'slider last case pain schooling interference'

      )
      question.choices.create
    end

    def last_case_enjoyment survey
      question = survey.questions.create(
        question_type: 'slider',
        content:       'How much did your pain get in the way of <strong>enjoying life</strong> since your last case?',
        extremes:      { least: 'not at all', most: 'a lot' },
        tag:           'effect',
        report_label:  'Enjoying Life',
        name:          'slider last case pain life interference'

      )
      question.choices.create
    end

    def strategy_efficacy survey
      question = survey.questions.create(
        question_type: 'slider',
        content:       'How <strong>helpful</strong> was this strategy in reducing pain?',
        extremes:      { least: 'not helpful', most: 'very helpful' },
        name:          'slider strategy efficacy'

      )
      question.choices.create
    end

    def pain_control survey
      question = survey.questions.create(
        question_type: 'slider',
        content:       'How much <strong>control</strong> did you feel you had over your pain since your last case?',
        identifier:    'pain_control',
        extremes:      { least: 'not at all', most: 'a lot' },
        name:          'slider pain control'
      )
      question.choices.create
    end

  end
end
