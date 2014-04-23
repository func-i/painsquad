FactoryGirl.define do

  factory :question do
    choice_type "boolean"
    content     "Are you in pain right now?"
    survey
  end # => factory :question

end