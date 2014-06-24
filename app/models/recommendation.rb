# == Schema Information
#
# Table name: recommendations
#
#  id                       :integer          not null, primary key
#  advice_id                :integer
#  title                    :string(255)
#  image                    :string(255)
#  duration                 :string(255)
#  context                  :string(255)
#  description              :string(255)
#  byline                   :string(255)
#  style                    :string(255)
#  parent_recommendation_id :integer
#  created_at               :datetime
#  updated_at               :datetime
#

class Recommendation < ActiveRecord::Base
  has_many :steps

  has_many :nested_recommendations, class_name: 'Recommendation', foreign_key: 'parent_recommendation_id'
  belongs_to :nested_recommendation, class_name: 'Recommendation'

  has_many :favorites, class_name: Favorite
  has_many :users, :through => :favorites

  validates :style, inclusion: %w(basic slideshow nested)
  validates :section, inclusion: %w(pharmacological psychological physical), allow_nil: true
  validates :group, inclusion: %w(prevent manage both), allow_nil: true

  scope :prevent, -> { where(group: %w(prevent both)) }
  scope :manage, -> { where(group: %w(manage both)) }

end
