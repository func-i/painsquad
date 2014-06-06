class AchievementsSerializer < ActiveModel::Serializer
  attributes :ranks, :awards, :commendation, :medal, :award_level, :cross_level, :star_level

  def ranks
    object.activities.ranking_events.order('created_at DESC')
  end

  def awards
    object.activities.award_events.order('created_at DESC')
  end

end