class RankingSerializer < ActiveModel::Serializer
  attributes :ranks

  def ranks
    object.activities.ranking_events
  end

  def is_unlocked
    [true, false].sample
  end

end