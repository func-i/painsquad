class SubmissionAnalyzer

  def self.determine_pain_severity(answers)
    new(answers).perform
  end

  def initialize(answers)
    @answers       = answers
    @pain_severity = parse_answers
  end

  def perform
    @pain_severity
  end

  protected

  def parse_answers
    @answers.each do |answer|
      binding.pry
    end
  end

end
