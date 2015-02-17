module ActivityHelper

  def activity_css_class(activity)
    case activity.event
    when "submission_complete"
      "submission_complete #{activity.subject.pain_severity}"
    else
      activity.event
    end
  end

end