# == Schema Information
#
# Table name: recommendations
#
#  id         :integer          not null, primary key
#  advice_id  :integer
#  title      :string(255)
#  image      :string(255)
#  duration   :string(255)
#  context    :string(255)
#  favorite   :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recommendation do
  end
end
