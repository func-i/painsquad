class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_one :api_key

  after_create :grant_api_access

  protected

  def grant_api_access
    create_api_key!
  end

end
