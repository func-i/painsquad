# == Schema Information
#
# Table name: answers
#
#  id            :integer          not null, primary key
#  submission_id :integer
#  choice_id     :integer
#  question_id   :integer
#  value         :integer
#  custom_text   :text
#  created_at    :datetime
#  updated_at    :datetime
#  data_object   :text
#

FactoryGirl.define do

  $head  = %w( neck_left neck_right jaw_left jaw_right mid_left mid_right top_right top_left )
  $torso = %w( chest_left chest_right shoulder_left shoulder_right groin abdomen )
  $arms  = %w( bicep_left bicep_right forearm_left forearm_right wrist_left wrist_right hand_left hand_right )
  $legs  = %w( ankle_left ankle_right calf_left calf_right foot_left foot_right thigh_left thigh_right knee_left knee_right )

  factory :answer do
    question
    choice
    sequence(:value) { |n| "answer value #{n}" }
    sequence(:custom_text) { |n| "custom text #{n}" }
    data_object {{
      'head'  => $head.sample(rand(3)),
      'torso' => $torso.sample(rand(3)),
      'arms'  => $arms.sample(rand(3)),
      'legs'  => $legs.sample(rand(3))
    }}
  end

end
