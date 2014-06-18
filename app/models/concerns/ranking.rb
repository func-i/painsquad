module Ranking
  extend ActiveSupport::Concern

  included do
  end

  def display_rank(submitted_rank = nil)
    rank = submitted_rank || self.rank
    rank.include?('_') ? rank.split('_').map(&:capitalize).join(' ') : rank.capitalize
  end

  def next_rank
    display_rank(User.ranks.key(self[:rank] + 1))
  end

  # TODO: fix this method, not correct
  def points_for_next_rank
    User::LEVELS.each do |level|
      if score < level
        return level - score
      end
    end
  end

  def last_rank?
    self[:rank] == 5
  end

end
