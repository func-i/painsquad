class SubmissionService
  attr_accessor :submission, :user

  def initialize(submission, user)
    @submission = submission
    @user       = user
    save_user
  end

  def create
    if @submission.save
      set_score
      save_event
    end
  end

  protected

  def save_user
    @submission.user = @user
  end

  def set_score
    ScoringService.calculate(@submission, @user)
  end

  def save_event
    Activity.create(subject: @submission, user: @user, event: 'submission_complete')
  end

end
