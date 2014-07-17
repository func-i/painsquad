module Workers
  class Notifications
    include Delayed::RecurringJob
    TIME_RANGE = 5

    timezone  'US/Eastern'
    run_every 1.minutes
    # run_every TIME_RANGE.minutes
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
      current_time = Time.now
      five_minutes = 5.minutes.from_now
      binding.pry
      User.where('morning_alert between ? and ? OR evening_alert between ? and ?',
        current_time, five_minutes, current_time, five_minutes)
    end

  end
end
