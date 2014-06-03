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
#  score                           :integer
#

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_one :api_key
  has_many :submissions
  has_many :activities

  has_many :favorites, class_name: Favorite
  has_many :recommendations, :through => :favorites

  enum rank: [:rookie, :junior_detective, :detective, :sergeant, :lieutenant, :chief]

  after_create :grant_api_access, :create_initial_activity
  after_update :create_rank_activity

  def previous_submissions
    submissions.order('updated_at DESC').take 5
  end

  def display_rank
    if rank.include? '_'
      rank.split('_').map(&:capitalize).join(' ')
    else
      rank.capitalize
    end
  end

  protected

  def create_initial_activity
    Activity.create(
      subject: self,
      user:    self,
      name:    'user_created'
    )
  end

  def grant_api_access
    create_api_key!
  end

  def create_rank_activity
    if rank_changed?
      Activity.create(
        subject: self,
        user:    self,
        name:    'level_up'
      )
    end
  end

end
