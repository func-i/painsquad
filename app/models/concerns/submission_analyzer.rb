module SubmissionAnalyzer
  extend ActiveSupport::Concern

  included do
    after_save :set_pain_severity, :if => :pain_severity_missing?
  end

  def pain_severity_missing?
    has_pain && pain_severity.nil?
  end

  def set_pain_severity
    pain_levels_array = fetch_pain_levels_from_answers
    pain_level        = pain_levels_array.max > 30 ? :moderate : :mild
    update(pain_severity: pain_level)
  end

  def fetch_pain_levels_from_answers
    pain_array = []
    answers.each do |answer|
      if answer.question.identifier.present?
        if answer.question.identifier == 'pain_control'
          pain_array << (100 - answer.value).abs
        else
          pain_array << answer.value
        end
      end
    end
    pain_array
  end

end
