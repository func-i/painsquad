module Ranking
  extend ActiveSupport::Concern

  included do
  end

  # todo: flag if user has ranked up
  def level_up
    # self.rank.changed?
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

  def points_for_next_rank
    points_needed = 0
    User::LEVELS.each do |level|
      if score < level
        return points_needed = level - score
      end
    end
    points_needed
  end

  def last_rank?
    self[:rank] == 5
  end

end
