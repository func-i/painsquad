class AchievementsSerializer < ActiveModel::Serializer
  attributes :ranks, :commendation, :commendation_date, :medal, :medal_date, :award_level, :latest_award_date, :cross_level, :latest_cross_date, :star_level, :latest_star_date

  def ranks
    object.activities.ranking_events.order('created_at ASC')
  end

  def commendation_date
    object.activities.where(name: 'commendation').first.try(:created_at)
  end

  def medal_date
    object.activities.where(name: 'medal').first.try(:created_at)
  end

  def latest_award_date
    object.activities.where(name: 'award').last.try(:created_at)
  end

  def latest_cross_date
    object.activities.where(name: 'cross').last.try(:created_at)
  end

  def latest_star_date
    object.activities.where(name: 'star').last.try(:created_at)
  end

end