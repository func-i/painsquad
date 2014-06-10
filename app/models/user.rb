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
#

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_one :api_key
  has_many :submissions
  has_many :activities

  has_many :favorites, class_name: Favorite
  has_many :recommendations, :through => :favorites

  enum rank: [:rookie, :junior_detective, :detective, :sergeant, :lieutenant, :chief]
  LEVELS = [ 300, 700, 1200, 2000, 2800 ]

  after_create :grant_api_access, :register_create_event
  after_update :register_event

  def first_submission!
    update(commendation: true)
  end

  def first_recommendation!
    update(medal: true)
  end

  def display_rank
    if rank.include? '_'
      rank.split('_').map(&:capitalize).join(' ')
    else
      rank.capitalize
    end
  end

  def next_level
    LEVELS.each do |level|
      if score < level
        return level - score
      else
        return 0
      end
    end
  end

  def previous_submissions
    submissions.order('updated_at DESC')
  end

  def submission_count
    activities.submission_events.count
  end

  def recommendation_count
    activities.recommendation_events.count
  end

  protected

  def grant_api_access
    create_api_key!
  end

  def register_create_event
    Activity.create(
      subject: self,
      user:    self,
      event:   'user_created'
    )
  end

  def register_event
    EventService.create_activity(self)
  end

end
