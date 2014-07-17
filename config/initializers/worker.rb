# starts the recurring DJ task that runs every 5 minutes
# checks for user notifications

Workers::Notifications.schedule! if ActiveRecord::Base.connection.table_exists? 'delayed_job'
