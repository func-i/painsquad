module Builder
  class SurveyBuilder
    VALID_SURVEYS = %w( full truncated test )

    def initialize(params = {})
      @identifier = params.fetch :identifier
      @title      = "#{@identifier.capitalize} Assessment"
      @survey     = Survey.create title: @title, identifier: @identifier
    end

    def build
      if VALID_SURVEYS.include? @identifier
        send("build_#{@identifier}_survey")
      else
        raise "Invalid survey type submitted: #{@identifier}"
      end
    end

    protected

    def build_full_survey
      Questions::Other.boolean_has_pain(@survey)
      Questions::Slider.current_pain(@survey)
      Questions::Slider.last_case_worst(@survey)
      Questions::Slider.last_case_best(@survey)
      Questions::Slider.last_case_average(@survey)
      Questions::Other.radio_pain_duration(@survey)
      Questions::Checklist.pain_cause(@survey)
      Questions::Other.bodymap(@survey)
      Questions::Slider.last_case_bothersome(@survey)
      Questions::Slider.last_case_sleep(@survey)
      Questions::Slider.last_case_activities(@survey)
      Questions::Slider.last_case_felt(@survey)
      Questions::Slider.last_case_walking(@survey)
      Questions::Slider.last_case_relationships(@survey)
      Questions::Slider.last_case_school(@survey)
      Questions::Slider.last_case_enjoyment(@survey)
      Questions::Checklist.describe_pain_grid(@survey)
      Questions::Checklist.other_symptoms_grid(@survey)
      Questions::Checklist.medication_efficacy_slider(@survey)

      # wrong spot ?
      Questions::Slider.strategy_efficacy(@survey)
      Questions::Checklist.other_strategies(@survey)
      Questions::Slider.pain_control(@survey)
      Questions::Other.textbox(@survey)
    end


    def build_truncated_survey
      Questions::Other.boolean_has_pain(@survey)
      Questions::Slider.current_pain(@survey)
      Questions::Slider.last_case_worst(@survey)
      Questions::Slider.last_case_sleep(@survey)
      Questions::Slider.last_case_activities(@survey)
      Questions::Checklist.medication_efficacy_slider(@survey)
      Questions::Checklist.other_strategies(@survey)
      Questions::Slider.pain_control(@survey)
    end

    def build_test_survey
      Questions::Other.boolean_has_pain(@survey)
      Questions::Slider.current_pain(@survey)
      Questions::Other.textbox(@survey)
    end

  end
end
