class AchievementsSerializer < ActiveModel::Serializer
  attributes :ranks, :awards, :commendation, :medal, :award_level, :cross_level, :star_level

  # TODO: clean this stuff up, it is bugged
  def ranks
    # object.activities.ranking_events.order('created_at ASC').last
    object.activities.ranking_events.order('created_at ASC')
  end

  def awards
    # object.activities.award_events.order('created_at ASC').last
    object.activities.award_events.order('created_at ASC')
  end

end