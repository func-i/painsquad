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
