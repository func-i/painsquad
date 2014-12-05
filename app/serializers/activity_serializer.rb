class ActivitySerializer < ActiveModel::Serializer
  attributes :modals

  def modals
    modals = []

    for modal_name in object.modals_to_show
      case modal_name
      when 'advice'
        modals << {
          event_name: 'genericModal',
          options: {
            modal_content: "<strong>Your dedication to this case is impressive!</strong><p>+5 Bonus Points for trying #{advice_name}.</p>"
          }
        }
      when 'medal'
        modals << {
          event_name: 'genericModal',
          options: {
            modal_content: "<p>You’ve achieved a <strong>Medal</strong> by following the advice recommended to put pain in its place!</p> You’re a rising star around here. Keep it up and you’ll be rewarded with more awards."
          }
        }
      when 'commendation'
        modals << {
          event_name: 'genericModal',
          options: {
            modal_content: "<p>Congratulations on the <strong>Commendation</strong> for completing your first case.</p> Keep completing your reports on time and Headquarters sees more awards in your future!"
          }
        }
      when 'star'
        modals << {
          event_name: 'genericModal',
          options: {
            modal_content: "<p>Wow, you’ve completed the advice Headquarters recommended 6 times in a row! You’re dedicated to the case against pain and you’ve been awarded a <strong>Star</strong>.</p> Congratulations!"
          }
        }
      when 'award'
        modals << {
          event_name: 'genericModal',
          options: {
            modal_content: "<p>Wow recruit! You’ve completed 5 cases in a row. Because of this accomplishment, Headquarters has given you an <strong>Award</strong>!</p> Keep up the great work out there."
          }
        }
      when 'cross'
        modals << {
          event_name: 'genericModal',
          options: {
            modal_content: "<p>Hey there recruit, you’ve earned a <strong>Cross</strong>.</p> You’re doing excellent work fighting pain. We’re proud to call you one of the best and brightest on Pain Squad+. Keep up the great work!</p>"
          }
        }
      when 'healthcare_provider_notified'
        modals << {
          event_name: 'popupModal',
          options: {
            title: "Your healthcare team has been told about your pain",
            modal_content: "You can keep up with the strategies you’ve been using in the mean time"
          }
        }
      end
    end

    modals << {event_name: 'levelup', options: {image: rank, prev_rank: prev_rank, rank: display_rank}} if show_level_up_modal
    modals
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

end
