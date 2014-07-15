module Ranking
  extend ActiveSupport::Concern

  included do
    after_update :update_user_ranking
  end

  def has_ranked_up
    return true if self.activities.last.level_up?
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

  def calculate_percent_complete
    ((self.score - lower_threshold).to_f / (upper_threshold - lower_threshold).to_f) * 100
  end

  def percent_completed
    calculate_percent_complete <= 0 ? 0.6 : calculate_percent_complete
  end

  def points_for_next_rank
    upper_threshold.zero? ? 0 : upper_threshold - score
  end

  def upper_threshold
    User::LEVELS.select { |i| i > self.score }.first || 0
  end

  def lower_threshold
    User::LEVELS.select { |i| i <= self.score }.last || 0
  end

  # iterates through level thresholds, increases rank if threshold crossed
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
