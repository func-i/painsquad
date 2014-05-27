class SurveyBuilder
  VALID_SURVEYS = %w( full truncated )

  def initialize(params = {})
    @identifier = params.fetch :identifier
    @title      = "#{@identifier.capitalize} Assessment"
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
    survey = Survey.create(title: @title, identifier: @identifier)
    [
      Builder::Other.boolean_has_pain(survey),
      Builder::Slider.current_pain(survey),
      Builder::Slider.last_case_worst(survey),
      Builder::Slider.last_case_least(survey),
      Builder::Slider.last_case_average(survey),
      Builder::Other.radio_pain_duration(survey),
      Builder::Checklist.pain_cause(survey),
      Builder::Other.bodymap(survey),
      Builder::Slider.last_case_bothersome(survey),
      Builder::Slider.last_case_sleep(survey),
      Builder::Slider.last_case_activities(survey),
      Builder::Slider.last_case_felt(survey),
      Builder::Slider.last_case_walking(survey),
      Builder::Slider.last_case_relationships(survey),
      Builder::Slider.last_case_school(survey),
      Builder::Slider.last_case_enjoyment(survey),
      Builder::Checklist.describe_pain_grid(survey),
      Builder::Checklist.other_symptoms_grid(survey),
      Builder::Checklist.medication_efficacy_slider(survey),
      Builder::Slider.strategy_efficacy(survey),
      Builder::Checklist.other_strategies(survey),
      Builder::Slider.pain_control(survey),
      Builder::Other.textbox(survey)
    ]
  end

  def build_truncated_survey
  end

end