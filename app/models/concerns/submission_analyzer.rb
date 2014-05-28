module SubmissionAnalyzer
  extend ActiveSupport::Concern

  included do
    after_save :set_pain_severity
  end

  def set_pain_severity
    identifier_answers = fetch_identifier_answers
    relevant_values    = parse_answers(identifier_answers)
    update(pain_severity: determine_pain_severity(relevant_values))
  end

  # finds answers with identifiers
  def fetch_identifier_answers
    result = []
    answers.each do |answer|
      result << answer if answer.question.identifier.present?
    end
    result
  end

  # nested sub-arrays of identifiers and values
  def parse_answers(answers_array)
    result = []
    answers_array.each do |answer|
      result << { value: answer.value, identifier: answer.question.identifier }
    end
    result
  end

  # returns moderate or mild, used to update model value
  def determine_pain_severity(answer_array)
    result = 0
    answer_array.each do |item|
      # unpack values
      value, identifier = item[:value], item[:identifier]
      # inverse of pain_control edge case
      (value - 100).abs if identifier == 'pain_control'
      # save result if its bigger
      result = value if value > result
    end
    result > 30 ? :moderate : :mild
  end

end
