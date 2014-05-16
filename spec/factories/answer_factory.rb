FactoryGirl.define do

  factory :answer do
    question
    choice
    # value
    # question_type "boolean"
    # content       "Are you in pain right now?"
    # ignore        { choice_count 4 }

    # after(:create) do |question, evaluator|
    #   create_list(:choice, evaluator.choice_count, question: question)
    # end
  end # => factory :question

end