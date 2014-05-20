FactoryGirl.define do

  factory :survey do
    sequence(:title) { |n| "Survey Factory #{n}" }

    ignore { question_count 5 }
    after(:create) do |survey, evaluator|
      create_list(:question, evaluator.question_count, survey: survey)
    end

  end

end