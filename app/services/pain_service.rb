class PainService

  def self.analyze(submission)
    new(submission).perform
  end

  def initialize(submission)
    @submission = submission
  end

  def perform
    set_pain_severity
  end

  private

  def set_pain_severity
    pain_levels = fetch_pain_levels_from_answers
    pain_level  = pain_levels.max > 30 ? :moderate : :mild
    @submission.update(pain_severity: pain_level)
  end

  def fetch_pain_levels_from_answers
    pain_array = []
    @submission.answers.each do |answer|
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
