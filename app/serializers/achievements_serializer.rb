class AchievementsSerializer < ActiveModel::Serializer
  attributes :ranks, :commendation, :medal, :award_level, :cross_level, :star_level

  def ranks
    object.activities.ranking_events
  end

  def commendation
    !object.submission_count.zero?
  end

  def medal
    !object.recommendation_count.zero?
  end

end