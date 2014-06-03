class RankingSerializer < ActiveModel::Serializer
  attributes :rankings
  # attributes :id, :username, :email, :rankings

  def rankings
    object.activities.levels
  end

end