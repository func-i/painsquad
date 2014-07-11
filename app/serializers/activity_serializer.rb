class ActivitySerializer < ActiveModel::Serializer
  attributes :show_level_up_modal, :rank, :prev_rank, :display_rank

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
