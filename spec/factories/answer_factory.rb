FactoryGirl.define do

  HEAD  = %w( neck_left neck_right jaw_left jaw_right mid_left mid_right top_right top_left )
  TORSO = %w( chest_left chest_right shoulder_left shoulder_right groin abdomen )
  ARMS  = %w( bicep_left bicep_right forearm_left forearm_right wrist_left wrist_right hand_left hand_right )
  LEGS  = %w( ankle_left ankle_right calf_left calf_right foot_left foot_right thigh_left thigh_right knee_left knee_right )

  factory :answer do
    question
    choice
    sequence(:value) { |n| "answer value #{n}" }
    sequence(:custom_text) { |n| "custom text #{n}" }
    data_object {{
      'head'  => HEAD.sample(rand(3)),
      'torso' => TORSO.sample(rand(3)),
      'arms'  => ARMS.sample(rand(3)),
      'legs'  => LEGS.sample(rand(3))
    }}
  end

end
