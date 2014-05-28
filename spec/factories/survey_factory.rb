# == Schema Information
#
# Table name: surveys
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  identifier :string(255)
#

FactoryGirl.define do

  factory :survey do
    sequence(:title) { |n| "Survey Factory #{n}" }

    ignore { question_count 5 }
    after(:create) do |survey, evaluator|
      create_list(:question, evaluator.question_count, survey: survey)
    end

  end

end
