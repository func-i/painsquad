module Workers
  class Notifications
    include   Delayed::RecurringJob
    run_every 1.minutes
    timezone  'US/Eastern'
    priority  0

    def perform
      debug
      info
    end

    def info
      Rails.logger.info '-----------------------------'
      Rails.logger.info '-----------------------------'
      Rails.logger.info 'DOING STUFFF RECURRING DeLAYED JOB LOL'
      Rails.logger.info 'DOING STUFFF RECURRING DeLAYED JOB LOL'
      Rails.logger.info 'DOING STUFFF RECURRING DeLAYED JOB LOL'
      Rails.logger.info 'DOING STUFFF RECURRING DeLAYED JOB LOL'
      Rails.logger.info '-----------------------------'
      Rails.logger.info '-----------------------------'
    end

    def debug
      Rails.logger.debug '-----------------------------'
      Rails.logger.debug '-----------------------------'
      Rails.logger.debug 'DOING STUFFF RECURRING DeLAYED JOB LOL'
      Rails.logger.debug 'DOING STUFFF RECURRING DeLAYED JOB LOL'
      Rails.logger.debug 'DOING STUFFF RECURRING DeLAYED JOB LOL'
      Rails.logger.debug 'DOING STUFFF RECURRING DeLAYED JOB LOL'
      Rails.logger.debug '-----------------------------'
      Rails.logger.debug '-----------------------------'
    end


  end
end