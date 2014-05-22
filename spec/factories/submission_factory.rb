# == Schema Information
#
# Table name: submissions
#
#  id         :integer          not null, primary key
#  survey_id  :integer
#  created_at :datetime
#  updated_at :datetime
#  has_pain   :boolean
#

FactoryGirl.define do

  factory :submission do
    survey
    has_pain true

    ignore { answer_count 5 }
    after(:create) do |submission, evaluator|
      create_list(:answer, evaluator.answer_count, submission: submission)
    end
  end

end
