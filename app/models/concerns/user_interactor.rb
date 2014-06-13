module UserInteractor
  extend ActiveSupport::Concern

  included do
    after_save :process_save_interaction
    # after_update :process_update_interaction
  end

  def process_save_interaction
    if self.class == Submission
      register_submission_event
      set_pain_severity
      calculate_score
    elsif self.class == Activity
      if event == 'recommendation_complete'
        handle_advice_events
      end
    end
  end

  def process_update_interaction
    if self.class == User
      analyze_user_score
    end
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


  # Activity Events
  def handle_advice_events
    debug "inside handle_advice_events"
  end

  def debug(msg)
    logger.info "----------------------#{msg}"
  end

  # User Events
  def analyze_user_score
    AwardService.analyze(self)
  end

end
