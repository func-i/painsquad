# == Schema Information
#
# Table name: choices
#
#  id          :integer          not null, primary key
#  question_id :integer
#  textfield   :boolean          default(FALSE)
#  content     :string(255)
#  value       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  selected    :boolean          default(FALSE)
#  disabled    :boolean          default(FALSE)
#  can_disable :boolean          default(FALSE)
#

FactoryGirl.define do

  factory :choice do
    value "Yes"
    # question
  end

end
