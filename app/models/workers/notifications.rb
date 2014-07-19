module Workers
  class Notifications
    include Delayed::RecurringJob
    TIME_RANGE = 5

    timezone  'US/Eastern'
    run_every TIME_RANGE.minutes
    priority  0

    # finds users with notification scheduled in the next 5 minutes
    def perform
      users = user_lookup
      if users.any?
        users.each do |user|
          Delayed::Job.enqueue(Workers::UserNotifier.new(user.id, :full))
        end
      end
    end

    def user_lookup
      current_time = Time.zone.now.strftime("%H:%M:%S")
      five_minutes = 5.minutes.from_now
      users        = []
      User.all.each do |user|
        if user.alerts.any? && user.alerts.where(time: current_time..five_minutes).any?
          users << user
        end
      end
      users
    end

  end
end
