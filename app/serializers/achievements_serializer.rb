class AchievementsSerializer < ActiveModel::Serializer
  attributes :ranks
  attributes :awards

  def ranks
    object.activities.ranking_events
  end

  def awards
    object.activities.award_events
  end

end