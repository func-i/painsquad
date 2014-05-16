FactoryGirl.define do

  factory :submission do
    title "Factory Submission"
    ignore { question_count 5 }
    after(:create) do |submission, evaluator|
      create_list(:question, evaluator.question_count, submission: submission)
    end
  end

  # factory :survey do
  #   title "Factory Survey"
  #   ignore { question_count 5 }
  #   after(:create) do |survey, evaluator|
  #     create_list(:question, evaluator.question_count, survey: survey)
  #   end
  # end

end