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

class User < ActiveRecord::Base
  include Ranking
  include PainReporting
  include AdviceScoring
  include NotificationEvents

  authenticates_with_sorcery!
  has_one :api_key
  has_many :submissions
  has_many :activities
  has_many :favorites, class_name: Favorite
  has_many :recommendations, :through => :favorites
  has_many :user_alerts
  has_many :alerts, -> { distinct }, through: :user_alerts

  validates :email, presence: true, email: true
  validates :healthcare_provider_email, presence: true, email: true
  validates :phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "invalid phone number format" }

  validates :award_level, numericality: { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 999 }
  validates :cross_level, numericality: { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 999 }
  validates :star_level,  numericality: { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 999 }

  enum rank: [:rookie, :junior_detective, :detective, :sergeant, :lieutenant, :chief]
  LEVELS = [ 300, 700, 1200, 2000, 2800 ]

  after_create :grant_api_access, :register_create_event
  after_update :create_rank_event, :if => :rank_changed?

  def level_up_event?
    self.activities.last.event == 'level_up'
  end

  def medal_event?
    last_activity = self.activities.last
    last_activity.event == 'award_achieved' && last_activity.name == 'medal'
  end

  def last_pain_report
    submissions.last.try(:pain_severity) || 'mild'
  end

  def recommendation_events
    activities.where(event: 'recommendation_complete')
  end

  def previous_submissions
    submissions.order('created_at DESC')
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
    Activity.create(subject: self, user: self, event: 'user_created')
  end

  def create_rank_event
    Activity.create(subject: self, user: self, name: rank, event: 'level_up')
  end

end
