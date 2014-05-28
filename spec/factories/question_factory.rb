# == Schema Information
#
# Table name: questions
#
#  id            :integer          not null, primary key
#  survey_id     :integer
#  question_type :string(255)
#  content       :string(255)
#  tip           :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  identifier    :string(255)
#

FactoryGirl.define do

  factory :question do
    question_type "boolean"
    content       "Are you in pain right now?"
    ignore        { choice_count 4 }

    after(:create) do |question, evaluator|
      create_list(:choice, evaluator.choice_count, question: question)
    end
  end # => factory :question

end
