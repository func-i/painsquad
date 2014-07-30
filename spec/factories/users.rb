# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  username                        :string(255)
#  email                           :string(255)      not null
#  crypted_password                :string(255)      not null
#  salt                            :string(255)      not null
#  created_at                      :datetime
#  updated_at                      :datetime
#  remember_me_token               :string(255)
#  remember_me_token_expires_at    :datetime
#  reset_password_token            :string(255)
#  reset_password_token_expires_at :datetime
#  reset_password_email_sent_at    :datetime
#  score                           :integer          default(0)
#  rank                            :integer          default(0)
#  award_level                     :integer          default(0)
#  cross_level                     :integer          default(0)
#  star_level                      :integer          default(0)
#  commendation                    :boolean          default(FALSE)
#  medal                           :boolean          default(FALSE)
#  healthcare_provider_email       :string(255)
#  admin                           :boolean          default(FALSE)
#  phone_number                    :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  end
end
