# == Schema Information
#
# Table name: api_keys
#
#  id           :integer          not null, primary key
#  access_token :string(255)
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#

# tentative solution for token-based user authentication
class ApiKey < ActiveRecord::Base
  belongs_to :user

  before_create :generate_access_token

  private

  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end
end
