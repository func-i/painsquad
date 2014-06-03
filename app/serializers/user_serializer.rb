class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :created_at, :updated_at, :access_token, :rank

  def access_token
    object.api_key.access_token
  end
end