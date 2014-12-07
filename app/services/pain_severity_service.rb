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
    pain_severity = if @submission.current_pain_answer.value > 30 
      # => Notify the user 1 hour from now asking to follow up with the pain
      Delayed::Job.enqueue(Workers::UserNotifier.new(@submission.user.id, "Hey recruit. You reported pain an hour ago. Tell us how you are doing now!"))
      :moderate 
    else
      :mild
    end

    @submission.update(pain_severity: pain_severity)
  end
end
