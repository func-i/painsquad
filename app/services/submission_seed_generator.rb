class SubmissionSeedGenerator

  def self.build
    new.generate
  end

  def initialize
    @user   = User.last
    @survey = Survey.full.first
  end

  def generate
    rand(1000).times do |n|
      @submission = Submission.new(has_pain: true, survey: @survey, user: @user, pain_severity: %w(mild moderate).sample) do |sub|
        random_radio_answers(sub)
        random_slider_answers(sub)
        random_checklist_answers(sub)
        # random_bodymap_answers(sub)
      end
      @submission.save!
      date = rand(30.days).ago
      @submission.update(created_at: date, updated_at: date)
    end
  end

  private

  def random_slider_answers(submission)
    Question.where(question_type: 'slider').where(survey: @survey).each do |question|
      submission.answers.build(question: question, value: rand(100))
    end
  end

  def random_radio_answers(submission)
    Question.where(question_type: 'radio').where(survey: @survey).each do |question|
      submission.answers.build(question: question, choice: question.choices.sample)
    end
  end

  def random_checklist_answers(submission)
    %w(checklist checklist-grid checklist-extra).each do |q_type|
      Question.where(question_type: q_type).where(survey: @survey).each do |question|
        if q_type == 'checklist-extra'
          rand(question.choices.count).times do |choice|
            submission.answers.build(question: question, choice: question.choices.sample, value: rand(100))
          end
        else
          rand(question.choices.count).times do |choice|
            submission.answers.build(question: question, choice: question.choices.sample)
          end
        end
      end
    end
  end

  # def random_bodymap_answers(submission)
  #   Question.where(question_type: 'slider').where(survey: @survey).each do |question|
  #     submission.answers.build(question: question, value: rand(100))
  #   end
  # end

end
