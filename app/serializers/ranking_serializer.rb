class RankingSerializer < ActiveModel::Serializer
  attributes :ranks

  def ranks
    object.activities.ranking_events
  end

end