class PainSeverityService

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
    @submission.update(pain_severity: (@submission.current_pain_answer.value > 30 ? :moderate : :mild))
  end
end
