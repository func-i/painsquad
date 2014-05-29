# == Schema Information
#
# Table name: answers
#
#  id            :integer          not null, primary key
#  submission_id :integer
#  choice_id     :integer
#  question_id   :integer
#  value         :integer
#  custom_text   :text
#  created_at    :datetime
#  updated_at    :datetime
#  bodymap_data  :text
#

class Answer < ActiveRecord::Base
  belongs_to :submission
  belongs_to :choice
  belongs_to :question

  serialize :bodymap_data, JSON

end
