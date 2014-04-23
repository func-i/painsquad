FactoryGirl.define do

  factory :survey do
    title "Factory Survey"
    ignore { question_count 5 }
    after(:create) do |survey, evaluator|
      create_list(:question, evaluator.question_count, survey: survey)
    end

  end

end