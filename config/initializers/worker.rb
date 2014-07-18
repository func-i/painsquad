# starts the recurring DJ task that runs every 5 minutes
# checks for user notifications
if ActiveRecord::Base.connection.table_exists? 'delayed_jobs'
  Workers::Notifications.schedule!
end
