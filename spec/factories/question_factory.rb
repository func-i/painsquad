FactoryGirl.define do

  factory :question do
    choice_type "boolean"
    title       "Are you in pain right now?"
    ignore      { choice_count 4 }

    after(:create) do |question, evaluator|
      create_list(:choice, evaluator.choice_count, question: question)
    end

    # survey
  end # => factory :question

end