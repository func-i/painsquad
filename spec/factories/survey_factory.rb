FactoryGirl.define do

  factory :survey do
    title "Factory Survey"

    # factory :full_survey do
    #   ignore { question_count 5 }
    #   after(:create) do |user, evaluator|
    #     create_list
    #   end
    # end

  end

end