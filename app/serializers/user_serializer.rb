class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :created_at, :updated_at, :access_token, :display_rank, :rank, :next_rank, :prev_rank, :points_for_next_rank, :score, :level_up

  def access_token
    object.api_key.access_token
  end

end