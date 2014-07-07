class SubmissionSeedGenerator

  # simulates completing 100 full surveys
  def self.build
    new.generate
  end

  def initialize
    @user       = User.last
    @survey     = Survey.full.first
    @submission = Submission.new(has_pain: true, survey: @survey, user: @user)
  end

  def generate
    100.times do |n|
    end
  end

end