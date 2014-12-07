module Workers
  class Notifications
    include Delayed::RecurringJob
    TIME_RANGE = 5

    timezone  'US/Eastern'
    run_every TIME_RANGE.minutes
    priority  0

    # finds users with notification scheduled in the next 5 minutes
    def perform
      if user_lookup.any?
        user_lookup.each do |user|
          Delayed::Job.enqueue(Workers::UserNotifier.new(user.id, "This is a reminder from PainSquad that its time to complete a case!"))
          Delayed::Job.enqueue(Workers::UserNotifier.new(user.id, "This is a follow-up reminder from PainSquad to complete a case!"), run_at: 1.hour.from_now)
        end
      end
    end

    protected

    def user_lookup
      now          = Time.zone.now
      five_minutes = (now - TIME_RANGE.minutes).strftime("%H:%M:%S")
      current_time = now.strftime("%H:%M:%S")
      users        = []
      User.find_each do |user|
        if user.alerts.any? && user.alerts.where(alert_time: five_minutes..current_time).any?
          users << user
        end
      end
      users
    end 

  end
end
