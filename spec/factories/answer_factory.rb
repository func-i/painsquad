FactoryGirl.define do

  factory :answer do
    question
    choice
    sequence(:value) { |n| "answer value #{n}" }
    sequence(:custom_text) { |n| "custom text #{n}" }
    data_object {{
      'head'  => ["mid_left"],
      'torso' => ["chest_left", "mid_back"],
      'arms'  => ["elbow_left", "bicep_right"],
      'legs'  => []
    }}
  end

end
