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
#

class User < ActiveRecord::Base
  include ActivityFeed

  authenticates_with_sorcery!
  has_one :api_key
  has_many :submissions
  has_many :activities

  has_many :favorites, class_name: Favorite
  has_many :recommendations, :through => :favorites

  enum rank: [:rookie, :junior_detective, :detective, :sergeant, :lieutenant, :chief]

  after_create :grant_api_access
  after_update :delegate_awards

  def display_rank
    if rank.include? '_'
      rank.split('_').map(&:capitalize).join(' ')
    else
      rank.capitalize
    end
  end

  def previous_submissions
    submissions.order('updated_at DESC').take 5
  end

  def submission_count
    activities.submission_events.count
  end

  def advice_count
    activities.recommendation_events.count
  end

  protected

  def grant_api_access
    create_api_key!
  end

  def delegate_awards
    AwardService.new(self).perform
  end

end
