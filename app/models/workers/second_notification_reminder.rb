module Workers
  class SecondNotificationReminder

    def initialize(user_id)
      @user = User.find user_id
    end

    # finds users with notification scheduled in the next 5 minutes
    def perform
      last_submission =  @user.submissions.last
      send = false

      # Has the user created a submission
      if last_submission 
        if last_submission.created_at < Time.now - 10.minutes
          # The user has not completed a submission, so send a reminder
          send = true
        end
      else
        # => There isn't any submission, send a reminder
        send = true
      end

      if send
        Delayed::Job.enqueue(Workers::UserNotifier.new(@user.id, "This is a follow-up reminder from PainSquad to complete a case!"))
      end
    end

  end
end
