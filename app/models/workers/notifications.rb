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
      now          = Time.zone.now
      less_five    = now - 5.minutes
      current_time = now.strftime("%H:%M:%S")
      five_minutes = less_five.strftime("%H:%M:%S")
      users        = []
      User.all.each do |user|
        if user.alerts.any? && user.alerts.where(time: five_minutes..current_time).any?
          users << user
        end
      end
      users
    end

  end
end
