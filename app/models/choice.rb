class Choice < ActiveRecord::Base

  belongs_to :question
  has_many :answers

  validate :polymorphic_value

  def polymorphic_value
    if value.is_a? Integer
      errors.add(:base, "value must be between 0 and 100") unless value.between?(0, 100)
    elsif value.is_a?(TrueClass) || value.is_a?(FalseClass)
      # valid value
      return
    end
  end

end
