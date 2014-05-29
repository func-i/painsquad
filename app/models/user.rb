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
#

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_one :api_key
  has_many :submissions

  has_many :recommendation_favorites, class_name: RecommendationFavorites
  has_many :recommendations, :through => :recommendation_favorites

  after_create :grant_api_access

  def previous_submissions
    submissions.order('updated_at DESC').take 5
  end

  protected

  def grant_api_access
    create_api_key!
  end
end
