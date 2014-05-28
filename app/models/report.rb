class Report < ActiveRecord::Base
  belongs_to :user
  belongs_to :submission
  enum pain_severity: [:mild, :moderate, :severe]
end
