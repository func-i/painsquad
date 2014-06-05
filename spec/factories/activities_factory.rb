# == Schema Information
#
# Table name: activities
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  subject_id   :integer          not null
#  subject_type :string(255)      not null
#  name         :string(255)      not null
#  created_at   :datetime
#  updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
  end
end
