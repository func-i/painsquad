class ActivitySerializer < ActiveModel::Serializer
  attributes :show_level_up_modal, :rank, :prev_rank, :display_rank
  attributes :show_advice_modal, :advice_name

  def show_advice_modal
    object.user.advice_score_unlocked?
  end

  def advice_name
    object.subject.title
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

end
