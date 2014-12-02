class ActivitySerializer < ActiveModel::Serializer
  attributes :rank, :prev_rank, :display_rank,
    :show_level_up_modal, :show_advice_modal, :advice_name, :show_medal_modal

  def show_advice_modal
    object.user.advice_score_unlocked?
  end

  def advice_name
    if object.is_a? Submission
      nil
    else
      object.subject.title
    end
  end

  def show_level_up_modal
    object.user.level_up_event?
  end

  def rank
    object.user.rank
  end

  def prev_rank
    object.user.prev_rank
  end

  def display_rank
    object.user.display_rank
  end

  def show_medal_modal
    object.user.medal_event?
  end

end
