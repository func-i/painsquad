module Ranking
  extend ActiveSupport::Concern

  included do
    after_update :update_user_ranking
  end

  def has_ranked_up
    self.activities.take(3).each do |activity|
      return true if activity.event == 'level_up'
    end
    false
  end

  def display_rank(submitted_rank = nil)
    rank = submitted_rank || self.rank
    rank.include?('_') ? rank.split('_').map(&:capitalize).join(' ') : rank.capitalize
  end

  def next_rank
    display_rank(User.ranks.key(self[:rank] + 1))
  end

  def prev_rank
    display_rank(User.ranks.key(self[:rank] - 1))
  end

  def last_rank?
    self[:rank] == 5
  end

  def points_for_next_rank
    points_needed = 0
    User::LEVELS.each do |level|
      if score < level
        return points_needed = level - score
      end
    end
    points_needed
  end

  # iterates through level thresholds, levels User if threshold crossed
  def update_user_ranking
    return if last_rank? || self.changes[:score].nil? || self.changes[:rank].present?
    old_score, new_score = self.changes[:score]
    User::LEVELS.each do |threshold|
      if old_score < threshold && new_score >= threshold
        self.update(rank: self[:rank] + 1)
      end
    end
  end

end
