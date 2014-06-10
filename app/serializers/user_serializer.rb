class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :created_at, :updated_at, :access_token, :display_rank, :rank, :score, :next_level

  def access_token
    object.api_key.access_token
  end

end