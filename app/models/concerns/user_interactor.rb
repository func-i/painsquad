module UserInteractor
  extend ActiveSupport::Concern

  included do
    attr_accessor :modals_to_show
    after_save :process_save_interaction
  end

  def process_save_interaction
    if self.class == Submission
      register_submission_event
      set_pain_severity
      calculate_score
    elsif self.class == Activity
      modals = ['advice']  
      user.increment!(:score, 5) if recommendation? && user.advice_score_unlocked?
    end
    self.modals_to_show = UserAwardService.analyze(self, modals)
  end

  # Submission Events
  def register_submission_event
    Activity.create(subject: self, user: user, event: 'submission_complete')
  end

  def set_pain_severity
    if has_pain && pain_severity.nil?
      PainSeverityService.analyze(self)
    end
  end

  def calculate_score
    ScoringService.analyze(self)
  end

end