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

# Choice model - a Question has many choices
class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :answers

  validate :polymorphic_value

  def polymorphic_value
    if value.is_a? Integer
      unless value.between?(0, 100)
        errors.add(:base, 'value must be between 0 and 100')
      end
    end
  end
end
