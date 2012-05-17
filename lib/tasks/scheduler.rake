desc "run daily tasks"
task :daily => :environment do
 User.send_daily_email
end