class UserInteractorService

  def self.process(args)
    new(args).process
  end

  def initialize(args)
    @user               = args[:user]
    @interaction_object = args[:interaction_object]
    @interaction_type   = args[:interaction_type]
  end

  def process
    if submission_interaction?
      register_submission_event
      set_pain_severity
      set_score
    elsif advice_interaction?
      binding.pry
    end
  end

  private

  def submission_interaction?
    @interaction_type == :submission_complete
  end

  def advice_interaction?
    @interaction_type == :recommendation_complete
  end

  def register_submission_event
    Activity.create(subject: @interaction_object, user: @user, event: @submission_interaction)
  end

  def set_pain_severity
    if @interaction_object.has_pain && @interaction_object.pain_severity.nil?
      PainSeverityService.analyze(@interaction_object)
    end
  end

  def set_score
    ScoringService.analyze(@interaction_object)
  end

end
